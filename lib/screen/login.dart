import 'package:flutter/material.dart';
import 'package:gigx_website/API%20Model/Auth%20API%20Model/login_model.dart';
import 'package:gigx_website/API%20Model/Auth%20API%20Model/signup_api_model.dart';
import 'package:gigx_website/API/api_client.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:provider/provider.dart';

import '../constant/bottom_navigation_bar.dart';
import '../provider/access_token_provider.dart';
import '../static constants/static_constants.dart';
import 'create_account.dart';
import 'forgot_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();



  @override
  void initState() {
    // checkLoginStatus();
    // TODO: implement initState
    super.initState();
  }

  bool isLoading=false;
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            const Image(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: SingleChildScrollView(
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Image(image: AssetImage('images/splashLogo.png')),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const ReusableText(
                    title: 'Welcome Back!',
                    color: Colors.white,
                    size: 25,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const ReusableText(
                    title: 'Joins us Now!',
                    color: Color(0xffB4B4B4),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your email',
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: passwordController,
                        obscureText: visibility,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            suffixIcon: visibility
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visibility = !visibility;
                                      });
                                    },
                                    icon: Icon(Icons.visibility_off))
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visibility = !visibility;
                                      });
                                    },
                                    icon: Icon(Icons.visibility)),
                            prefixIcon: const Icon(
                              Icons.lock_outlined,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    child: const ReusableText(
                      title: 'Forgot Password?',
                      color: Color(0xff03E5D4),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Provider.of<AccessTokenProvider>(context).isLoading?const Center(child: CircularProgressIndicator()):InkWell(
                    onTap: () async{
                      if(emailController.text.isEmpty ||
                      passwordController.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("All fields are required")));
                      }else if(emailController.text.contains('@') && emailController.text.endsWith('.com')){
                        Provider.of<AccessTokenProvider>(context,listen: false).startLoading();
                        LoginApiModel user=LoginApiModel(
                            email: emailController.text,
                            password: passwordController.text,
                            secret: "ZE7EDFlxRz8RJIGKbhbY7qrG");

                        ApiClient().login(user.toJson(),context);

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => BottomNavBar()));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Enter Valid Email")));
                      }

                    },
                    child: ReusableButton(
                      title: 'LogIn',
                      value: 50,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not member?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          Provider.of<AccessTokenProvider>(context,listen: false).stopLoading();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateAccount()));
                        },
                        child: const Text(
                          'Register Here',
                          style: TextStyle(
                            color: Color(0xff03E5D4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            )
          ],
        ));
  }
}
