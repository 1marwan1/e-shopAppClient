import 'dart:io';

import 'package:flutter/material.dart';

import '../../constants.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key, this.size, this.image, this.imagefile})
      : super(key: key);

  final Size? size;
  final String? image;
  final File? imagefile;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      height: size!.width * 0.8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size!.width * 0.7,
            width: size!.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          imagefile == null
              ? FadeInImage.assetNetwork(
                  placeholder: "images/E-shopApp_foreground.png",
                  fit: BoxFit.cover,
                  image: image!,
                  height: size!.width * 0.75,
                  width: size!.width * 0.75,
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(
                        "images/notimage.png",
                        height: size!.width * 0.75,
                        width: size!.width * 0.75,
                        fit: BoxFit.fill,
                      ))
              : Image.file(
                  imagefile!,
                  height: size!.width * 0.75,
                  width: size!.width * 0.75,
                  fit: BoxFit.cover,
                ),
        ],
      ),
    );
  }
}
