



class IcoStageApiModelFields{
  static const String ico = "ico";
  static const String total = "total";
  static const String total_amount = "total_amount";
  static const String sold = "sold";
  static const String sold_amount = "sold_amount";
  static const String progress = "progress";
  static const String price = "price";
  static const String start = "start";
  static const String end = "end";
  static const String timezone = "timezone";
  static const String min = "min";
  static const String max = "max";
  static const String soft = "soft";
  static const String soft_amount = "soft_amount";
  static const String hard = "hard";
  static const String hard_amount = "hard_amount";
}

class IcoStageMinimalApiModel{
  String ico;
  String total;
  String total_amount;
  String sold;
  String sold_amount;
  String progress;
  String price;
  String start;
  String end;
  String timezone;
  String min;
  String max;
  String soft;
  String soft_amount;
  String hard;
  String hard_amount;

  IcoStageMinimalApiModel({
    required this.ico ,
  required this.total ,
  required this.total_amount ,
  required this.sold ,
  required this.sold_amount ,
  required this.progress ,
  required this.price ,
  required this.start ,
  required this.end ,
  required this.timezone ,
  required this.min ,
  required this.max ,
  required this.soft ,
  required this.soft_amount ,
  required this.hard ,
    required this.hard_amount
});


  Map<String, dynamic> toJson()=>{
    IcoStageApiModelFields.ico:ico,
    IcoStageApiModelFields.total:total,
    IcoStageApiModelFields.total_amount:total_amount,
    IcoStageApiModelFields.sold:sold,
    IcoStageApiModelFields.sold_amount:sold_amount,
    IcoStageApiModelFields.progress:progress,
    IcoStageApiModelFields.price:price,
    IcoStageApiModelFields.start:start,
    IcoStageApiModelFields.end:end,
    IcoStageApiModelFields.timezone:timezone,
    IcoStageApiModelFields.min:min,
    IcoStageApiModelFields.max:max,
    IcoStageApiModelFields.soft:soft,
    IcoStageApiModelFields.soft_amount:soft_amount,
    IcoStageApiModelFields.hard:hard,
    IcoStageApiModelFields.hard_amount:hard_amount,
  };

  factory IcoStageMinimalApiModel.fromJson(Map<String,dynamic> json)=>IcoStageMinimalApiModel(
      ico: json[IcoStageApiModelFields.ico].toString() ?? 'Ico',
      total: json[IcoStageApiModelFields.total].toString() ?? 'Total',
      total_amount:json[IcoStageApiModelFields.total_amount].toString()?? 'Total Amount',
      sold:json[IcoStageApiModelFields.sold].toString() ?? 'Sold',
      sold_amount: json[IcoStageApiModelFields.sold_amount].toString() ?? '"Sold Amount',
      progress: json[IcoStageApiModelFields.progress].toString()?? "Progress",
      price: json[IcoStageApiModelFields.price].toString() ?? "Price",
      start: json[IcoStageApiModelFields.start].toString()?? "Start",
      end: json[IcoStageApiModelFields.end].toString() ?? "End",
      timezone:json[IcoStageApiModelFields.timezone].toString() ?? "TimeZone" ,
      min: json[IcoStageApiModelFields.min].toString()?? "Min",
      max:json[IcoStageApiModelFields.max].toString() ?? "Max",
      soft: json[IcoStageApiModelFields.soft].toString() ?? "Soft",
      soft_amount: json[IcoStageApiModelFields.soft_amount].toString() ??"Soft Amount",
      hard: json[IcoStageApiModelFields.hard] .toString()?? "Hard",
      hard_amount: json[IcoStageApiModelFields.hard_amount].toString()?? "Hard Amount");

  factory IcoStageMinimalApiModel.fromJsonBody(Map<String,dynamic> json)=>IcoStageMinimalApiModel(
      ico: json[IcoStageApiModelFields.ico].toString() ?? 'Ico',
      total: json[IcoStageApiModelFields.total].toString() ?? 'Total',
      total_amount:json[IcoStageApiModelFields.total_amount].toString()?? 'Total Amount',
      sold:json[IcoStageApiModelFields.sold].toString() ?? 'Sold',
      sold_amount: json[IcoStageApiModelFields.sold_amount].toString() ?? '"Sold Amount',
      progress: json[IcoStageApiModelFields.progress].toString()?? "Progress",
      price: json[IcoStageApiModelFields.price].toString() ?? "Price",
      start: json[IcoStageApiModelFields.start].toString()?? "Start",
      end: json[IcoStageApiModelFields.end].toString() ?? "End",
      timezone:json[IcoStageApiModelFields.timezone].toString() ?? "TimeZone" ,
      min: json[IcoStageApiModelFields.min].toString()?? "Min",
      max:json[IcoStageApiModelFields.max].toString() ?? "Max",
      soft: json[IcoStageApiModelFields.soft].toString() ?? "Soft",
      soft_amount: json[IcoStageApiModelFields.soft_amount].toString() ??"Soft Amount",
      hard: json[IcoStageApiModelFields.hard] .toString()?? "Hard",
      hard_amount: json[IcoStageApiModelFields.hard_amount].toString()?? "Hard Amount");

}

class IcoDataMinimalBody{
  String success;
  IcoStageMinimalApiModel response;
  IcoDataMinimalBody({
    required this.success,
    required this.response
});
  factory IcoDataMinimalBody.fromJson(Map<String,dynamic>json)=>IcoDataMinimalBody(
      success: json['success'],
      response: IcoStageMinimalApiModel.fromJson(json['response']));

}