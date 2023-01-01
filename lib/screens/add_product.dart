import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eshop_app_client/constants.dart';
import 'package:eshop_app_client/data/models/product.dart';
import 'package:eshop_app_client/screens/home_screen.dart';
import 'package:eshop_app_client/widgets/button_widget.dart';

import '../widgets/show_loading.dart';
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

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController priceConttroll = TextEditingController();

  TextEditingController titleConttroll = TextEditingController();

  TextEditingController subTitleConttroll = TextEditingController();

  TextEditingController descriptionConttroll = TextEditingController();

  var title, note, imageurl;
  late Reference ref;
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
                myTextTitleProduct("السعر"),
                TextFormFieldWidget(
                  controller: priceConttroll,
                  name: "50",
                  multiLines: false,
                  outline: true,
                ),
                myTextTitleProduct("الاسم"),
                TextFormFieldWidget(
                  controller: titleConttroll,
                  name: "سوار رياضي",
                  multiLines: false,
                ),
                myTextTitleProduct("المحتوى"),
                TextFormFieldWidget(
                  controller: subTitleConttroll,
                  name: "وصف قصير...",
                  multiLines: false,
                ),
                myTextTitleProduct("الوصف"),
                TextFormFieldWidget(
                  controller: descriptionConttroll,
                  name: "وصف طويل",
                  multiLines: true,
                ),
                if (imageProfile != null) Image.file(imageProfile!),
                Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                          voidCallBakElveatateButtonGM: () {
                            getLostData(imageSource: ImageSource.camera);
                          },
                          nameButton: "camera"),
                    ),
                    Expanded(
                      child: ButtonWidget(
                          voidCallBakElveatateButtonGM: () {
                            getLostData(imageSource: ImageSource.gallery);
                          },
                          nameButton: "gallery"),
                    ),
                  ],
                ),
                ButtonWidget(
                    voidCallBakElveatateButtonGM: () {
                      addProductMethod(context);
                    },
                    nameButton: "اضافة")
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

  final ImagePicker _picker = ImagePicker();

  File? imageProfile;

  // Capture a photo
  Future<void> getLostData({required ImageSource imageSource}) async {
    try {
      final image = await _picker.pickImage(source: imageSource);
      if (image == null) {
        return;
      }
      File? img = File(image.path);
      // ignore: unnecessary_null_comparison
      if (img == null) {
        return;
      }
      //imageProfile = img;
      var rand = Random().nextInt(100000);
      var imagename = "$rand${basename(image.path)}";
      ref = FirebaseStorage.instance.ref("images").child(imagename);
      setState(() {
        imageProfile = img;
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.details);
      }
    }
  }

  AppBar homeAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      title: Text(
        'اضافة منتج',
        style: GoogleFonts.getFont('Almarai'),
      ),
      centerTitle: true,
    );
  }

  addProductMethod(context) async {
    if (imageProfile == null) {
      // ignore: avoid_single_cascade_in_expression_statements
      return AwesomeDialog(
          context: context,
          title: "هام",
          body: const Text("please choose Image"),
          dialogType: DialogType.error)
        ..show();
    }
    if (imageProfile != null) {
      showLoading(context);
      await ref.putFile(imageProfile!);
      imageurl = await ref.getDownloadURL();
      cloudFirebase!
          .addDocProduct(Product(
        id: FirebaseAuth.instance.currentUser?.uid,
        title: titleConttroll.text,
        subTitle: subTitleConttroll.text,
        price: int.parse(priceConttroll.text),
        image: imageurl,
        description: descriptionConttroll.text,
      ))
          .then((value) {
        Navigator.of(context).pop();
        // ignore: avoid_single_cascade_in_expression_statements
        AwesomeDialog(
            context: context,
            title: "تمت الاضافة بنجاح",
            body: const Text("تمت الاضافة بنجاح"),
            dialogType: DialogType.success)
          ..show();
      }).catchError((e) {
        Navigator.of(context).pop();
        // ignore: avoid_single_cascade_in_expression_statements
        AwesomeDialog(
            context: context,
            title: "$e",
            body: Text("$e"),
            dialogType: DialogType.error)
          ..show();
      });
    }
  }
}
