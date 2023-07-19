import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/utils/color_utils.dart';
import 'package:flutter_firebase_auth/views/signin_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: logoutButton(context, () {
        FirebaseAuth.instance.signOut().then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInView(),
                ),
              ),
            );
      })),
    );
  }

  Container logoutButton(BuildContext context, Function onTap) {
    return Container(
      width: 100,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
      ),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return hexStringToColor("E3F4F4");
              }
              return hexStringToColor("C4DFDF");
            },
          ),
        ),
        child: const Text(
          "Logout",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
