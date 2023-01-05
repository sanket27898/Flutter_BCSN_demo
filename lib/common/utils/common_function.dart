import 'package:flutter/material.dart';

dismissKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

bool isSVGImage(String? path) {
  if (path == null) return false;

  try {
    if (path.isNotEmpty) {
      var extension =
      path.substring(path.lastIndexOf("."), path.length).toLowerCase();
      return extension.contains("svg");
    }
  } catch (e) {
    return false;
  }

  return false;
}