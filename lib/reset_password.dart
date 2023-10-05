import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:gigx_website/screen/password_updated.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool visibilityPassword = false;
  bool visibilityConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: ReusableText(
            title: 'Reset Password',
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  ReusableText(
                    title: 'Reset Password',
                    color: Colors.white,
                    size: 25,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ReusableText(
                    title: 'Set the new password for your account',
                    color: Color(0xffB4B4B4),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        obscureText: visibilityPassword,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            suffixIcon: visibilityPassword
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visibilityPassword =
                                            !visibilityPassword;
                                      });
                                    },
                                    icon: Icon(Icons.visibility_off))
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visibilityPassword =
                                            !visibilityPassword;
                                      });
                                    },
                                    icon: Icon(Icons.visibility)),
                            prefixIcon: Icon(
                              Icons.lock_outlined,
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
                        obscureText: visibilityConfirmPassword,
                        decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            border: InputBorder.none,
                            suffixIcon: visibilityConfirmPassword
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visibilityConfirmPassword =
                                            !visibilityConfirmPassword;
                                      });
                                    },
                                    icon: Icon(Icons.visibility_off))
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visibilityConfirmPassword =
                                            !visibilityConfirmPassword;
                                      });
                                    },
                                    icon: Icon(Icons.visibility)),
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PasswordUpdated()));
                    },
                    child: ReusableButton(
                      title: 'Reset password',
                      value: 0,
                    ),
                  ),
                ]),
              ),
            )
          ],
        ));
  }
}
