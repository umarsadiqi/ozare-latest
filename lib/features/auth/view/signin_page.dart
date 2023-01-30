import 'package:flutter/material.dart';
import 'package:ozare/consts.dart';
import 'package:ozare/features/auth/view/signup_page.dart';
import 'package:ozare/features/auth/widgets/widgets.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                    text: const TextSpan(
                  text: 'Let\'s \nGet ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: 'Started!',
                      style: TextStyle(
                        color: primary2Color,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )),
              ),
              SizedBox(height: size.height * 0.08),

              // Email Field
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

              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: primary2Color,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              ///
              SizedBox(height: size.height * 0.08),
              OButton(
                onTap: () {},
                label: 'Login',
              ),
              const SizedBox(height: 16),

              /// Or Continue With
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Or Continue With',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// Social Buttons

              Row(
                children: [
                  Expanded(
                      child: OButton.icon(
                          onTap: () {}, iconPath: 'assets/icons/google.svg')),
                  const SizedBox(width: 24),
                  Expanded(
                      child: OButton.icon(
                          onTap: () {}, iconPath: 'assets/icons/apple.svg')),
                ],
              ),

              ///
              SizedBox(height: size.height * 0.08),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
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
                              builder: (context) => const SignupPage()));
                    },
                    child: const Text(
                      'Register',
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
