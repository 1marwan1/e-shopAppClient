import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eshop_app_client/main.dart';
import 'package:eshop_app_client/widgets/home/signin_long_widget.dart';

import '../screens/home_screen.dart';
import '../widgets/show_loading.dart';

class SigninScreenAuth extends StatelessWidget {
  SigninScreenAuth({super.key});

  final TextEditingController emailConttroll = TextEditingController();
  final TextEditingController passwordConttroll = TextEditingController();
  final TextEditingController nameConttroll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SinginOrLoginwidget(
      backName: "تسجيل الدخول",
      titleName: 'انشاء حساب',
      passwordConttroll: passwordConttroll,
      emailConttroll: emailConttroll,
      nameConttroll: nameConttroll,
      onTap: () async {
        UserCredential response = await signUp(context);
        if (response != null) {
          await FirebaseFirestore.instance.collection("users").add(
              {"username": nameConttroll.text, "email": emailConttroll.text});
          sharedPreferences!.setBool("auth", true);
          sharedPreferences!.setString("email", emailConttroll.text);

          Get.offAll(() => HomeScreen(), curve: Curves.easeInBack);
        } else {
          if (kDebugMode) {
            print(nameConttroll.text);
            print(emailConttroll.text);
            print(passwordConttroll.text);
            print("Sign Up Faild");
          }
        }

        print("===================");
      },
      onaBack: () {
        Get.back();
      },
    );
  }

  signUp(BuildContext context) async {
    try {
      showLoading(context);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailConttroll.text, password: passwordConttroll.text);
      Navigator.of(context).pop();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Navigator.of(context).pop();
        AwesomeDialog(
            context: context,
            title: "Error",
            body: Text(
              "Password is to weak",
              style: TextStyle(
                fontFamily: "Cairo",
                fontSize: 16,
              ),
            ))
          ..show();
      } else if (e.code == 'email-already-in-use') {
        Navigator.of(context).pop();
        AwesomeDialog(
            context: context,
            title: "Error",
            body: Text(
              "The account already exists for that email",
              style: TextStyle(
                fontFamily: "Cairo",
                fontSize: 16,
              ),
            ))
          ..show();
      } else {
        Navigator.of(context).pop();
        print(e);
        AwesomeDialog(
            context: context,
            title: e.toString(),
            dialogType: DialogType.error,
            body: const Text(
              "تاكـد من الانترنت",
              style: TextStyle(
                fontFamily: "Cairo",
                fontSize: 16,
              ),
            ))
          ..show();
      }
    } catch (e) {
      Navigator.of(context).pop();
      print(e);
      AwesomeDialog(
          context: context,
          title: e.toString(),
          body: Text(
            "$e",
            style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 16,
            ),
          ))
        ..show();
    }
  }
}
