

import 'active_bonus_api_model.dart';

class IcoStageFullApiModelFields{
  static const String ico = "ico";
  static const String total = "total";
  static const String totalAmount = "total_amount";
  static const String totalToken = "total_token";
  static const String sold = "sold";
  static const String soldAmount = "sold_amount";
  static const String soldToken = "sold_token";
  static const String progress = "progress";
  static const String price = "price";
  static const String bonus = "bonus";
  static const String start = "start";
  static const String end = "end";
  static const String timezone = "timezone";
  static const String min = "min";
  static const String max = "max";
  static const String soft = "soft";
  static const String hard = "hard";

}

class IcoStageFullApiModel{
  String ico;
  String total;
  String totalAmount;
  String totalToken;
  String sold;
  String soldAmount;
  String soldToken;
  String progress;
  String price;
  ActiveBonusApiModel bonus;
  String start;
  String end;
  String timezone;
  String min;
  String max;
  IcoStageFullSoftModel soft;
  IcoStageFullHardModel hard;

  IcoStageFullApiModel({
    required this.ico ,
    required this.total ,
    required this.totalAmount,
    required this.totalToken,
    required this.sold ,
    required this.soldAmount ,
    required this.soldToken,
    required this.progress ,
    required this.price ,
    required this.bonus,
    required this.start ,
    required this.end ,
    required this.timezone ,
    required this.min ,
    required this.max ,
    required this.soft ,
    required this.hard ,
  });

  factory IcoStageFullApiModel.fromJson(Map<String,dynamic> json)=>IcoStageFullApiModel(
      ico: json[IcoStageFullApiModelFields.ico].toString(),
      total: json[IcoStageFullApiModelFields.total].toString(),
      totalAmount:json[IcoStageFullApiModelFields.totalAmount].toString(),
      totalToken: json[IcoStageFullApiModelFields.totalToken].toString(),
      sold:json[IcoStageFullApiModelFields.sold].toString() ,
      soldAmount: json[IcoStageFullApiModelFields.soldAmount].toString(),
      soldToken: json[IcoStageFullApiModelFields.soldToken].toString(),
      progress: json[IcoStageFullApiModelFields.progress].toString(),
      price: json[IcoStageFullApiModelFields.price].toString(),
      bonus: ActiveBonusApiModel.fromJson(json[IcoStageFullApiModelFields.bonus]),
      start: json[IcoStageFullApiModelFields.start].toString(),
      end: json[IcoStageFullApiModelFields.end].toString(),
      timezone:json[IcoStageFullApiModelFields.timezone].toString() ,
      min: json[IcoStageFullApiModelFields.min].toString(),
      max:json[IcoStageFullApiModelFields.max].toString(),
      soft: IcoStageFullSoftModel.fromJson(json[IcoStageFullApiModelFields.soft]),
      hard: IcoStageFullHardModel.fromJson(json[IcoStageFullApiModelFields.hard])
  );


}


class IcoStageFullBonusModelFields{
  static String base="base";
  static const String start="start";
  static const String end="end";
  static const String timezone="timezone";
  static const String amount="amount";
}

class IcoStageFullBonusModel{
  String base;
  String start;
  String end;
  String timezone;
  String amount;
  IcoStageFullBonusModel({
   required this.base ,
  required this.start ,required this.end ,required this.timezone ,required this.amount ,
});


  factory IcoStageFullBonusModel.fromJson(Map<String, dynamic> json)=>IcoStageFullBonusModel(
      base: json[IcoStageFullBonusModelFields.base],
      start: json[IcoStageFullBonusModelFields.start],
      end: json[IcoStageFullBonusModelFields.end],
      timezone: json[IcoStageFullBonusModelFields.timezone],
      amount: json[IcoStageFullBonusModelFields.amount]);

}

class IcoStageFullSoftModelFields{

  static const String cap="cap";
  static const String amount="amount";
  static const String percent="percent";
}

class IcoStageFullSoftModel{
  String cap;
  String amount;
  String percent;

  IcoStageFullSoftModel({
    required this.cap ,
    required this.amount ,required this.percent
  });

  factory IcoStageFullSoftModel.fromJson(Map<String, dynamic> json)=>IcoStageFullSoftModel(
      cap: json[IcoStageFullSoftModelFields.cap].toString(),
      amount: json[IcoStageFullSoftModelFields.amount].toString(),
      percent: json[IcoStageFullSoftModelFields.percent].toString(),
  );
}


class IcoStageFullHardModelFields{

  static const String cap="cap";
  static const String amount="amount";
  static const String percent="percent";
}

class IcoStageFullHardModel{
  String cap;
  String amount;
  String percent;

  IcoStageFullHardModel({
    required this.cap ,
    required this.amount ,
    required this.percent
  });

  factory IcoStageFullHardModel.fromJson(Map<String, dynamic> json)=>IcoStageFullHardModel(
    cap: json[IcoStageFullHardModelFields.cap].toString(),
    amount: json[IcoStageFullHardModelFields.amount].toString(),
    percent: json[IcoStageFullHardModelFields.percent].toString(),
  );
}
