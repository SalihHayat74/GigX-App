import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:gigx_website/screen/verify_phone_number.dart';

import '../constant/bottom_navigation_bar.dart';
import 'documents_verification.dart';

class EmailVerified extends StatefulWidget {
  const EmailVerified({Key? key}) : super(key: key);

  @override
  State<EmailVerified> createState() => _EmailVerifiedState();
}

class _EmailVerifiedState extends State<EmailVerified> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.center,
          children: [
            const Image(
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
                  const Image(image: AssetImage('images/done_mark.png')),
                  const SizedBox(
                    height: 50,
                  ),
                  const ReusableText(
                    textAlign: TextAlign.center,
                    title: 'Your email has been\nverified!',
                    weight: FontWeight.bold,
                    color: Colors.white,
                    size: 25,
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              // builder: (context) => const BottomNavBar()
                      builder:(context)=>const DocumentsVerification()
                      ));
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
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
