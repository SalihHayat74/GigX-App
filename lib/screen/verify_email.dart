import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';

import '../constant/otp_constant.dart';
import 'email_verified.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const ReusableText(
            title: 'Email Verify',
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
                  const SizedBox(
                    height: 50,
                  ),
                  const ReusableText(
                    title: 'Verify your email',
                    weight: FontWeight.bold,
                    color: Colors.white,
                    size: 25,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ReusableText(
                    textAlign: TextAlign.center,
                    title:
                        'We have sent a verification code to the\nemail anil.shrestha@efleetpass.com.au',
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
                        // OtpTextField(
                        //   onChanged: (v) {
                        //     if (v.length == 1) {
                        //       FocusScope.of(context).nextFocus();
                        //     }
                        //   },
                        // ),
                        // OtpTextField(
                        //   onChanged: (v) {
                        //     if (v.length == 1) {
                        //       FocusScope.of(context).nextFocus();
                        //     }
                        //   },
                        // ),
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
                              builder: (context) => const EmailVerified()));
                    },
                    child: const ReusableButton(
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
                  const SizedBox(
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
