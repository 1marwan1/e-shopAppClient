import 'package:flutter/material.dart';

import '../constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.name,
    required this.multiLines,
    required this.controller,
    this.password = false,
    this.outline = true,
  }) : super(key: key);
  final String name;
  final bool multiLines;
  final bool outline;
  final bool password;
  final TextEditingController controller;
  final UnderlineInputBorder underlineInputBorder = const UnderlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor, width: 1));
  final OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
      borderSide: BorderSide(
    color: kPrimaryColor,
    width: 1,
  ));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: TextFormField(
        controller: controller,
        maxLines: multiLines ? 3 : 1,
        minLines: multiLines ? 3 : 1,
        cursorColor: kPrimaryColor,
        obscureText: password,
        keyboardType: TextInputType.text,
        validator: (val) => val!.isEmpty ? "$name is Empty" : null,
        decoration: InputDecoration(
          hintText: name,
          //    hintStyle: textStyleSecondary,
          // prefix: const Text("R.Y"),
          enabledBorder: outline ? outlineInputBorder : underlineInputBorder,
          focusedBorder: outline ? outlineInputBorder : underlineInputBorder,
        ),
      ),
    );
  }
}
