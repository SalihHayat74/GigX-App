



class SignUpAPIFields{
  static String name="name";
  static String email = "email";
  static String password = "password";
  static String secret = 'secret';
}

class SignUpAPIModel{
  String name;
  String email;
  String password;
  String secret;

  SignUpAPIModel({
   required this.name,
   required this.email,
   required this.password,
   required this.secret
});

  Map<String, dynamic> toJson(){
    return{
      SignUpAPIFields.email:email,
      SignUpAPIFields.password:password,
      SignUpAPIFields.secret:secret,
      SignUpAPIFields.name: name,
    };
  }

  factory SignUpAPIModel.fromJson(Map<String , dynamic> json)=>SignUpAPIModel(
      name: json[SignUpAPIFields.name],
      email: json[SignUpAPIFields.email],
      password: json[SignUpAPIFields.password],
      secret: json[SignUpAPIFields.secret]);



}