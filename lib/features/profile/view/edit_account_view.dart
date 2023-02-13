import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ozare/consts.dart';
import 'package:ozare/features/auth/widgets/input_field.dart';
import 'package:ozare/features/profile/bloc/profile_bloc.dart';
import 'package:ozare/features/profile/widgets/widgets.dart';
import 'package:ozare/common/widgets/widgets.dart';
import 'package:ozare/models/models.dart';

class EditAccountView extends StatefulWidget {
  const EditAccountView({super.key, required this.oUser});

  final OUser oUser;

  @override
  State<EditAccountView> createState() => _EditAccountViewState();
}

class _EditAccountViewState extends State<EditAccountView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    firstNameController.text = widget.oUser.firstName;
    lastNameController.text = widget.oUser.lastName;
    emailController.text = widget.oUser.email;
    phoneController.text = widget.oUser.phoneNumber ?? '';
    dobController.text = widget.oUser.dob ?? '';
    genderController.text = widget.oUser.gender?.toString() ?? '';
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    genderController.dispose();
    super.dispose();
  }

  DateTime selectedDate = DateTime(2000);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                InputField(
                  controller: firstNameController,
                  hintText: 'Enter your first name',
                  labelText: 'First Name',
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: lastNameController,
                  hintText: 'Enter your last name',
                  labelText: 'Last Name',
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: dobController,
                  hintText: DateFormat.yMd().format(selectedDate),
                  labelText: 'Date of Birth',
                  readOnly: true,
                  suffix: IconButton(
                    icon: (const Icon(
                      Icons.calendar_today_outlined,
                      color: primary1Color,
                    )),
                    onPressed: () {
                      getDateFromUser();
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Align(
                    alignment: Alignment.centerLeft, child: Text('Gender')),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GenderPicker(
                      label: 'Male',
                      onTap: () {
                        setState(() {
                          genderController.text = '1';
                        });
                      },
                      isActive: genderController.text == '1',
                    ),
                    GenderPicker(
                      label: 'Female',
                      onTap: () {
                        setState(() {
                          genderController.text = '0';
                        });
                      },
                      isActive: genderController.text == '0',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: phoneController,
                  hintText: 'Enter your phone number',
                  labelText: 'Phone Number',
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  readOnly: true,
                ),
                const SizedBox(height: 32),
                OButton(
                  label: 'Update',
                  onTap: () {
                    log('Update button tapped');
                    // Check if the user has changed any data

                    // If the user has changed any data, then update the user
                    context
                        .read<ProfileBloc>()
                        .add(ProfileUpdateRequested(OUser(
                          uid: widget.oUser.uid,
                          email: widget.oUser.email,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          dob: dobController.text,
                          phoneNumber: phoneController.text,
                          gender: int.parse(genderController.text),
                        )));
                  },
                ),
                SizedBox(height: size.height * 0.2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getDateFromUser() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1950),
        lastDate: DateTime(2010));
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        dobController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }
}
