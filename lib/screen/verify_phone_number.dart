import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:gigx_website/screen/phone_number_verified.dart';

import '../constant/otp_constant.dart';

class VerifyPhoneNumber extends StatefulWidget {
  const VerifyPhoneNumber({Key? key}) : super(key: key);

  @override
  State<VerifyPhoneNumber> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: ReusableText(
            title: 'Mobile Number Verify',
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
                    height: 50,
                  ),
                  ReusableText(
                    title: 'Verifiy your number',
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
                        'Mobile SMS code already sent to \n+61****** 89, please check',
                    color: Color(0xffB4B4B4),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OtpTextField(
                          onChanged: (v) {
                            if (v.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        OtpTextField(
                          onChanged: (v) {
                            if (v.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        OtpTextField(
                          onChanged: (v) {
                            if (v.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        OtpTextField(
                          onChanged: (v) {
                            if (v.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        OtpTextField(
                          onChanged: (v) {
                            if (v.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        OtpTextField(
                          onChanged: (v) {
                            if (v.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        OtpTextField(
                          onChanged: (v) {
                            if (v.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhoneNumberVerified()));
                    },
                    child: ReusableButton(
                      title: 'Submit',
                      value: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: const TextSpan(
                          text: 'Didn’t get the code? ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          children: [
                        TextSpan(
                            text: 'Resend ',
                            style: TextStyle(
                              color: Color(0xff03E5D4),
                            ))
                      ])),
                  SizedBox(
                    height: 320,
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text:
                              'By creating an account you are agreeing to\nGigXCoin\'s ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                                text: 'Terms and conditions',
                                style: TextStyle(
                                  color: Color(0xff03E5D4),
                                ))
                          ])),
                ],
              ),
            )
          ],
        ));
  }
}
