import 'package:flutter/material.dart';
import 'package:flutter_bcsn_demo/common/formatters/common_formatters.dart';
import 'package:flutter_bcsn_demo/common/resources/colors.dart';
import 'package:flutter_bcsn_demo/common/resources/dimen.dart';
import 'package:flutter_bcsn_demo/common/resources/images.dart';
import 'package:flutter_bcsn_demo/common/resources/styles.dart';
import 'package:flutter_bcsn_demo/common/widget/common_appbar.dart';
import 'package:flutter_bcsn_demo/common/widget/common_widget.dart';
import 'package:flutter_bcsn_demo/common/widget/custom_dropdown_btn.dart';
import 'package:flutter_bcsn_demo/data/swap_currency_model.dart';
import 'package:flutter_bcsn_demo/provider/swap_currency_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SwapScreen extends StatefulWidget {
  const SwapScreen({Key? key}) : super(key: key);

  @override
  State<SwapScreen> createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  ///Provider
  late SwapCurrencyProvider _swapCurrencyProvider;
  TextEditingController _youSellController = TextEditingController();
  TextEditingController _youBuyController = TextEditingController();

  SwapSingleCurrencyModel? cryptoCurrency;

  List<SwapSingleCurrencyModel>? cryptoCurrencyList = [];

  bool openYouSellMenuDropdown = false;
  bool openYouBuyMenuDropdown = false;

  double feeAmount = 0;

  @override
  Widget build(BuildContext context) {
    _swapCurrencyProvider = Provider.of<SwapCurrencyProvider>(context);
    return mainLayout;
  }

  get mainLayout => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              CommonAppBar(),
              spacingVerticalXLarge,
              FutureBuilder<SwipCurrencyModel?>(
                  future: _swapCurrencyProvider.getSwapCurrencyList(),
                  builder: (context, snap) {
                    if (snap.hasData && (snap.data?.status ?? false)) {
                      return mainBodyLayout;
                    }
                    return circularScreenLoader();
                  }),
            ],
          ),
        ),
      );

  get mainBodyLayout => Column(
        children: [
          getYouSellTextField(),
          spacingVerticalXLarge,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
            child: Row(
              children: [
                Icon(Icons.swap_horiz),
                spacingHorizontalSmall,
                Text(
                    "1 ${cryptoCurrency?.quoteSymbol} = ${1 / (cryptoCurrency?.price ?? 0)} ${cryptoCurrency?.baseSymbol}")
              ],
            ),
          ),
          spacingVerticalXLarge,
          getYouBuyTextField(),
          spacingVerticalXLarge,
          summaryFeeBox(),
          spacingVerticalXLarge,
          getSwapBtn(title: "Swap"),
          spacingVerticalXLarge,
        ],
      );

  Widget getYouSellTextField() {
    if (cryptoCurrencyList?.isEmpty ?? false) {
      cryptoCurrencyList = _swapCurrencyProvider.swipCurrencyModel.data;
      if (cryptoCurrency == null) {
        cryptoCurrency = _swapCurrencyProvider.swipCurrencyModel.data?.first;
      }
    }
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: Spacing.large),
      padding: const EdgeInsets.only(left: Spacing.small),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusConst.buttonRadius),
          border: Border.all(color: BCSNColors.hintColor)),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "",
                    hintStyle: TextStyles.textFieldStyle
                        .copyWith(color: BCSNColors.hintColor),
                    focusColor: BCSNColors.themeColor,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.only(bottom: Spacing.xSmall),
                  ),
                  style: TextStyles.large,
                  cursorColor: BCSNColors.textColor,
                  controller: _youSellController,
                  onChanged: (value) {
                    setState(() {
                      feeAmount = 0.02 *
                          (double.parse(_youSellController.text.trim().isEmpty
                              ? "0"
                              : _youSellController.text.trim()));
                    });
                  },
                  textInputAction: TextInputAction.next,
                  inputFormatters: [getDecimalFormatter],
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: false,
                  ))),
          spacingVerticalSmall,
          getCryptoSellDropDown()
        ],
      ),
    );
  }

  Widget getCryptoSellDropDown() {
    return CustomDropdown(
      isExpanded: true,
      hintText: "You Sell",
      customItems: cryptoCurrencyList
          ?.map((item) => DropdownMenuItem<SwapSingleCurrencyModel?>(
                value: item,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      child: Center(
                        child: Image.network(
                          item.quoteCoinId?.coinIconUrl ?? "",
                          width: DimenConst.iconSize16,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    spacingHorizontalXxSmall,
                    Flexible(
                      child: Text(
                        item.quoteCoinId?.coinName ?? "",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
      buttonHeight: 40,
      buttonWidth: 150,
      dropdownWidth: 150,
      dropdownMaxHeight: 200,
      focusColor: BCSNColors.whiteColor,
      selectedItemHighlightColor: BCSNColors.whiteColor,
      dropdownPadding: const EdgeInsets.only(bottom: 5),
      value: cryptoCurrency,
      onChanged: (value) {
        setState(() {
          cryptoCurrency = value;
        });
      },
      onMenuStateChange: (bValue) {
        setState(() {
          openYouBuyMenuDropdown = bValue;
        });
      },
      icon: openYouBuyMenuDropdown
          ? SvgPicture.asset(
              Images.icDownArrow,
              height: 10,
              width: 10,
            )
          : SvgPicture.asset(
              Images.icDownArrow,
              height: 10,
              width: 10,
            ),
      iconSize: 12,
      buttonDecoration: const BoxDecoration(
        color: Colors.transparent,
        boxShadow: [],
      ),
      itemHeight: Spacing.jumbo40,
    );
  }

  Widget getYouBuyTextField() {
    if (cryptoCurrencyList?.isEmpty ?? false) {
      cryptoCurrencyList = _swapCurrencyProvider.swipCurrencyModel.data;
      if (cryptoCurrency == null) {
        cryptoCurrency = _swapCurrencyProvider.swipCurrencyModel.data?.first;
      }
    }
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: Spacing.large),
      padding: const EdgeInsets.only(left: Spacing.small),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusConst.buttonRadius),
          border: Border.all(color: BCSNColors.hintColor)),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "",
                    hintStyle: TextStyles.textFieldStyle
                        .copyWith(color: BCSNColors.hintColor),
                    focusColor: BCSNColors.themeColor,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.only(bottom: Spacing.xSmall),
                  ),
                  style: TextStyles.large,
                  cursorColor: BCSNColors.textColor,
                  controller: _youBuyController,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [getDecimalFormatter],
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: false,
                  ))),
          spacingVerticalSmall,
          getCryptoBuyDropDown()
        ],
      ),
    );
  }

  Widget getCryptoBuyDropDown() {
    return CustomDropdown(
      isExpanded: true,
      hintText: "You Sell",
      customItems: cryptoCurrencyList
          ?.map((item) => DropdownMenuItem<SwapSingleCurrencyModel?>(
                value: item,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      child: Center(
                        child: Image.network(
                          item.baseCoinId?.coinIconUrl ?? "",
                          width: DimenConst.iconSize16,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    spacingHorizontalXxSmall,
                    Flexible(
                      child: Text(
                        item.baseCoinId?.coinName ?? "",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
      buttonHeight: 40,
      buttonWidth: 150,
      dropdownWidth: 150,
      dropdownMaxHeight: 200,
      focusColor: BCSNColors.whiteColor,
      selectedItemHighlightColor: BCSNColors.whiteColor,
      dropdownPadding: const EdgeInsets.only(bottom: 5),
      value: cryptoCurrency,
      onChanged: (value) {
        setState(() {
          cryptoCurrency = value;
        });
      },
      onMenuStateChange: (bValue) {
        setState(() {
          openYouBuyMenuDropdown = bValue;
        });
      },
      icon: openYouBuyMenuDropdown
          ? SvgPicture.asset(
              Images.icDownArrow,
              height: 10,
              width: 10,
            )
          : SvgPicture.asset(
              Images.icDownArrow,
              height: 10,
              width: 10,
            ),
      iconSize: 12,
      buttonDecoration: const BoxDecoration(
        color: Colors.transparent,
        boxShadow: [],
      ),
      itemHeight: Spacing.jumbo40,
    );
  }

  Widget summaryFeeBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Spacing.large),
      padding: const EdgeInsets.symmetric(
          horizontal: Spacing.normal, vertical: Spacing.normal),
      decoration: BoxDecoration(
          color: BCSNColors.hintColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(RadiusConst.circularRadius8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Summary",
            style: TextStyles.normal.copyWith(fontWeight: FontWeight.w500),
          ),
          spacingVerticalSmall,
          Row(
            children: [
              Expanded(child: Text("Fee(0.2%)")),
              Text("${feeAmount.toStringAsFixed(2)} USDT")
            ],
          ),
        ],
      ),
    );
  }

  Widget getSwapBtn(
      {bool isLoading = false,
      Widget? customChildWidget,
      EdgeInsetsGeometry? btnPadding,
      String? title,
      TextStyle? btnTextStyle}) {
    Widget childWidget;
    if (isLoading ?? false) {
      childWidget = const CircularProgressIndicator(
        backgroundColor: BCSNColors.greyColor,
      );
    } else if (customChildWidget != null) {
      childWidget = customChildWidget;
    } else {
      childWidget = Padding(
        padding: btnPadding ??
            const EdgeInsets.symmetric(
              horizontal: Spacing.normal,
              vertical: Spacing.xxSmall,
            ),
        child: Text(
          title ?? "",
          style: btnTextStyle ??
              TextStyles.buttonTextStyle.copyWith(color: BCSNColors.whiteColor),
        ),
      );
    }

    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Spacing.large),
        height: 40,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                RadiusConst.circularRadius20,
              ),
            ),
            gradient: BCSNColors.swapBtnGradient),
        child: Center(child: childWidget),
      ),
    );
  }
}
