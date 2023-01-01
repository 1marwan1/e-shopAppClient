import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eshop_app_client/constants.dart';
import 'package:eshop_app_client/data/models/product.dart';
import 'package:eshop_app_client/screens/home_screen.dart';
import 'package:eshop_app_client/screens/update_product.dart';
import 'package:eshop_app_client/widgets/details/details_body.dart';

import '../widgets/button_widget.dart';
import '../widgets/show_loading.dart';

CollectionReference notesref = FirebaseFirestore.instance.collection("product");

class DetailsScreen extends StatelessWidget {
  final Product? product;

  const DetailsScreen({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(context),
      body: SingleChildScrollView(
        child: DetailsBody(
          product: product!,
        ),
      ),
    );
  }

  AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(right: kDefaultPadding),
        icon: const Icon(
          Icons.arrow_back,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      // actions: [
      //   IconButton(
      //       onPressed: () {
      //         Get.defaultDialog(
      //             title: "هل انت متاكد تريد الحــذف",
      //             content: Row(
      //               children: [
      //                 Expanded(
      //                   child: ButtonWidget(
      //                     nameButton: "yes",
      //                     voidCallBakElveatateButtonGM: () async {
      //                       Navigator.pop(context);
      //                       showLoading(context);
      //                       cloudFirebase!.deleteDocProduct(product!)
      //                         ..then((value) {
      //                           Navigator.of(context).pop();
      //                           // ignore: avoid_single_cascade_in_expression_statements
      //                           AwesomeDialog(
      //                               context: context,
      //                               title: "تمت  عملية الحــذف بنجاح",
      //                               body:
      //                                   const Text("تمت  عملية الحــذف بنجاح"),
      //                               dialogType: DialogType.success)
      //                             ..show();
      //                         }).catchError((e) {
      //                           Navigator.of(context).pop();
      //                           // ignore: avoid_single_cascade_in_expression_statements
      //                           AwesomeDialog(
      //                               context: context,
      //                               title: "$e",
      //                               body: Text("$e"),
      //                               dialogType: DialogType.error)
      //                             ..show();
      //                         });
      //                       // for (int i = 0; i < products.length; i++) {
      //                       //   if (products[i].id == product!.id) {
      //                       //     await notesref.doc(products[i].docid).delete();
      //                       //     await FirebaseStorage.instance
      //                       //         .refFromURL(products[i].image!)
      //                       //         .delete()
      //                       //         .then((value) {
      //                       //       products.removeAt(i);
      //                       //       Navigator.pop(context);
      //                       //     });
      //                       //   }
      //                       // }
      //                     },
      //                   ),
      //                 ),
      //                 Expanded(
      //                   child: ButtonWidget(
      //                     nameButton: "no",
      //                     voidCallBakElveatateButtonGM: () {
      //                       Navigator.pop(context);
      //                     },
      //                   ),
      //                 ),
      //               ],
      //               // ButtonWidget(),
      //             ));
      //       },
      //       icon: const Icon(Icons.delete, color: Colors.red)),
      //   IconButton(
      //       onPressed: () {
      //         Navigator.of(context).push(MaterialPageRoute(
      //             builder: (context) => UpdateProduct(product: product!)));
      //       },
      //       icon: const Icon(Icons.edit, color: kPrimaryColor)),
      // ],
      //
      centerTitle: false,
      title: Text(
        'رجوع',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
