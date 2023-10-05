import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';

import '../constant/otp_constant.dart';
import '../reset_password.dart';

class EnterCode extends StatefulWidget {
  const EnterCode({Key? key}) : super(key: key);

  @override
  State<EnterCode> createState() => _EnterCodeState();
}

class _EnterCodeState extends State<EnterCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: ReusableText(
            title: 'Enter 4 Digit Code',
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
                    title: 'Enter 4 Digit Code',
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
                        'Enter 4 Digit code that you have received\non your email',
                    color: Color(0xffB4B4B4),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OtpTextField(
                          onChanged: (v) {
                            if (v.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        OtpTextField(
                          onChanged: (v) {
                            if (v.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        OtpTextField(
                          onChanged: (v) {
                            if (v.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        SizedBox(
                          width: 20,
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
                              builder: (context) => const ResetPassword()));
                    },
                    child: ReusableButton(
                      title: 'Continue',
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
                ],
              ),
            )
          ],
        ));
  }
}
