import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bcsn_demo/app_route.gr.dart';
import 'package:flutter_bcsn_demo/repositories/base_repository.dart';
import 'package:flutter_bcsn_demo/repositories/swap_currency_repository.dart';
import 'package:flutter_bcsn_demo/webservice/DioSettings.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> getServices() async {
  /// Async packages
  var preferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(preferences);

  ///Sync packages
  getIt.registerFactory(() => Connectivity());
  var dio = Dio();
  var logger = Logger();
  getIt.registerSingleton(dio);
  getIt.registerSingleton(logger);
  getIt.registerSingleton<AppRouter>(AppRouter());

  /// Repositories
  getIt.registerFactory<BaseRepository>(() => BaseRepository());
  getIt.registerFactory<SwapCurrencyRepository>(
      () => SwapCurrencyRepositoryImp());

  /// Init custom DIO settings for network calls
  DioSettings(dio: dio, logger: logger, preferences: preferences);
}
