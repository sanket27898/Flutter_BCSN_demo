import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bcsn_demo/common/utils/constants.dart';
import 'package:flutter_bcsn_demo/common/widget/common_widget.dart';
import 'package:flutter_bcsn_demo/data/swap_currency_model.dart';
import 'package:flutter_bcsn_demo/provider/swap_currency_provider.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';

import 'base_repository.dart';

abstract class SwapCurrencyRepository {
  Future<SwipCurrencyModel> getSwapCurrencyList();
}

class SwapCurrencyRepositoryImp extends BaseRepository
    implements SwapCurrencyRepository {
  @override
  Future<SwipCurrencyModel> getSwapCurrencyList() async {
    var responseModel = SwipCurrencyModel.getDefaultModel();

    try {
      if (!await isConnected()) {
        throw const SocketException("Please check your internet connection");
      }

      final response = await dio.get(
        apiFrontSwapPairs,
      );
      var responseJson = returnResponse(response);

      responseModel = SwipCurrencyModel.fromJson(responseJson);

      return responseModel;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        responseModel.message = "Looks like you're having connectivity issue.";
      } else {
        responseModel = SwipCurrencyModel.fromJson(returnResponseError(e));
      }

      return responseModel;
    } on SocketException {
      handleSocketException(getSwapCurrencyList, null,
          provider: Provider.of<SwapCurrencyProvider>(
              OneContext.instance.context!,
              listen: false));
    } catch (e) {
      logger.d(e);
    }

    return responseModel;
  }
}
