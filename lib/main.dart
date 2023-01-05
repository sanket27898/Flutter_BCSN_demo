import 'package:flutter/material.dart';
import 'package:flutter_bcsn_demo/app.dart';
import 'package:flutter_bcsn_demo/di/di_service.dart';

///Global connectivity var
var isConnected = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await getServices();
  runApp(const BCSNApp());
}
