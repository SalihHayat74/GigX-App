import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';

import '4degit_code.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: ReusableText(
            title: 'Forgot Password',
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            const Image(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  ReusableText(
                    title: 'Forgot Password',
                    weight: FontWeight.bold,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ReusableText(
                    textAlign: TextAlign.center,
                    title:
                        'Enter your email for the verification process,\nwe will send 4 digit code to your email',
                    color: Color(0xffB4B4B4),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 50),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
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
                  InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EnterCode()));
                  },
                    child: ReusableButton(
                      title: 'Continue',
                      value: 40,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
