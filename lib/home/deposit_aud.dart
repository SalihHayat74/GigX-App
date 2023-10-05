import 'package:flutter/material.dart';
import 'package:gigx_website/constant/colors.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:provider/provider.dart';

import '../provider/access_token_provider.dart';

class DepositAUD extends StatefulWidget {
  const DepositAUD({Key? key}) : super(key: key);

  @override
  State<DepositAUD> createState() => _DepositAUDState();
}

class _DepositAUDState extends State<DepositAUD> {
  bool notification = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Deposit AUD'),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: [
                      const Image(
                          image: AssetImage('images/walletAssets/balance.png')),
                      const SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ReusableText(
                            title: 'How would you like to deposit?',
                            color: whiteColor,
                            size: 17,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ReusableText(
                            title: Provider.of<AccessTokenProvider>(context,listen: false).userInfo?.contributed=='null' ? 'Your Current Balance is 0.00 AUD':
                            "Your Current Balance is ${Provider.of<AccessTokenProvider>(context,listen: false).userInfo?.contributed}",
                            color: subtitleColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: subtitleColor,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    padding: EdgeInsets.only(top: 15, left: 20, bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 30,
                                child: Image(
                                    image: AssetImage(
                                        'images/navigationAssets/WalletColor.png')),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    title: 'PayID',
                                    color: Colors.white,
                                    weight: FontWeight.w500,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ReusableText(
                                    title: 'Daily Limit Remaining: \$2,000 AUD',
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: buttonColors1,
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
                              SizedBox(
                                height: 30,
                                child: Image(
                                  image: AssetImage(
                                      'images/DepositAUD_assets/Download.png'),
                                  color: buttonColors1,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    title: 'Direct Deposit',
                                    color: Colors.white,
                                    weight: FontWeight.w500,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ReusableText(
                                    title: 'Daily Limit Remaining: \$2,000 AUD',
                                    color: subtitleColor,
                                  ),
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
                        Divider(
                          indent: 60,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 30,
                                child: Image(
                                    image: AssetImage(
                                        'images/DepositAUD_assets/bitcoin.png')),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    title: 'BPAY',
                                    color: Colors.white,
                                    weight: FontWeight.w500,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ReusableText(
                                    title: 'Daily Limit Remaining: \$2,000 AUD',
                                    color: Colors.grey,
                                  ),
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
                  padding: const EdgeInsets.only(top: 20, left: 15, bottom: 8),
                  child: ReusableText(
                    title: 'Deposit History',
                    color: subtitleColor,
                    size: 18,
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: subtitleColor,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Image(
                            image: AssetImage(
                                'images/DepositAUD_assets/dollar.png')),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            title: 'Card Deposit',
                            color: Colors.white,
                            weight: FontWeight.w500,
                            size: 18,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ReusableText(
                            title: '\$100.00',
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      Spacer(),
                      ReusableText(
                        title: 'April 11, 2023',
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
