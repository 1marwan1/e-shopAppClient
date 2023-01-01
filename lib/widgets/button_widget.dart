import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eshop_app_client/constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      required this.voidCallBakElveatateButtonGM,
      required this.nameButton,
      this.colorInversion = false,
      this.height = 45})
      : super(key: key);
  final double height;
  final VoidCallback voidCallBakElveatateButtonGM;
  final String nameButton;
  final bool colorInversion;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: height,
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: voidCallBakElveatateButtonGM,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorInversion ? Colors.white : kPrimaryColor,
            foregroundColor: colorInversion ? kPrimaryColor : Colors.white,
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(color: kPrimaryColor, width: 1)),
          ),
          child: Text(
            nameButton,
            style: GoogleFonts.getFont('Almarai')
                .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
