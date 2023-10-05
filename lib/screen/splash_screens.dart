import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API Model/Auth API Model/login_model.dart';
import '../API Model/Auth API Model/signup_api_model.dart';
import '../API/api_client.dart';
import '../static constants/static_constants.dart';
import 'welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? email;
  String? password;
  bool isLoggedIn=true;
  // bool isLoading=true;
  checkLoginStatus()async{
    SharedPreferences prefs= await _prefs;
    email=prefs.getString(SignUpAPIFields.email);
    password=prefs.getString(SignUpAPIFields.password);
    if(email=='' && password == ''){
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => const Welcome(),),(route)=>false);
      // isLoading=false;
      setState(() {

      });
    }else{
      LoginApiModel user=LoginApiModel(
          email: email!,
          password: password!,
          secret: StaticValues.secret);
      await ApiClient().login(user.toJson(), context);

    }
  }

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      checkLoginStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black38,
        body: Stack(
          alignment: Alignment.center,
          children: const [
            Image(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Center(
              child: Image(
                image: AssetImage('images/splashLogo.png'),
              ),
            )
          ],
        ));
  }
}
