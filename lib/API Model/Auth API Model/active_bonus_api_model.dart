


class ActiveBonusApiModelFields{
  static String base="base";
  static const String start = "start";
  static const String end="end";
  static const String timezone="timezone";
  static const String amount="amount";
}

class ActiveBonusApiModel{
  String base;
  String start;
  String end;
  String timezone;
  String amount;


  ActiveBonusApiModel({
    required this.base,
    required this.start,
    required this.end,
    required this.timezone,
    required this.amount
  });

  Map<String, dynamic> toJson()=>{
    ActiveBonusApiModelFields.base:base,
    ActiveBonusApiModelFields.start:start,
    ActiveBonusApiModelFields.end:end,
    ActiveBonusApiModelFields.amount:amount,
    ActiveBonusApiModelFields.timezone:timezone,
  };

  factory ActiveBonusApiModel.fromJson(Map<String,dynamic> json)=>ActiveBonusApiModel(
      base: json[ActiveBonusApiModelFields.base].toString(),
      start: json[ActiveBonusApiModelFields.start].toString(),
      end: json[ActiveBonusApiModelFields.end].toString(),
      amount: json[ActiveBonusApiModelFields.amount].toString(),
      timezone: json[ActiveBonusApiModelFields.timezone].toString());


}

class ActiveBonusBody{
  String success;
  ActiveBonusApiModel activeBonus;
  ActiveBonusBody({
   required this.success,
   required this.activeBonus
});

  factory ActiveBonusBody.fromJson(Map<String,dynamic> json)=>ActiveBonusBody(
      success: json['success'],
      activeBonus: ActiveBonusApiModel.fromJson(json['response']));
}