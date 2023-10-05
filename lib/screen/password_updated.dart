import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:gigx_website/screen/login.dart';

class PasswordUpdated extends StatefulWidget {
  const PasswordUpdated({Key? key}) : super(key: key);

  @override
  State<PasswordUpdated> createState() => _PasswordUpdatedState();
}

class _PasswordUpdatedState extends State<PasswordUpdated> {
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
                    title: 'Your password has been\nupdated!',
                    weight: FontWeight.bold,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    height: 300,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => LogIn()),
                          (Route<dynamic> route) => false);
                    },
                    child: ReusableButton(
                      title: 'Back to login',
                      value: 0,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
