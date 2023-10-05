class UserInfoModelFields{
  static const String id="id";
  static const String name="name";
  static const String email="email";
  static const String email_verified_at="email_verified_at";
  static const String status="status";
  static const String registerMethod="registerMethod";
  static const String social_id="social_id";
  static const String mobile="mobile";
  static const String dateOfBirth ="dateOfBirth";
  static const String nationality="nationality";
  static const String lastLogin = "lastLogin";
  static const String walletType="walletType";
  static const String walletAddress="walletAddress";
  static const String role = "role";
  static const String contributed = "contributed";
  static const String tokenBalance="tokenBalance";
  static const String distAmount="distAmount";
  static const String referral="referral";
  static const String referralInfo="referralInfo";
  static const String google2fa= "google2fa";
  static const String google2fa_secret="google2fa_secret";
  static const String type ="type";
  static const String created_at="created_at";
  static const String updated_at="updated_at";
  static const String stripe_id="stripe_id";
  static const String pm_type="pm_type";
  static const String pm_last_four="pm_last_four";
  static const String trial_ends_at="trial_end_at";
}

class UserInfoModel{
  String id;
  String name;
  String email;
  String email_verified_at;
  String status;
  String registerMethod;
  String social_id;
  String mobile;
  String dateOfBirth;
  String nationality;
  String lastLogin;
  String walletType;
  String walletAddress;
  String role;
  String contributed;
  String tokenBalance;
  String distAmount;
  String referral;
  String referralInfo;
  String google2fa;
  String google2fa_secret;
  String type;
  String created_at;
  String updated_at;
  String stripe_id;
  String pm_type;
  String pm_last_four;
  String trial_ends_at;

  UserInfoModel({
    required this.id,
    required this.name,
    required this.email,
    required this.email_verified_at,
    required this.status,
    required this.registerMethod,
    required this.social_id,
    required this.mobile,
    required this.dateOfBirth,
    required this.nationality,
    required this.lastLogin,
    required this.walletType,
    required this.walletAddress,
    required this.role,
    required this.contributed,
    required this.tokenBalance,
    required this.distAmount,
    required this.referral,
    required this.referralInfo,
    required this.google2fa,
    required this.google2fa_secret,
    required this.type,
    required this.created_at,
    required this.updated_at,
    required this.stripe_id,
    required this.pm_type,
    required this.pm_last_four,
    required this.trial_ends_at,
});

  factory UserInfoModel.from(Map<String,dynamic> json)=>UserInfoModel(
       id:json[UserInfoModelFields.id].toString(),
       name:json[UserInfoModelFields.name].toString(),
       email:json[UserInfoModelFields.email].toString(),
       email_verified_at:json[UserInfoModelFields.email_verified_at].toString(),
       status:json[UserInfoModelFields.status].toString(),
       registerMethod:json[UserInfoModelFields.registerMethod].toString(),
       social_id:json[UserInfoModelFields.social_id].toString(),
       mobile:json[UserInfoModelFields.mobile].toString(),
       dateOfBirth:json[UserInfoModelFields.dateOfBirth].toString(),
       nationality:json[UserInfoModelFields.nationality].toString(),
       lastLogin:json[UserInfoModelFields.lastLogin].toString(),
       walletType:json[UserInfoModelFields.walletType].toString(),
       walletAddress:json[UserInfoModelFields.walletAddress].toString(),
       role:json[UserInfoModelFields.role].toString(),
       contributed:json[UserInfoModelFields.contributed].toString(),
       tokenBalance:json[UserInfoModelFields.tokenBalance].toString(),
       distAmount:json[UserInfoModelFields.distAmount].toString(),
       referral:json[UserInfoModelFields.referral].toString(),
       referralInfo:json[UserInfoModelFields.referralInfo].toString(),
       google2fa:json[UserInfoModelFields.google2fa].toString(),
       google2fa_secret:json[UserInfoModelFields.google2fa_secret].toString(),
       type:json[UserInfoModelFields.type].toString(),
       created_at:json[UserInfoModelFields.created_at].toString(),
       updated_at:json[UserInfoModelFields.updated_at].toString(),
       stripe_id:json[UserInfoModelFields.stripe_id].toString(),
       pm_type:json[UserInfoModelFields.pm_type].toString(),
       pm_last_four:json[UserInfoModelFields.pm_last_four].toString(),
       trial_ends_at:json[UserInfoModelFields.trial_ends_at].toString(),
  );


}

class UserInfoBody{
  String success;
  UserInfoModel userInfo;
  UserInfoBody({
    required this.success,
    required this.userInfo
});

  factory UserInfoBody.fromJson(Map<String,dynamic>json)=>UserInfoBody(
    success:json['success'],
    userInfo: UserInfoModel.from(json['response'])
  );
}
