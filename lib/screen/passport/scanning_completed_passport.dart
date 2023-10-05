import 'package:flutter/material.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:provider/provider.dart';

import '../../API/api_client.dart';
import '../../constant/bottom_navigation_bar.dart';
import '../../provider/access_token_provider.dart';

class ScanningCompletedPassport extends StatefulWidget {
  const ScanningCompletedPassport({Key? key}) : super(key: key);

  @override
  State<ScanningCompletedPassport> createState() =>
      _ScanningCompletedPassportState();
}

class _ScanningCompletedPassportState extends State<ScanningCompletedPassport> {
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
              padding: const EdgeInsets.only(top: 200, bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image: AssetImage('images/done_mark.png')),
                  SizedBox(
                    height: 50,
                  ),
                  const ReusableText(
                    textAlign: TextAlign.center,
                    title: 'Congratulations',
                    weight: FontWeight.bold,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const ReusableText(
                    textAlign: TextAlign.center,
                    title: 'You have successfully completed the\nprocess.',
                    color: Color(0xffB4B4B4),
                  ),
                  Spacer(),
                  Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 145, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: const Color(0xff03E5D4), width: 2),
                        ),
                        child: const ReusableText(
                          title: 'Retake',
                          color: Color(0xff03E5D4),
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: InkWell(
                      onTap: (){
                        Provider.of<AccessTokenProvider>(context,listen: false).startLoading();
                        var user=Provider.of<AccessTokenProvider>(context,listen:false).userKyc;
                        Provider.of<AccessTokenProvider>(context,listen:false).updateUserKyc(user);
                        ApiClient().postKycData(user!, context);
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const BottomNavBar()),(route)=>false);
                      },
                      child: const ReusableButton(
                        title: 'Go to dashboard',
                        value: 0,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
