import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/common/utils/utils.dart';
import 'package:ozare/consts.dart';
import 'package:ozare/features/auth/bloc/auth_bloc.dart';
import 'package:ozare/features/auth/widgets/widgets.dart';
import 'package:ozare/models/ouser.dart';

import '../../../common/dialogs/dialogs.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.04),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Create account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              Form(
                key: formKey,
                child: Expanded(
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
                          controller: emailController,
                          hintText: 'Enter your email address',
                          labelText: 'Email Address',
                          textInputType: TextInputType.emailAddress,
                          validator: (val) => Validators.emailValidator(val!),
                          inputFormators: [
                            InputFormators.spaceNotAllowed,
                          ],
                        ),
                        const SizedBox(height: 16),
                        InputField(
                          controller: passwordController,
                          hintText: 'Enter your password',
                          labelText: 'Password',
                          isPassword: true,
                          maxLines: 1,
                          textInputType: TextInputType.visiblePassword,
                          validator: (val) =>
                              Validators.passwordValidator(val!),
                          inputFormators: [
                            InputFormators.spaceNotAllowed,
                          ],
                        ),
                        const SizedBox(height: 16),
                        InputField(
                          controller: confirmPasswordController,
                          hintText: 'Enter your password again',
                          labelText: 'Confirm Password',
                          isPassword: true,
                          maxLines: 1,
                          validator: (val) =>
                              Validators.confirmPasswordValidator(
                                  passwordController.text, val!),
                          textInputType: TextInputType.visiblePassword,
                          inputFormators: [
                            InputFormators.spaceNotAllowed,
                          ],
                        ),
                        SizedBox(height: size.height * 0.3),
                      ],
                    ),
                  ),
                ),
              ),

              ///
              const SizedBox(height: 24),
              OButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(AuthSignupRequested(
                          ouser: OUser(
                            uid: null,
                            email: emailController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                          ),
                          password: passwordController.text,
                        ));
                  } else {
                    showSnackBar(context, "All fields are required");
                  }
                },
                label: 'Register',
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<AuthBloc>()
                          .add(const AuthLoginPageRequested());
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: primary2Color,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
