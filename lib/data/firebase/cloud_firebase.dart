import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:eshop_app_client/data/models/product.dart';

class CloudFirebase {
  CloudFirebase();
  final CollectionReference productsref =
      FirebaseFirestore.instance.collection("product");

  Future<void> getAllDocProduct() async {
    if (products.isEmpty) {
      var responsBody = await productsref.get();

      for (var element in responsBody.docs) {
        products.add(Product.fromJson(
            element.data() as Map<String, dynamic>, element.id));
      }
    }
  }

  Future<void> addDocProduct(Product product) async {
    await productsref.add({
      "price": product.price,
      "title": product.title,
      "subTitle": product.subTitle,
      "description": product.description,
      "image": product.image,
      "id": FirebaseAuth.instance.currentUser?.uid
    }).then((value) {
      products.insert(0, product);
    });
  }

  Future<void> updateDocProductWithImage(Product product) async {
    await productsref.doc(product.docid).update({
      "price": product.price,
      "title": product.title,
      "subTitle": product.subTitle,
      "description": product.description,
      "image": product.image,
      "id": FirebaseAuth.instance.currentUser?.uid
    }).then((value) {
      for (var value in products) {
        if (value.docid == product.docid) {
          value = product;
        }
      }
    });
  }

  Future<void> updateDocProduct(Product product) async {
    await productsref.doc(product.docid).update({
      "price": product.price,
      "title": product.title,
      "subTitle": product.subTitle,
      "description": product.description,
      "id": FirebaseAuth.instance.currentUser?.uid
    }).then((value) {
      for (var value in products) {
        if (value.docid == product.docid) {
          value = product;
        }
      }
    });
  }

  Future<void> deleteDocProduct(Product product) async {
    print(product.docid);
    await productsref.doc(product.docid).delete();
    products.remove(product);
    // if (product.image != "") {
    //   await FirebaseStorage.instance
    //       .refFromURL(product.image!)
    //       .delete()
    //       .then((value) async {});333
    // }
  }
}
