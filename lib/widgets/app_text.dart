import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key, required this.text, this.color, this.fontWeight, this.size});

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
      ),
    );
  }
}
