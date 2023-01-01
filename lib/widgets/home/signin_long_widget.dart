import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eshop_app_client/widgets/button_widget.dart';
import 'package:eshop_app_client/widgets/textfile_widget.dart';

import '../../constants.dart';

class SinginOrLoginwidget extends StatelessWidget {
  const SinginOrLoginwidget(
      {super.key,
      required this.titleName,
      required this.backName,
      required this.onTap,
      required this.onaBack,
      this.emailConttroll,
      this.nameConttroll,
      this.passwordConttroll});
  final TextEditingController? nameConttroll;
  final TextEditingController? emailConttroll;
  final TextEditingController? passwordConttroll;
  final VoidCallback onTap;
  final VoidCallback onaBack;
  final String titleName;
  final String backName;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: kPrimaryColor,
        // ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/E-shopApp_foreground.png",
                  width: Get.width * 0.8,
                  height: Get.width * 0.8,
                  color: kPrimaryColor,
                ),
                Text(
                  titleName,
                  style: GoogleFonts.getFont('Almarai').copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                //  myTextTitleProduct("السعر"),
                if (nameConttroll != null)
                  TextFormFieldWidget(
                    controller: nameConttroll!,
                    name: "name",
                    multiLines: false,
                    outline: true,
                  ),
                TextFormFieldWidget(
                  controller: emailConttroll!,
                  name: "Email",
                  multiLines: false,
                  outline: true,
                ),
                //    myTextTitleProduct("الاسم"),
                TextFormFieldWidget(
                  controller: passwordConttroll!,
                  name: "Password",
                  password: true,
                  multiLines: false,
                ),
                ButtonWidget(
                  voidCallBakElveatateButtonGM: onTap,
                  nameButton: titleName,
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: onaBack,
                  child: Text(
                    backName,
                    style: GoogleFonts.getFont('Almarai'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
