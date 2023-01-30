import 'package:flutter/material.dart';
import 'package:ozare/consts.dart';
import 'package:ozare/features/auth/view/signin_page.dart';
import 'package:ozare/features/auth/widgets/widgets.dart';

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

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InputField(
                        controller: firstNameController,
                        hintText: 'Enter your first name',
                        labelText: 'First Name',
                        isPassword: false,
                      ),
                      const SizedBox(height: 16),
                      InputField(
                        controller: lastNameController,
                        hintText: 'Enter your last name',
                        labelText: 'Last Name',
                        isPassword: false,
                      ),
                      const SizedBox(height: 16),
                      InputField(
                        controller: emailController,
                        hintText: 'Enter your email address',
                        labelText: 'Email Address',
                        isPassword: false,
                      ),
                      const SizedBox(height: 16),
                      InputField(
                        controller: passwordController,
                        hintText: 'Enter your password',
                        labelText: 'Password',
                        isPassword: true,
                      ),
                      const SizedBox(height: 16),
                      InputField(
                        controller: confirmPasswordController,
                        hintText: 'Enter your password again',
                        labelText: 'Confirm Password',
                        isPassword: true,
                      ),
                      SizedBox(height: size.height * 0.3),
                    ],
                  ),
                ),
              ),

              ///
              const SizedBox(height: 24),
              OButton(
                onTap: () {},
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SigninPage()));
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
