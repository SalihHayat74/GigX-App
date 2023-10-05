import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:gigx_website/screen/verify_email.dart';

class CreatedAccount extends StatefulWidget {
  const CreatedAccount({Key? key}) : super(key: key);

  @override
  State<CreatedAccount> createState() => _CreatedAccountState();
}

class _CreatedAccountState extends State<CreatedAccount> {
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
                  SizedBox(
                    height: 50,
                  ),
                  const ReusableText(
                    textAlign: TextAlign.center,
                    title: 'Your account has been\ncreated!',
                    weight: FontWeight.bold,
                    color: Colors.white,
                    size: 25,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ReusableText(
                    textAlign: TextAlign.center,
                    title:
                        'Complete your email and mobile\nnumber verification',
                    color: Color(
                      0xffB4B4B4,
                    ),
                    spacing: 1,
                    size: 16,
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VerifyEmail()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: ReusableButton(
                        title: 'Complete verification',
                        value: 0,
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
