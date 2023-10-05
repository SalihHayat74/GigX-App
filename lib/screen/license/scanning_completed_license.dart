import 'package:flutter/material.dart';
import 'package:gigx_website/API/api_client.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:provider/provider.dart';

import '../../API Model/Auth API Model/user_kyc_api_model.dart';
import '../../provider/access_token_provider.dart';

class ScanningCompletedLicense extends StatefulWidget {
  const ScanningCompletedLicense({Key? key}) : super(key: key);

  @override
  State<ScanningCompletedLicense> createState() =>
      _ScanningCompletedLicenseState();
}

class _ScanningCompletedLicenseState extends State<ScanningCompletedLicense> {
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
                  const SizedBox(
                    height: 50,
                  ),
                  const ReusableText(
                    textAlign: TextAlign.center,
                    title: 'Scanning Successful',
                    weight: FontWeight.bold,
                    color: Colors.white,
                    size: 25,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ReusableText(
                    textAlign: TextAlign.center,
                    title: 'Please go for the next step',
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
                            const EdgeInsets.symmetric(horizontal: 135, vertical: 15),
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
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        // UserKycModel? data=Provider.of<AccessTokenProvider>(context,listen: false).userKyc;
                        // print(Provider.of<AccessTokenProvider>(context,listen: false).userKyc);
                        // // print(data?.toJson());
                        // if(data!=null)ApiClient().getDoc(data,context);
                      },
                      child: const ReusableButton(
                        title: 'Continue',
                        value: 20,
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
