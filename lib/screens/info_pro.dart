import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eshop_app_client/constants.dart';

class InfoDevloper extends StatelessWidget {
  const InfoDevloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: detailsAppBar(context),
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: Get.width * 0.5,
                height: Get.width * 0.5,
                child: Image.asset(
                  "images/E-shopApp_foreground.png",
                  color: kPrimaryColor,
                )),
            const SizedBox(height: 10),
            const Text(
              "اعداد",
              style: TextStyle(fontSize: 18, color: kPrimaryColor),
            ),
            const SizedBox(height: 5),
            const Text(
              "عمرو امين",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 5),
            const Text(
              "وائل الوائلي",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              "اشراف",
              style: TextStyle(fontSize: 18, color: kPrimaryColor),
            ),
            const Text(
              "د. محمود الفراص",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              "قسم تكنولوجيا التعليم والمعلومات",
              style: TextStyle(fontSize: 18, color: kPrimaryColor),
            ),
            const SizedBox(height: 5),
            const Text(
              "كلية التربية - جامعة إب",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        " حول المطور",
      ),
    );
  }
}
