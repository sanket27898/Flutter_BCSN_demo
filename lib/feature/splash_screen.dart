import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bcsn_demo/app.dart';
import 'package:flutter_bcsn_demo/app_route.dart';
import 'package:flutter_bcsn_demo/common/resources/colors.dart';
import 'package:flutter_bcsn_demo/common/resources/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      _redirectToDashboard();
    });
  }

  _redirectToDashboard() {
    context.router.pushNamed(ROUTE_SWAP_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getSplash(),
    );
  }

  Widget getSplash() {
    return Container(
      width: double.infinity,
      color: BCSNColors.primary,
      child: Center(
          child: Text(
        "BCSN APP",
        style:
            TextStyles.regularTextStyle.copyWith(color: BCSNColors.whiteColor),
      )),
    );
  }
}
