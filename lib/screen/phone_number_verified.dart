import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';

import 'documents_verification.dart';

class PhoneNumberVerified extends StatefulWidget {
  const PhoneNumberVerified({Key? key}) : super(key: key);

  @override
  State<PhoneNumberVerified> createState() => _PhoneNumberVerifiedState();
}

class _PhoneNumberVerifiedState extends State<PhoneNumberVerified> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('images/done_mark.png')),
                  SizedBox(
                    height: 50,
                  ),
                  ReusableText(
                    textAlign: TextAlign.center,
                    title: 'Your number has been\nverified!',
                    weight: FontWeight.bold,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ReusableText(
                    title: 'Please complete your ID verification process.',
                    color: Color(0xffB4B4B4),
                  ),
                  SizedBox(
                    height: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DocumentsVerification()));
                      },
                      child: ReusableButton(
                        title: 'Continue',
                        value: 10,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
