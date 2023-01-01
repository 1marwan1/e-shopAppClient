import 'dart:io';

class Product {
  int? price;
  String? title, subTitle, description, image, id;
  File? imagefile;
  String? docid;

  Product(
      {this.id,
      this.price,
      this.title,
      this.subTitle,
      this.description,
      this.image,
      this.docid,
      this.imagefile});
  factory Product.fromJson(Map<String, dynamic> json, String doc) {
    return Product(
      id: json['id'],
      price: int.parse(json['price'].toString()),
      title: json['title'].toString(),
      subTitle: json['subTitle'].toString(),
      description: json['description'].toString(),
      image: json['image'].toString(),
      docid: doc,
    );
  }
}

// list of products
List<Product> products = [
  // Product(
  //   id: 1,
  //   price: 59,
  //   title: "سماعات لاسلكية",
  //   subTitle: "جودة صوت عالية",
  //   image: "images/airpod.png",
  //   description:
  //       "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.",
  // ),
  // Product(
  //   id: 2,
  //   price: 1099,
  //   title: "جهاز موبايل",
  //   subTitle: "وأصبح للموبايل قوة",
  //   image: "images/mobile.png",
  //   description:
  //       "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.",
  // ),
  // Product(
  //   id: 3,
  //   price: 39,
  //   title: "نظارات ثلاثية الأبعاد",
  //   subTitle: "لنقلك للعالم الافتراضي",
  //   image: "images/class.png",
  //   description:
  //       "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.",
  // ),
  // Product(
  //   id: 4,
  //   price: 56,
  //   title: "سماعات",
  //   subTitle: "لساعات استماع طويلة",
  //   image: "images/headset.png",
  //   description:
  //       "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.",
  // ),
  // Product(
  //   id: 5,
  //   price: 68,
  //   title: "مسجل صوت",
  //   subTitle: "سجل اللحظات المهمة حولك",
  //   image: "images/speaker.png",
  //   description:
  //       "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.",
  // ),
  // Product(
  //   id: 6,
  //   price: 39,
  //   title: "كاميرات كمبيوتر",
  //   subTitle: "بجودة ودقة صورة عالية",
  //   image: "images/camera.png",
  //   description:
  //       "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا.",
  // ),
];
