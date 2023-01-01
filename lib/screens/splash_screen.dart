import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eshop_app_client/constants.dart';
import 'package:eshop_app_client/main.dart';
import 'package:eshop_app_client/screens/home_screen.dart';

import '../auth/login.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SplashViewBody(),
    );
  }
}

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  SplashViewBodyState createState() => SplashViewBodyState();
}

class SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    fadingAnimation =
        Tween<double>(begin: .8, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    goToNextView();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          "images/E-shopApp_foreground.png",
          width: Get.width * 0.7,
          height: Get.width * 0.7,
        ),
        Text(
          "E-ShopApp",
          style: GoogleFonts.getFont('Almarai').copyWith(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ]),
    );
  }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 3), () async {
      // if (sharedPreferences!.getBool("auth") == null ||
      //     sharedPreferences!.getBool("auth") == false) {
      //   Get.offAll(() => LoginScreenAuth());
      // } else {
      Get.offAll(() => HomeScreen());
      // }
    });
  }
}
