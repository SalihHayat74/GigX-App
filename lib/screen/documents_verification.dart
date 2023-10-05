import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gigx_website/constant/colors.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:gigx_website/provider/access_token_provider.dart';
import 'package:gigx_website/screen/passport/passport.dart';
import 'package:provider/provider.dart';

import 'license/driverlicense.dart';

class DocumentsVerification extends StatefulWidget {
  const DocumentsVerification({Key? key}) : super(key: key);

  @override
  State<DocumentsVerification> createState() => _DocumentsVerificationState();
}

class _DocumentsVerificationState extends State<DocumentsVerification> {
  int button = 0;

  List<String> countryNames=[
    "Anagola",
    "Argentina",
    "American Samoa",
    "Austria",
    "Australia",
    "Aruba"
  ];
  List<String> countryImagesPaths=[
    'images/bottomsheet_images/emojione_flag-for-angola.png',
    'images/bottomsheet_images/emojione_flag-for-argentina.png',
    'images/bottomsheet_images/emojione_flag-for-american-samoa.png',
    'images/bottomsheet_images/emojione_flag-for-austria.png',
    'images/bottomsheet_images/emojione_flag-for-australia.png',
    'images/bottomsheet_images/emojione_flag-for-aruba.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const ReusableText(
            title: 'Document Verification',
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ReusableText(
                      title: 'Document Verification',
                      color: Colors.white,
                      weight: FontWeight.bold,
                      size: 27,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const ReusableText(
                      textAlign: TextAlign.start,
                      title:
                          'Please follow the steps below and\nfollow the instructions',
                      color: Color(0xffB4B4B4),
                      size: 15,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(top: 10, right: 10),
                            child: CircleAvatar(
                              radius: 3,
                              backgroundColor: Color(0xffB4B4B4),
                            ),
                          ),
                          ReusableText(
                            title:
                                'Upload a complete image of your\nID document.',
                            color: Color(0xffB4B4B4),
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(top: 10, right: 10),
                            child: CircleAvatar(
                              radius: 3,
                              backgroundColor: Color(0xffB4B4B4),
                            ),
                          ),
                          ReusableText(
                            title:
                                'Ensure all details are readable in\nthe image you upload or scan.',
                            color: Color(0xffB4B4B4),
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(top: 10, right: 10),
                            child: CircleAvatar(
                              radius: 3,
                              backgroundColor: Color(0xffB4B4B4),
                            ),
                          ),
                          ReusableText(
                            title:
                                'Ensure the document is the original and\nhas not expired.',
                            color: Color(0xffB4B4B4),
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(top: 10, right: 10),
                            child: CircleAvatar(
                              radius: 3,
                              backgroundColor: Color(0xffB4B4B4),
                            ),
                          ),
                          ReusableText(
                            title:
                                'Place document against a solid white\nbackground.',
                            color: Color(0xffB4B4B4),
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ReusableText(
                      title: 'Document Issuing Country/Region',
                      color: Colors.white,
                      size: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Provider.of<AccessTokenProvider>(context).countryName.isNotEmpty?SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              Provider.of<AccessTokenProvider>(context,listen:false).countryFlagPath,
                              fit: BoxFit.fill,
                              // height: 1,
                            ),
                          ):const Icon(Icons.flag_circle_outlined,size: 30,color: Colors.white,),
                          const SizedBox(width: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width*.72,
                            padding: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: TextField(
                              readOnly: true,
                              onTap: () async {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(45),
                                            topRight: Radius.circular(45))),
                                    context: context,
                                    builder: (context) => BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 3, sigmaY: 3),
                                        child: BottomSheet(
                                          countryName: countryNames,
                                          countryImages: countryImagesPaths,
                                        )));
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.black,
                                  ),
                                  hintText: Provider.of<AccessTokenProvider>(context,listen:false).countryName.isNotEmpty ?Provider.of<AccessTokenProvider>(context).countryName: "Select Country",
                                  // prefixIcon:
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: button == 0
                                        ? const Color(0xff03E5D4)
                                        : Colors.grey,
                                    width: 2),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ReusableText(
                                  title: '1',
                                  color: Colors.white,
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Container(
                                height: 10,
                                width: 2,
                                color: Color(0xffB4B4B4),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Container(
                                height: 10,
                                width: 2,
                                color: const Color(0xffB4B4B4),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Container(
                                height: 10,
                                width: 2,
                                color: const Color(0xffB4B4B4),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Container(
                                height: 10,
                                width: 2,
                                color: const Color(0xffB4B4B4),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Container(
                                height: 10,
                                width: 2,
                                color: const Color(0xffB4B4B4),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Container(
                                height: 10,
                                width: 2,
                                color: Color(0xffB4B4B4),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: button == 1
                                        ? Color(0xff03E5D4)
                                        : Colors.grey,
                                    width: 2),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ReusableText(
                                  title: '2',
                                  color: Colors.white,
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    button = 0;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const DriverLicense()));
                                  });
                                },
                                child: Container(
                                  // alignment: Alignment.centerLeft,
                                  width: MediaQuery.of(context).size.width*.75,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xff1E1E1E),
                                            Color(0xff1E1E1E),
                                            Color(0xff1E1E1E),
                                            Color(0x2003E5D4)
                                          ]),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xff1E1E1E)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Image(
                                            image:
                                                AssetImage('images/licance.png')),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: ReusableText(
                                            title: 'Driver License',
                                            color: button == 0
                                                ? Color(0xff03E5D4)
                                                : Colors.grey,
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 40,
                                        // ),
                                        Image(
                                          image:
                                              AssetImage('images/forwordArrow.png'),
                                          color: button == 0
                                              ? Color(0xff03E5D4)
                                              : Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    button = 1;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const ScanPassport()));
                                  });
                                },
                                child: Container(
                                  // width: 320,
                                  width: MediaQuery.of(context).size.width*.75,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xff1E1E1E),
                                            Color(0xff1E1E1E),
                                            Color(0xff1E1E1E),
                                            Color(0x2003E5D4)
                                          ]),
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xff1E1E1E)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                          image: button == 1
                                              ? const AssetImage(
                                                  'images/passport_color.png')
                                              : const AssetImage('images/Passport.png'),
                                          height: 25,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: ReusableText(
                                            title: 'Passport',
                                            color: button == 1
                                                ? Color(0xff03E5D4)
                                                : Colors.grey,
                                          ),
                                        ),

                                        Image(
                                          image:
                                              const AssetImage('images/forwordArrow.png'),
                                          color: button == 1
                                              ? Color(0xff03E5D4)
                                              : Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class BottomSheet extends StatefulWidget {
  List<String> countryName=[];
  List<String> countryImages=[];

  BottomSheet({
   required this.countryName,
   required this.countryImages
});
  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {


  TextEditingController searchController = TextEditingController();

  List<String> foundData=[];
  bool visibleSearchData = false;
  bool visibleCountryName=false;

  void _runFilter(String enteredKeyword) {
    setState(() {
      visibleSearchData=true;
      visibleCountryName=false;
    });
    List<String> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = widget.countryName;
      setState(() {
        visibleCountryName=true;
      });
    } else {
      visibleCountryName=false;
      print(enteredKeyword);

      results = widget.countryName.where((countryName) =>
          countryName.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
      print(results);
    }
    // Refresh the UI
    setState(() {
      foundData = results;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color(0xff03E5D4), blurRadius: 10, spreadRadius: 1),
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ReusableText(
                title: 'Country/Region of Issue',
                color: whiteColor,
                weight: FontWeight.w400,
                size: 22,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: buttonColors1)),
            child: TextField(
              controller: searchController,
              onChanged: (value) => _runFilter(value),
              style: const TextStyle(color: whiteColor),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  prefixIcon: Image(
                    image: AssetImage('images/Search.png'),
                    color: buttonColors1,
                  ),
                  hintStyle: TextStyle(color: subtitleColor)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.5,
            child: visibleSearchData?
            ListView.builder(
              itemCount: foundData.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    var user=Provider.of<AccessTokenProvider>(context,listen:false).userKyc;
                    if(user?.country==null){
                      user!.country=foundData[index];
                    }else{
                      user!.country=foundData[index];
                    }
                    Provider.of<AccessTokenProvider>(context,listen:false).updateUserKyc(user);
                    print("Country= ${Provider.of<AccessTokenProvider>(context,listen:false).userKyc?.country}");
                    Provider.of<AccessTokenProvider>(context,listen:false).updateCountryName(foundData[index],
                      widget.countryImages[widget.countryName.indexOf(foundData[index])]
                    );
                    searchController.text=foundData[index];

                    setState(() {

                    });
                    Navigator.pop(context);
                    print(Provider.of<AccessTokenProvider>(context,listen:false).countryName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(widget.countryImages[widget.countryName.indexOf(foundData[index])]),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ReusableText(
                          title: foundData[index],
                          color: whiteColor,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                );
              },
            ):
            ListView.builder(
              itemCount: widget.countryName.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){

                    var user=Provider.of<AccessTokenProvider>(context,listen:false).userKyc;
                    if(user?.country==null){
                      user!.country=widget.countryName[index];
                    }else{
                      user!.country=widget.countryName[index];
                    }
                    Provider.of<AccessTokenProvider>(context,listen:false).updateUserKyc(user);
                    print("Country= ${Provider.of<AccessTokenProvider>(context,listen:false).userKyc?.country}");

                    Provider.of<AccessTokenProvider>(context,listen:false).updateCountryName(widget.countryName[index],widget.countryImages[index]);
                    print(Provider.of<AccessTokenProvider>(context,listen:false).countryName);
                    searchController.text = widget.countryName[index];
                    setState(() {

                    });
                    Navigator.of(context).pop();
                    },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(widget.countryImages[index]),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ReusableText(
                          title: widget.countryName[index],
                          color: whiteColor,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

        ]),
      ),
    );
  }
}
