



class LoginApiFields{
  static String name="name";
  static String email = "email";
  static String password = "password";
  static String secret = 'secret';
}

class LoginApiModel{
  // String name;
  String email;
  String password;
  String secret;

  LoginApiModel({
    // required this.name,
    required this.email,
    required this.password,
    required this.secret
  });

  Map<String, dynamic> toJson(){
    return{
      LoginApiFields.email:email,
      LoginApiFields.password:password,
      LoginApiFields.secret:secret,
      // SignUpAPIFields.name: name,
    };
  }

  factory LoginApiModel.fromJson(Map<String , dynamic> json)=>LoginApiModel(
      // name: json[SignUpAPIFields.name],
      email: json[LoginApiFields.email],
      password: json[LoginApiFields.password],
      secret: json[LoginApiFields.secret]);



}