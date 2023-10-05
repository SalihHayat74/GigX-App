import 'dart:convert';
class UserKycModelFields{
  static const String secret="secret";
  static const String first_name="first_name";
  static const String last_name="last_name";
  static const String email="email";
  static const String password="password";
  static const String dob="dob";
  static const String phone="phone";
  static const String gender="gender";
  static const String telegram="telegram";
  static const String country="country";
  static const String state="state";
  static const String city="city";
  static const String zip="zip";
  static const String address_1="address_1";
  static const String address_2="address_2";
  static const String wallet_address="wallet_address";
  static const String wallet_name="wallet_name";
  static const String documentType="documentType";
  static const String document_one="document_one";
  static const String document_image_hand="document_image_hand";
  static const String document_two="document_two";
}

class UserKycModel{
  String secret;
  String first_name;
  String last_name;
  String email;
  String password;
  String dob;
  String phone;
  String gender;
  String telegram;
  String country;
  String state;
  String city;
  String zip;
  String address_1;
  String address_2;
  String wallet_address;
  String wallet_name;
  String documentType;
  String document_one;
  String document_image_hand;
  String document_two;



  UserKycModel({
    required this.secret,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
    required this.dob,
    required this.phone,
    required this.gender,
    required this.telegram,
    required this.country,
    required this.state,
    required this.city,
    required this.zip,
    required this.address_1,
    required this.address_2,
    required this.wallet_address,
    required this.wallet_name,
    required this.documentType,
    required this.document_one,
    required this.document_image_hand,
    required this.document_two,
});

  Map<String,dynamic> toJson()=>{
    '${UserKycModelFields.secret}':'${secret}',
    '${UserKycModelFields.first_name}':'${first_name}',
    '${UserKycModelFields.last_name}':'${last_name}',
    '${UserKycModelFields.email}':'${email}',
    '${UserKycModelFields.password}':'${password}',
    '${UserKycModelFields.dob}':'${dob}',
    '${UserKycModelFields.phone}':'${phone}',
    '${UserKycModelFields.gender}':'${gender}',
    '${UserKycModelFields.telegram}':'${telegram}',
    '${UserKycModelFields.country}':'${country}',
    '${UserKycModelFields.state}':'${state}',
    '${UserKycModelFields.city}':'${city}',
    '${UserKycModelFields.zip}':'${zip}',
    '${UserKycModelFields.address_1}':'${address_1}',
    '${UserKycModelFields.address_2}':'${address_2}',
    '${UserKycModelFields.wallet_address}':'${wallet_address}',
    '${UserKycModelFields.wallet_name}':'${wallet_name}',
    '${UserKycModelFields.documentType}':'${documentType}',
    '${UserKycModelFields.document_one}':'${document_one}',
    '${UserKycModelFields.document_image_hand}':'${document_image_hand}',
    '${UserKycModelFields.document_two}':'${document_two}',
  };

  factory UserKycModel.fromJson(Map<String, dynamic> json)=>UserKycModel(
      secret:json[UserKycModelFields.secret],
      first_name:json[UserKycModelFields.first_name],
      last_name:json[UserKycModelFields.last_name],
      email:json[UserKycModelFields.email],
      password:json[UserKycModelFields.password],
      dob:json[UserKycModelFields.dob],
      phone:json[UserKycModelFields.phone],
      gender:json[UserKycModelFields.gender],
      telegram:json[UserKycModelFields.telegram],
      country:json[UserKycModelFields.country],
      state:json[UserKycModelFields.state],
      city:json[UserKycModelFields.city],
      zip:json[UserKycModelFields.zip],
      address_1:json[UserKycModelFields.address_1],
      address_2:json[UserKycModelFields.address_2],
      wallet_address:json[UserKycModelFields.wallet_address],
      wallet_name:json[UserKycModelFields.wallet_name],
      documentType:json[UserKycModelFields.documentType],
      document_one:json[UserKycModelFields.document_one],
      document_image_hand:json[UserKycModelFields.document_image_hand],
      document_two:json[UserKycModelFields.document_two],
  );


}

