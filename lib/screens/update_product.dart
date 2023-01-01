import 'dart:io';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eshop_app_client/constants.dart';
import 'package:eshop_app_client/data/models/product.dart';
import 'package:eshop_app_client/widgets/button_widget.dart';
import 'package:path/path.dart';
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
CollectionReference notesref = FirebaseFirestore.instance.collection("product");

class UpdateProduct extends StatefulWidget {
  @override
  State<UpdateProduct> createState() => _UpdateProductState();
  Product product;

  UpdateProduct({required this.product});
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController priceConttroll = TextEditingController();

  TextEditingController titleConttroll = TextEditingController();

  TextEditingController subTitleConttroll = TextEditingController();

  TextEditingController descriptionConttroll = TextEditingController();
  Reference? ref;

  var title, note, imageurl;
  editNotes(context) async {
    if (imageProfile == null) {
      if (true) {
        showLoading(context);

        await notesref.doc(widget.product.docid).update({
          "price": priceConttroll.text,
          "title": titleConttroll.text,
          "subTitle": subTitleConttroll.text,
          "description": descriptionConttroll.text,
        }).then((value) {
          for (int i = 0; i < products.length; i++) {
            if (products[i].docid == widget.product.docid) {
              products[i].price = int.parse(priceConttroll.text);
              products[i].title = titleConttroll.text;
              products[i].subTitle = subTitleConttroll.text;
              products[i].description = descriptionConttroll.text;
            }
          }
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "تمت عملية التعديل بنجاح",
              body: const Text("تمت عملية التعديل بنجاح"),
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
    } else {
      if (true) {
        showLoading(context);

        await ref?.putFile(imageProfile!);
        imageurl = await ref?.getDownloadURL();
        await notesref.doc(widget.product.docid).update({
          "price": priceConttroll.text,
          "title": titleConttroll.text,
          "subTitle": subTitleConttroll.text,
          "description": descriptionConttroll.text,
          "image": imageurl,
        }).then((value) {
          for (int i = 0; i < products.length; i++) {
            if (products[i].docid == widget.product.docid) {
              products[i].price = int.parse(priceConttroll.text);
              products[i].title = titleConttroll.text;
              products[i].subTitle = subTitleConttroll.text;
              products[i].image = widget.product.image;
              products[i].imagefile = imageProfile;
              products[i].description = descriptionConttroll.text;
            }
          }
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

  @override
  void initState() {
    super.initState();
    priceConttroll.text = widget.product.price.toString();
    titleConttroll.text = widget.product.title.toString();
    subTitleConttroll.text = widget.product.subTitle.toString();
    descriptionConttroll.text = widget.product.description.toString();
    imageProfile = widget.product.imagefile;
  }

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
                imageProfile != null
                    ? Image.file(imageProfile!)
                    : FadeInImage.assetNetwork(
                        placeholder: "images/E-shopApp_foreground.png",
                        fit: BoxFit.cover,
                        image: widget.product.image!,
                        height: 160.0,
                        width: 200.0,
                        imageErrorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                              "images/notimage.png",
                              height: 160.0,
                              width: 200.0,
                              fit: BoxFit.fill,
                            )),
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
                      Get.defaultDialog(
                          title: "هل انت متاكد تريد المتابعة",
                          content: Row(
                            children: [
                              Expanded(
                                child: ButtonWidget(
                                  nameButton: "yes",
                                  voidCallBakElveatateButtonGM: () {
                                    Navigator.pop(context);
                                    // for (int i = 0; i < products.length; i++) {
                                    //   if (products[i].id == widget.product.id) {
                                    //     products[i].price =
                                    //         int.parse(priceConttroll.text);
                                    //     products[i].title = titleConttroll.text;
                                    //     products[i].subTitle =
                                    //         subTitleConttroll.text;
                                    //     products[i].image =
                                    //         widget.product.image;
                                    //     products[i].imagefile = imageProfile;
                                    //     products[i].description =
                                    //         descriptionConttroll.text;
                                    //   }
                                    // }
                                    editNotes(context);
                                    // Navigator.pop(context);
                                  },
                                ),
                              ),
                              Expanded(
                                child: ButtonWidget(
                                  nameButton: "no",
                                  voidCallBakElveatateButtonGM: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                            // ButtonWidget(),
                          ));
                    },
                    nameButton: "تعديل")
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
        'تعديل منتج',
        style: GoogleFonts.getFont('Almarai'),
      ),
      centerTitle: true,
    );
  }
}
