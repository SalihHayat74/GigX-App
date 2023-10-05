import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:gigx_website/provider/access_token_provider.dart';
import 'package:gigx_website/screen/license/scanning_completed_license.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../API Model/Auth API Model/user_kyc_api_model.dart';
import '../../constant/reusable_button.dart';
import 'driverlicense.dart';

class StartScanningLicense extends StatefulWidget {
  const StartScanningLicense({Key? key}) : super(key: key);

  @override
  State<StartScanningLicense> createState() => _StartScanningLicenseState();
}

class _StartScanningLicenseState extends State<StartScanningLicense> {

  final picker = ImagePicker();
  late Future<PickedFile?> pickedFile = Future.value(null);

  File? image;
  bool imageFetched=false;
  Future pickImage(BuildContext context) async {
    try {
      // pickedFile=picker.pickImage(source: ImageSource.gallery);
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      // print(image.readAsBytes());
      final imageTemp = File(image.path);
      UserKycModel? user =Provider.of<AccessTokenProvider>(context,listen: false).userKyc;
      // var bytes = await rootBundle.load(image.path);
      // var buffer = bytes.buffer;
      // var imageBytes = buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      // Encode the bytes
      // var imageBytes=await image.readAsBytes();
      // print(imageBytes);
      // var base64Image = base64Encode(imageBytes);
      // print(base64Image);
      // user?.document_two=base64Image;
      // user?.document_image_hand=base64Image;
      if(image.name.endsWith('.gif')){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(".Gif file not Supported")));
      }else{

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image added Successfully")));
        user!.document_one=image.path;
        user.document_image_hand=image.path;
        Provider.of<AccessTokenProvider>(context,listen: false).updateUserKyc(user);
        Provider.of<AccessTokenProvider>(context,listen:false).updateDrivingLicenceImage(image.path);
        print(user.document_one);
        print(user.document_two);
        print(user.document_image_hand);
        Provider.of<AccessTokenProvider>(context,listen:false).updateNidImage(user.document_image_hand);
        imageFetched=true;
        setState(() => this.image = imageTemp);
      }

    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const DriverLicense()),
                    (Route<dynamic> route) => false);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              )),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 170, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color(0xffFFFFFF), width: 2)),
                padding: const EdgeInsets.all(15),
                child:
                imageFetched?SizedBox(
                    width: MediaQuery.of(context).size.width*.8,
                    height: MediaQuery.of(context).size.height*.2,
                    child: Image.file(image!)):const Image(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('images/age-gender-id-card 1.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ReusableText(
              textAlign: TextAlign.center,
              size: 17,
              title:
                  'Place the Driver License in the frame,\nagainst a solid white background',
              color: Color(0xffB4B4B4),
            ),
            Spacer(),
            Container(
                padding: const EdgeInsets.all(3),
                // decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     border: Border.all(color: Colors.white, width: 1)),
                child: InkWell(
                  onTap: () {
                    pickImage(context);

                  },
                  child: const ReusableButton(
                    title: 'Pick Image',
                    value: 0,
                  ),
                )),
            SizedBox(height: 10,),
            InkWell(
              onTap: () {
                if(image==null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image is required")));
                }else {

                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScanningCompletedLicense()));
                }
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ScanningCompletedLicense()));
              },
              child: const ReusableButton(
                title: '   Proceed   ',
                value: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
