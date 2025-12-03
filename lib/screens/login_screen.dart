import 'package:flutter/material.dart';
import 'package:simple_application/components/generic_input_field.dart';
import 'package:simple_application/components/generic_text_button.dart';
import 'package:simple_application/utils/login_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void handleLoginPressed(BuildContext context) {
    loginUser(
      context,
      formKey: _formKey,
      username: usernameController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Hello",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Let's sign you in",
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const Text(
              "welcome back\nYou've been missed!",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Image.asset(
              "assets/images/silver_ball.jpg",
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // use a form field when u need a validator
                  // regular TextField does NOT have a validator property
                  GenericInputField(
                    autoCorrect: true,
                    controller: usernameController,
                    validator: (value) => validateUserName(value),
                    hintText: "Enter your username...",
                  ),
                  SizedBox(height: 10),
                  GenericInputField(
                    isObscureTextField: true,
                    controller: passwordController,
                    validator: (value) => validatePassword(value),
                    hintText: "Enter your password...",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GenericTextButton(
                  text: "Log in",
                  onPressed: () => handleLoginPressed(context),
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
