import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eshop_app_client/auth/login.dart';
import 'package:eshop_app_client/constants.dart';
import 'package:eshop_app_client/data/remote_servers/get_product.dart';
import 'package:eshop_app_client/screens/home_screen.dart';
import 'package:eshop_app_client/screens/splash_screen.dart';

//import 'package:flutter_localizations/flutter_localizations.dart';
SharedPreferences? sharedPreferences;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  //FirebaseMessaging.instance.requestPermission();
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // FirebaseMessaging.onBackgroundMessage(backgroudMessage);
  // FirebaseMessaging.onMessageOpenedApp.listen((message) {
  //   print(
  //       "  ${message.notification!.title ?? "not title"} ${message.notification!.body ?? "not body"}");
  // });

  runApp(MyApp());
}

Future backgroudMessage(RemoteMessage message) async {
  print(
      "  ${message.notification!.title ?? "not title"} ${message.notification!.body ?? "not body"}");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Electrical Store',
        theme: ThemeData(
          textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
          primaryColor: kPrimaryColor,
          accentColor: kPrimaryColor,
          shadowColor: kPrimaryColor,
        ),
        // Arabic RTL
        localizationsDelegates: [
          // GlobalCupertinoLocalizations.delegate,
          // GlobalMaterialLocalizations.delegate,
          // GlobalWidgetsLocalizations.delegate,
        ],
        // supportedLocales: [Locale("ar", "AE")],
        // locale: Locale("ar", "AE"),

        home: const SplashView(), //LoginScreenAuth() //HomeScreen(), //
      ),
    );
  }
}
