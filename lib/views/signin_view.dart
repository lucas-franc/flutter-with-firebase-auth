import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/utils/color_utils.dart';
import 'package:flutter_firebase_auth/views/forget_password_view.dart';
import 'package:flutter_firebase_auth/views/home_view.dart';
import 'package:flutter_firebase_auth/views/signup_view.dart';
import 'package:flutter_firebase_auth/widgets/custom_button.dart';
import 'package:flutter_firebase_auth/widgets/custom_textfield.dart';
import 'package:flutter_firebase_auth/widgets/logo_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("E3F4F4"),
              hexStringToColor("D2E9E9"),
              hexStringToColor("C4DFDF")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.1,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                logoWidget(
                  "assets/images/logo_image.png",
                ),
                const SizedBox(
                  height: 30,
                ),
                customTextField(
                  "Enter username",
                  Icons.person_outline,
                  false,
                  emailTextController,
                ),
                const SizedBox(
                  height: 30,
                ),
                customTextField(
                  "Enter password",
                  Icons.lock_outline,
                  true,
                  passwordTextController,
                ),
                const SizedBox(
                  height: 8,
                ),
                forgetPassword(context),
                const SizedBox(
                  height: 20,
                ),
                customButton("Sign In", context, true, onTapSignIn),
                signOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapSignIn() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailTextController.text,
            password: passwordTextController.text)
        .then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          ),
        )
        .onError(
          (error, stackTrace) => print(error),
        );
  }

  Row signOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account?",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpView(),
              ),
            );
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      height: 35,
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ForgetPasswordView(),
            ),
          );
        },
        child: const Text(
          "Forget your password?",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
