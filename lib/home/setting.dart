import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gigx_website/API/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API Model/Auth API Model/signup_api_model.dart';
import '../API Model/Auth API Model/user_kyc_api_model.dart';
import '../constant/colors.dart';
import '../constant/reusable_text.dart';
import '../screen/documents_verification.dart';
import '../screen/login.dart';
import 'notifications.dart';
import 'package:provider/provider.dart';

import '../provider/access_token_provider.dart';

import 'package:gigx_website/static constants/static_constants.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool notification = false;
  bool theme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Image(
            image: AssetImage('images/appBar_assets/mainLogo.png'),
          ),
        ),
        title: const Text('Settings'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Notifications()));
              },
              child: const Image(
                  image: AssetImage('images/appBar_assets/Notification.png'))),
          const SizedBox(
            width: 10,
          )
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const Image(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      padding: const EdgeInsets.only(top: 15, left: 20, bottom: 20),
                      width: double.infinity,
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: InkWell(
                              onTap: (){
                                ///
                                /// fetching user data from api
                                ///
                                // ApiClient().userInfo(context);

                                ///
                                /// Get kyc status of user
                                ///
                                // ApiClient().getKycStatus(context);

                              },
                              child: Row(
                                children: [
                                  const SizedBox(
                                    height: 30,
                                    child: Image(
                                      image: AssetImage('images/Ellipse.png'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ReusableText(
                                        title: Provider.of<AccessTokenProvider>(context).userInfo?.name,
                                        color: Colors.white,
                                        weight: FontWeight.w500,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ReusableText(
                                          title: Provider.of<AccessTokenProvider>(context).userInfo?.email,
                                          color: subtitleColor),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: buttonColors1,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      padding: const EdgeInsets.only(top: 15, left: 20, bottom: 20),
                      width: double.infinity,
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 30,
                                  child: Image(
                                    image: AssetImage(
                                        'images/walletAssets/deposit.png'),
                                    color: buttonColors1,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    ReusableText(
                                      title: 'Deposit Funds',
                                      color: Colors.white,
                                      weight: FontWeight.w500,
                                      size: 18,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: buttonColors1,
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            indent: 60,
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 30,
                                  child: Image(
                                    image: AssetImage(
                                        'images/walletAssets/withdraw.png'),
                                    color: buttonColors1,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    ReusableText(
                                      title: 'Withdraw Funds',
                                      color: Colors.white,
                                      weight: FontWeight.w500,
                                      size: 18,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(Icons.arrow_forward_ios,
                                    color: buttonColors1),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      padding: const EdgeInsets.only(top: 15, left: 20, bottom: 20),
                      width: double.infinity,
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 30,
                                  child: Image(
                                    image: AssetImage(
                                        'images/settings_assets/Category.png'),
                                    color: buttonColors1,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    ReusableText(
                                      title: 'Theme',
                                      color: Colors.white,
                                      weight: FontWeight.w500,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ReusableText(
                                      title: 'Dark mode',
                                      color: subtitleColor,
                                    )
                                  ],
                                ),
                                Spacer(),
                                FlutterSwitch(
                                  width: 50.0,
                                  height: 25.0,
                                  valueFontSize: 10,
                                  toggleSize: 20.0,
                                  activeColor: buttonColors1,
                                  value: theme,
                                  borderRadius: 25.0,
                                  onToggle: (value) {
                                    setState(() {
                                      theme = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                          Divider(
                            indent: 60,
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 30,
                                  child: Image(
                                    image: AssetImage(
                                        'images/settings_assets/Tick Square.png'),
                                    color: buttonColors1,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    ReusableText(
                                      title: 'Push Notifications',
                                      color: Colors.white,
                                      weight: FontWeight.w500,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ReusableText(
                                      title: 'Off',
                                      color: subtitleColor,
                                    )
                                  ],
                                ),
                                Spacer(),
                                FlutterSwitch(
                                  width: 50.0,
                                  height: 25.0,
                                  valueFontSize: 10,
                                  toggleSize: 20.0,
                                  activeColor: buttonColors1,
                                  value: notification,
                                  borderRadius: 25.0,
                                  onToggle: (value) {
                                    setState(() {
                                      notification = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                          Divider(
                            indent: 60,
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 30,
                                  child: Image(
                                      image: AssetImage(
                                          'images/settings_assets/Paper.png')),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    ReusableText(
                                      title: 'Currency',
                                      color: Colors.white,
                                      weight: FontWeight.w500,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ReusableText(
                                      title: 'AUD',
                                      color: subtitleColor,
                                    )
                                  ],
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios,
                                    color: buttonColors1),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      padding: const EdgeInsets.only(top: 15, left: 20, bottom: 20),
                      width: double.infinity,
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 30,
                                  child: Image(
                                    image: AssetImage('images/Search.png'),
                                    color: buttonColors1,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    ReusableText(
                                      title: 'Help & Support',
                                      color: Colors.white,
                                      weight: FontWeight.w500,
                                      size: 18,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: buttonColors1,
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            indent: 60,
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 30,
                                  child: Image(
                                    image: AssetImage(
                                        'images/settings_assets/Document.png'),
                                    color: buttonColors1,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    ReusableText(
                                      title: 'Terms & Conditions',
                                      color: Colors.white,
                                      weight: FontWeight.w500,
                                      size: 18,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(Icons.arrow_forward_ios,
                                    color: buttonColors1),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            indent: 60,
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 30,
                                  child: Image(
                                      image: AssetImage(
                                          'images/settings_assets/Paper.png')),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    ReusableText(
                                      title: 'Privacy Policy',
                                      color: Colors.white,
                                      weight: FontWeight.w500,
                                      size: 18,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(Icons.arrow_forward_ios,
                                    color: buttonColors1),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: InkWell(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                content: const Text("Are you sure to log out"),
                                actions: [
                                  TextButton(
                                      onPressed: ()async{
                                        final Future<SharedPreferences> prefrences = SharedPreferences.getInstance();
                                        SharedPreferences prefs= await prefrences;
                                        prefs.setString(SignUpAPIFields.email, '');
                                        prefs.setString(SignUpAPIFields.password, '');
                                        // SharedPreferences prefs=await _prefs;
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LogIn()), (route) => false);
                                      },
                                      child: const Text("Log out")),
                                  TextButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel"))
                                ],
                              );
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 15, left: 20, bottom: 20),
                        width: double.infinity,
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    height: 30,
                                    child: Image(
                                      image: AssetImage(
                                          'images/settings_assets/Logout.png'),
                                      color: buttonColors1,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      ReusableText(
                                        title: 'Log Out',
                                        color: Colors.white,
                                        weight: FontWeight.w500,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: buttonColors1,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
