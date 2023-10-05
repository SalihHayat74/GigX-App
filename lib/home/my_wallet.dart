import 'package:flutter/material.dart';
import 'package:gigx_website/provider/access_token_provider.dart';
import 'package:provider/provider.dart';

import '../constant/reusable_text.dart';
import 'deposit_aud.dart';
import 'notifications.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
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
          title: const Text('My Wallet'),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Notifications()));
                },
                child: const Image(
                    image:
                        AssetImage('images/appBar_assets/Notification.png'))),
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      height: 30,
                    ),
                  ),
                  Container(
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
                        children: [
                          const Image(
                              image: AssetImage(
                                  'images/walletAssets/balance.png')),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ReusableText(
                                title: 'Available Balance',
                                color: Colors.grey,
                                size: 20,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ReusableText(
                                title: Provider.of<AccessTokenProvider>(context,listen: false).userInfo?.contributed=='null' ? '0.00 AUD':
                                "${Provider.of<AccessTokenProvider>(context,listen: false).userInfo?.contributed}",
                                color: Colors.white,
                                weight: FontWeight.w500,
                                size: 24,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const DepositAUD()));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xff03E5D4)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(

                                  children: const [
                                    Image(
                                      image: AssetImage(
                                          'images/walletAssets/deposit.png'),
                                      height: 50,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                      ),
                                      child: ReusableText(
                                        title: 'Deposit Funds',
                                        weight: FontWeight.bold,
                                        size: 14,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(width: 2,),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xff03E5D4)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                          'images/walletAssets/deposit.png'),
                                      height: 50,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                      ),
                                      child: ReusableText(
                                        title: 'Withdraw Funds',
                                        weight: FontWeight.bold,
                                        size: 14,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        title: '3 Wallets',
                        color: Colors.white,
                        weight: FontWeight.bold,
                        size: 20,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Image(
                              image:
                                  AssetImage('images/walletAssets/more.png')))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
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
                                height: 50,
                                child: Image(
                                    image: AssetImage(
                                        'images/walletAssets/Contracoin.png')),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    title: 'Contracoin',
                                    color: Colors.white,
                                    weight: FontWeight.w500,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ReusableText(
                                    title: 'CC',
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    title: '\$9.99',
                                    color: Colors.white,
                                    weight: FontWeight.w400,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ReusableText(
                                    title: '0.21113',
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.more_vert,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          indent: 75,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 50,
                                child: Image(
                                  image: AssetImage(
                                      'images/walletAssets/ethereum.png'),
                                  width: 50,
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
                                    title: 'Ethereum',
                                    color: Colors.white,
                                    weight: FontWeight.w500,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ReusableText(
                                    title: 'ETH',
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    title: '\$9.99',
                                    color: Colors.white,
                                    weight: FontWeight.w400,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ReusableText(
                                    title: '0.21113',
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.more_vert,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          indent: 75,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 50,
                                child: Image(
                                  image: AssetImage(
                                      'images/appBar_assets/mainLogo.png'),
                                  width: 50,
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
                                    title: 'GigXcoin',
                                    color: Colors.white,
                                    weight: FontWeight.w500,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ReusableText(
                                    title: 'GXC',
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    title: '\$9.99',
                                    color: Colors.white,
                                    weight: FontWeight.w400,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ReusableText(
                                    title: '0.21113',
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.more_vert,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
