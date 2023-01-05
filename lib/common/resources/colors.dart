import 'package:flutter/material.dart';

class BCSNColors {
  static const themeColor = Color(0xff080808);
  static const primary = Color(0xff3461ff);
  static const accent = Color(0xff3461ff);
  static const greyColor = Color(0xffF3EFF0);
  static const hintColor = Color(0xffAAAAAA);

  static const textColor = Color(0xff000000);
  static const whiteColor = Color(0xffFFFFFF);
  static const alertRedColor = Color(0xffFF6F59);

  static const appBarGradient = LinearGradient(
    begin: Alignment(-1.0, -3.0),
    end: Alignment(2.4, -2.0),
    colors: [Color(0xFF3461ff), Color(0xff8454eb)],
  );

  static const swapBtnGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [Color(0xFF8b38f7), Color(0xfff48662)],
  );
}
