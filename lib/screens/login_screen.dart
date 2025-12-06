import 'package:flutter/material.dart';
import 'package:simple_application/components/generic_input_field.dart';
import 'package:simple_application/components/generic_text_button.dart';
import 'package:simple_application/components/spacing.dart';
import 'package:simple_application/utils/login_utils.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final Uri _url = Uri.parse("https://google.com");
  final phoneNumber = "2094908830";

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
      body: GestureDetector(
        onTap: () => {FocusManager.instance.primaryFocus?.unfocus()},
        child: SingleChildScrollView(
          child: Container(
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
                VerticalSpacing(10),
                Image.asset(
                  "assets/images/illustration.png",
                  fit: BoxFit.cover,
                  height: 200,
                ),
                VerticalSpacing(10),
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
                      VerticalSpacing(10),
                      GenericInputField(
                        isObscureTextField: true,
                        controller: passwordController,
                        validator: (value) => validatePassword(value),
                        hintText: "Enter your password...",
                      ),
                    ],
                  ),
                ),
                VerticalSpacing(10),
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
                    Text(
                      "Sign In below ⬇️",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialMediaButton.twitter(
                          color: Colors.blue,
                          url: "https://www.twitter.com/singin",
                        ),
                        SocialMediaButton.google(
                          color: Colors.deepOrange,
                          url: "https://google.com/singin",
                        ),
                        SocialMediaButton.facebook(
                          color: Colors.blue,
                          url: "https://facebook.com/login",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
