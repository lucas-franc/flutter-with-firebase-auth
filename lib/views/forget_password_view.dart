import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/utils/color_utils.dart';
import 'package:flutter_firebase_auth/views/home_view.dart';
import 'package:flutter_firebase_auth/widgets/custom_button.dart';
import 'package:flutter_firebase_auth/widgets/custom_textfield.dart';
import 'package:flutter_firebase_auth/widgets/logo_widget.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  TextEditingController emailTextController = TextEditingController();
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
                  "Enter email",
                  Icons.person_outline,
                  false,
                  emailTextController,
                ),
                const SizedBox(
                  height: 30,
                ),
                customButton(
                    'Reset Password', context, false, onTapResetPassword),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapResetPassword() {
    FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailTextController.text);
  }
}
