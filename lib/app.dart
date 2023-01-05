import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bcsn_demo/di/di_service.dart';
import 'package:flutter_bcsn_demo/main.dart';
import 'package:flutter_bcsn_demo/provider/swap_currency_provider.dart';
import 'package:flutter_bcsn_demo/repositories/base_repository.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';

import 'app_route.gr.dart';

class BCSNApp extends StatefulWidget {
  const BCSNApp({Key? key}) : super(key: key);

  static List<ConnectivityErrorModel> listOfPendingFunctions = [];
  @override
  _BCSNAppState createState() => _BCSNAppState();
}

class _BCSNAppState extends State<BCSNApp> {
  final botToastBuilder = BotToastInit();
  Connectivity connectivity = Connectivity();

  final _appRouter = getIt.get<AppRouter>();

  @override
  void initState() {
    super.initState();

    connectivity.onConnectivityChanged.listen((event) {
      isConnected = event != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SwapCurrencyProvider(),
        ),
      ],
      child: MaterialApp.router(
        title: "BCSN APP",
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          child = botToastBuilder(context, child);
          child = OneContext().builder(context, child);

          return child;
        },
        supportedLocales: const [Locale('en', '')],
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
