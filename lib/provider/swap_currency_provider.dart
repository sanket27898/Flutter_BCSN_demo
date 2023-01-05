import 'package:flutter/material.dart';
import 'package:flutter_bcsn_demo/common/widget/common_widget.dart';
import 'package:flutter_bcsn_demo/data/swap_currency_model.dart';
import 'package:flutter_bcsn_demo/di/di_service.dart';
import 'package:flutter_bcsn_demo/repositories/swap_currency_repository.dart';

class SwapCurrencyProvider with ChangeNotifier {
  ///API Model

  SwipCurrencyModel _swipCurrencyModel = SwipCurrencyModel.getDefaultModel();

  SwipCurrencyModel get swipCurrencyModel => _swipCurrencyModel;

  ///Lazy load repository
  final SwapCurrencyRepository _swapCurrencyRepository =
      getIt.get<SwapCurrencyRepository>();

  ///Reset data
  resetData() {
    _swipCurrencyModel = SwipCurrencyModel.getDefaultModel();
  }

  Future<SwipCurrencyModel?> getSwapCurrencyList({force = false}) async {
    try {
      if ((_swipCurrencyModel.status ?? false) && !force) {
        return _swipCurrencyModel;
      }
      _swipCurrencyModel = await _swapCurrencyRepository.getSwapCurrencyList();
      return _swipCurrencyModel;
    } catch (e) {
      logger.d(e);
    }
    return null;
  }
}
