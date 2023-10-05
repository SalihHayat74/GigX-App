


class AccessTokenModelFields{
  static String accessToken="access_token";
  static String tokenType="token_type";
}

class AccessTokenModel{
  String accessToken;
  String tokenType;

  AccessTokenModel({
    required this.accessToken,
    required this.tokenType
});

  Map<String, dynamic> toJson()=>{
    AccessTokenModelFields.accessToken:accessToken,
    AccessTokenModelFields.tokenType:tokenType
  };

  factory AccessTokenModel.fromJson(Map<String, dynamic> json)=>AccessTokenModel(
      accessToken: json[AccessTokenModelFields.accessToken],
      tokenType: json[AccessTokenModelFields.tokenType]);

}