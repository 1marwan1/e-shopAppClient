import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eshop_app_client/constants.dart';
import 'package:eshop_app_client/main.dart';
import 'package:eshop_app_client/data/models/product.dart';
import 'package:eshop_app_client/widgets/button_widget.dart';

import '../widgets/textfile_widget.dart';

//  Product(
//     id: 4,
//     price: 56,
//     title: "سماعات",
//     subTitle: "لساعات استماع طويلة",
//     image: "images/headset.png",
//     description:
//         "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.",
//   ),

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController priceConttroll = TextEditingController();

  TextEditingController titleConttroll = TextEditingController();

  TextEditingController subTitleConttroll = TextEditingController();

  TextEditingController descriptionConttroll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: homeAppBar(),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myTextTitleProduct("اسم المتجر"),
                TextFormFieldWidget(
                  controller: priceConttroll,
                  name: "التضامن",
                  multiLines: false,
                  outline: true,
                ),
                myTextTitleProduct("رقم الهاتف"),
                TextFormFieldWidget(
                  controller: titleConttroll,
                  name: "",
                  multiLines: false,
                ),
                myTextTitleProduct("العنوان"),
                TextFormFieldWidget(
                  controller: subTitleConttroll,
                  name: "",
                  multiLines: false,
                ),
                ButtonWidget(
                    voidCallBakElveatateButtonGM: () {
                      sharedPreferences!.setString("name", priceConttroll.text);
                      sharedPreferences!
                          .setString("phone", titleConttroll.text);
                      sharedPreferences!
                          .setString("address", subTitleConttroll.text);
                      Navigator.of(context).pop();
                    },
                    nameButton: "حفظ")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text myTextTitleProduct(String title) {
    return Text(
      title,
      style: GoogleFonts.getFont('Almarai')
          .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      title: Text(
        ' اعدادات الحساب',
        style: GoogleFonts.getFont('Almarai'),
      ),
      centerTitle: true,
    );
  }
}
