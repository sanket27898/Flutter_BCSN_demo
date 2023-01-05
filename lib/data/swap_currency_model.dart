import 'package:flutter_bcsn_demo/data/base_model.dart';

class SwipCurrencyModel extends BaseModel {
  bool? status;
  String? message;
  List<SwapSingleCurrencyModel>? data;

  SwipCurrencyModel({this.status, this.message, this.data});

  SwipCurrencyModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] != null) {
      status = returnBoolStatus(int.parse(json['status'].toString()));
    }
    message = json['message'];
    if (json['data'] != null) {
      data = <SwapSingleCurrencyModel>[];
      json['data'].forEach((v) {
        data?.add(SwapSingleCurrencyModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static SwipCurrencyModel getDefaultModel() => SwipCurrencyModel(
        status: false,
        message: "Something went wrong",
      );

  bool returnBoolStatus(int statusCode) {
    switch (statusCode) {
      case 200:
      case 201:
        return true;

      default:
        return false;
    }
  }
}

class SwapSingleCurrencyModel {
  double? price;
  double? baseQty;
  double? fee;
  double? slippage;
  double? minSwap;
  double? maxSwap;
  bool? isActive;
  bool? isDisabledByAdmin;
  String? sId;
  BaseCoinId? baseCoinId;
  BaseCoinId? quoteCoinId;
  var iV;
  String? baseSymbol;
  String? createdAt;
  String? quoteSymbol;
  String? updatedAt;

  SwapSingleCurrencyModel(
      {this.price,
      this.baseQty,
      this.fee,
      this.slippage,
      this.minSwap,
      this.maxSwap,
      this.isActive,
      this.isDisabledByAdmin,
      this.sId,
      this.baseCoinId,
      this.quoteCoinId,
      this.iV,
      this.baseSymbol,
      this.createdAt,
      this.quoteSymbol,
      this.updatedAt});

  SwapSingleCurrencyModel.fromJson(Map<String, dynamic> json) {
    if (json['price'] != null) {
      price = double.parse(json['price'].toString());
    }
    if (json['base_qty'] != null) {
      baseQty = double.parse(json['base_qty'].toString());
    }
    if (json['fee'] != null) {
      fee = double.parse(json['fee'].toString());
    }
    if (json['slippage'] != null) {
      slippage = double.parse(json['slippage'].toString());
    }
    if (json['min_swap'] != null) {
      minSwap = double.parse(json['min_swap'].toString());
    }
    if (json['max_swap'] != null) {
      maxSwap = double.parse(json['max_swap'].toString());
    }
    if (json['isActive'] != null) {
      isActive = json['isActive'];
    }
    if (json['is_disabled_by_admin'] != null) {
      isDisabledByAdmin = json['is_disabled_by_admin'];
    }
    if (json['_id'] != null) {
      sId = json['_id'];
    }

    baseCoinId = json['base_coin_id'] != null
        ? BaseCoinId.fromJson(json['base_coin_id'])
        : null;
    quoteCoinId = json['quote_coin_id'] != null
        ? BaseCoinId.fromJson(json['quote_coin_id'])
        : null;
    iV = json['__v'];
    baseSymbol = json['base_symbol'].toString();
    createdAt = json['created_at'].toString();
    quoteSymbol = json['quote_symbol'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = this.price;
    data['base_qty'] = this.baseQty;
    data['fee'] = this.fee;
    data['slippage'] = this.slippage;
    data['min_swap'] = this.minSwap;
    data['max_swap'] = this.maxSwap;
    data['isActive'] = this.isActive;
    data['is_disabled_by_admin'] = this.isDisabledByAdmin;
    data['_id'] = this.sId;
    if (this.baseCoinId != null) {
      data['base_coin_id'] = this.baseCoinId?.toJson();
    }
    if (this.quoteCoinId != null) {
      data['quote_coin_id'] = this.quoteCoinId?.toJson();
    }
    data['__v'] = this.iV;
    data['base_symbol'] = this.baseSymbol;
    data['created_at'] = this.createdAt;
    data['quote_symbol'] = this.quoteSymbol;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class BaseCoinId {
  var cmcId;
  List<String>? categories;
  String? coinIcon;
  bool? isActive;
  bool? isErc;
  double? cs;
  double? mc;
  bool? deleted;
  String? sId;
  MinSendLimit? minSendLimit;
  MinSendLimit? maxSendLimit;
  String? supportedNetworkName;
  String? supportedNetworkCode;
  MinSendLimit? withdrawFee;
  bool? depositEnable;
  String? depositDescription;
  bool? withdrawEnable;
  String? withdrawDescription;
  String? specialTips;
  String? specialWithdrawTips;
  String? addressRegex;
  String? tagRegex;
  String? coinName;
  String? coinCode;
  var displayPrecision;
  String? createdAt;
  String? updatedAt;
  var iV;
  String? metaData;
  String? coinIconUrl;
  String? id;

  BaseCoinId(
      {this.cmcId,
      this.categories,
      this.coinIcon,
      this.isActive,
      this.isErc,
      this.cs,
      this.mc,
      this.deleted,
      this.sId,
      this.minSendLimit,
      this.maxSendLimit,
      this.supportedNetworkName,
      this.supportedNetworkCode,
      this.withdrawFee,
      this.depositEnable,
      this.depositDescription,
      this.withdrawEnable,
      this.withdrawDescription,
      this.specialTips,
      this.specialWithdrawTips,
      this.addressRegex,
      this.tagRegex,
      this.coinName,
      this.coinCode,
      this.displayPrecision,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.metaData,
      this.coinIconUrl,
      this.id});

  BaseCoinId.fromJson(Map<String, dynamic> json) {
    cmcId = json['cmc_id'];
    categories = json['categories'].cast<String>();
    coinIcon = json['coin_icon'];
    isActive = json['is_active'];
    isErc = json['is_erc'];
    if (json['cs'] != null) {
      cs = double.parse(json['cs'].toString());
    }
    mc = double.parse(json['mc'].toString());
    deleted = json['deleted'];
    sId = json['_id'];
    minSendLimit = json['min_send_limit'] != null
        ? MinSendLimit.fromJson(json['min_send_limit'])
        : null;
    maxSendLimit = json['max_send_limit'] != null
        ? MinSendLimit.fromJson(json['max_send_limit'])
        : null;
    supportedNetworkName = json['supported_network_name'];
    supportedNetworkCode = json['supported_network_code'];
    withdrawFee = json['withdraw_fee'] != null
        ? MinSendLimit.fromJson(json['withdraw_fee'])
        : null;
    depositEnable = json['deposit_enable'];
    depositDescription = json['deposit_description'];
    withdrawEnable = json['withdraw_enable'];
    withdrawDescription = json['withdraw_description'];
    specialTips = json['special_tips'];
    specialWithdrawTips = json['special_withdraw_tips'];
    addressRegex = json['address_regex'];
    tagRegex = json['tag_regex'];
    coinName = json['coin_name'];
    coinCode = json['coin_code'];
    displayPrecision = json['display_precision'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
    metaData = json['meta_data'];
    coinIconUrl = json['coin_icon_url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cmc_id'] = this.cmcId;
    data['categories'] = this.categories;
    data['coin_icon'] = this.coinIcon;
    data['is_active'] = this.isActive;
    data['is_erc'] = this.isErc;
    data['cs'] = this.cs;
    data['mc'] = this.mc;
    data['deleted'] = this.deleted;
    data['_id'] = this.sId;
    if (this.minSendLimit != null) {
      data['min_send_limit'] = this.minSendLimit?.toJson();
    }
    if (this.maxSendLimit != null) {
      data['max_send_limit'] = this.maxSendLimit?.toJson();
    }
    data['supported_network_name'] = this.supportedNetworkName;
    data['supported_network_code'] = this.supportedNetworkCode;
    if (this.withdrawFee != null) {
      data['withdraw_fee'] = this.withdrawFee?.toJson();
    }
    data['deposit_enable'] = this.depositEnable;
    data['deposit_description'] = this.depositDescription;
    data['withdraw_enable'] = this.withdrawEnable;
    data['withdraw_description'] = this.withdrawDescription;
    data['special_tips'] = this.specialTips;
    data['special_withdraw_tips'] = this.specialWithdrawTips;
    data['address_regex'] = this.addressRegex;
    data['tag_regex'] = this.tagRegex;
    data['coin_name'] = this.coinName;
    data['coin_code'] = this.coinCode;
    data['display_precision'] = this.displayPrecision;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    data['meta_data'] = this.metaData;
    data['coin_icon_url'] = this.coinIconUrl;
    data['id'] = this.id;
    return data;
  }
}

class MinSendLimit {
  String? numberDecimal;

  MinSendLimit({this.numberDecimal});

  MinSendLimit.fromJson(Map<String, dynamic> json) {
    numberDecimal = json['$numberDecimal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$numberDecimal'] = this.numberDecimal;
    return data;
  }
}
