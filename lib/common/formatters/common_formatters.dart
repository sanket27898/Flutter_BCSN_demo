
import 'package:flutter/services.dart';

TextInputFormatter get getDecimalFormatter => FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'));