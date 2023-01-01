import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:eshop_app_client/auth/singin.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eshop_app_client/main.dart';
import '../data/remote_servers/get_product.dart';
import '../screens/home_screen.dart';

import '../widgets/home/signin_long_widget.dart';
import '../widgets/show_loading.dart';

class LoginScreenAuth extends StatelessWidget {
  LoginScreenAuth({super.key});

  final TextEditingController emailConttroll = TextEditingController();
  final TextEditingController passwordConttroll = TextEditingController();
  signIn(BuildContext context) async {
    // var formdata = formstate.currentState;
    // print(formdata!.validate());
    // if (formdata.validate()) {
    //   formdata.save();
    try {
      showLoading(context);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailConttroll.text, password: passwordConttroll.text);
      Navigator.of(context).pop();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.of(context).pop();
        AwesomeDialog(
            context: context,
            title: "Error",
            body: Text(
              "No user found for that email",
              style: TextStyle(
                fontFamily: "Cairo",
                fontSize: 16,
              ),
            ))
          ..show();
      } else if (e.code == 'wrong-password') {
        Navigator.of(context).pop();
        AwesomeDialog(
            context: context,
            title: "Error",
            body: Text(
              "Wrong password provided for that user",
              style: TextStyle(
                fontFamily: "Cairo",
                fontSize: 16,
              ),
            ))
          ..show();
      } else {
        Navigator.of(context).pop();
        print("Not Vaild");
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
      //}
    }
  }

  @override
  Widget build(BuildContext context) {
    return SinginOrLoginwidget(
      titleName: "تسجيل الدخول",
      backName: 'انشاء حساب',
      passwordConttroll: passwordConttroll,
      emailConttroll: emailConttroll,
      onTap: () async {
        var user = await signIn(context);
        if (user != null) {
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(
          //         builder: (context) => myHomePige()));
          sharedPreferences!.setBool("auth", true);
          sharedPreferences!.setString("email", emailConttroll.text);

          Get.offAll(() => HomeScreen(), curve: Curves.easeInBack);
          // Navigator.of(context).pushReplacement(slidReghtCurved(
          //     myHomePige(),
          //     curve: Curves.easeInBack));
          //slidReght

        }

        //
      },
      onaBack: () async {
        // await startGetmethod();
        Get.to(() => SigninScreenAuth());
      },
    );
  }
}
