import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eshop_app_client/data/models/product.dart';

Future<void> startGetmethod() async {
  // if (products.isEmpty) {
  CollectionReference notesref =
      FirebaseFirestore.instance.collection("product");
  print("============");
  var responsBody = await notesref
      // .where("id", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
      .get();
  print("============");
  responsBody.docs.forEach((QueryDocumentSnapshot<dynamic> element) {
    print("============");
    print(element.data());
    print("============");
    // products.add(Product.fromJson(element.data(), element.id));
  });
//  }
  for (int i = 0; i < products.length; i++) print(products[i].title);
}
