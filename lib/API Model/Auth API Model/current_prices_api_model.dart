


class CurrentPricesModelFields{
  static const String price="price";
  static const String end="end";
  static const String min="min";
  static const String timezone="timezone";
}

class CurrentPricesModel{
  String price;
  String end;
  String min;
  String timezone;

  CurrentPricesModel({
    required this.price,
    required this.end,
    required this.min,
    required this.timezone
});

  Map<String, dynamic> toJson()=>{
    CurrentPricesModelFields.price:price,
    CurrentPricesModelFields.end:end,
    CurrentPricesModelFields.min:min,
    CurrentPricesModelFields.timezone:timezone,
  };

  factory CurrentPricesModel.fromJson(Map<String,dynamic> json)=>CurrentPricesModel(
      price: json[CurrentPricesModelFields.price].toString(),
      end: json[CurrentPricesModelFields.end].toString(),
      min: json[CurrentPricesModelFields.min].toString(),
      timezone: json[CurrentPricesModelFields.timezone].toString());


}