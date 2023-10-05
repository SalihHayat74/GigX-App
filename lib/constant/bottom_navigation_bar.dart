import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gigx_website/API%20Model/Auth%20API%20Model/current_prices_api_model.dart';
import 'package:gigx_website/API%20Model/Auth%20API%20Model/ico_stage_api_data_model.dart';
import 'package:gigx_website/API%20Model/Auth%20API%20Model/ico_stage_data_full_model.dart';
import 'package:gigx_website/API%20Model/Auth%20API%20Model/user_info_api_model.dart';
import 'package:gigx_website/API/api_client.dart';
// import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import '../API Model/Auth API Model/active_bonus_api_model.dart';
import '../home/my_card.dart';
import '../home/my_wallet.dart';
import '../home/setting.dart';
import '../home/transection.dart';
import '../provider/access_token_provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  ApiClient apiClient=ApiClient();

  int _currentIndex = 0;
  final List<Widget> _pages = [Wallet(), Cart(), MyCard(), Settings()];
  bool isUserInfoFetched=false;
  fetchUserInfo()async{
    Response response=await apiClient.userInfo(context);
    UserInfoModel userInfo=UserInfoModel.from(response.data['response']);
    Provider.of<AccessTokenProvider>(context,listen: false).updateUserInfo(userInfo);
    print(Provider.of<AccessTokenProvider>(context,listen: false).userInfo?.email);
    setState(() {
      isUserInfoFetched=true;
    });
  }

  bool isActiveBonusFetched=false;
  fetchActiveBonus()async{
    Response response=await apiClient.getActiveBonus(context);
    ActiveBonusApiModel activeBonus=ActiveBonusApiModel.fromJson(response.data['response']);
    Provider.of<AccessTokenProvider>(context,listen: false).updateActiveBonus(activeBonus);
    setState(() {
      isActiveBonusFetched=true;
    });
  }

  bool isCurrentPricesFetched=false;
  fetchCurrentPrices()async{
    Response response=await apiClient.getcurrentPrices(context);
    CurrentPricesModel currentPrices=CurrentPricesModel.fromJson(response.data['response']);
    Provider.of<AccessTokenProvider>(context,listen: false).updateCurrentPrices(currentPrices);
    setState(() {
      isCurrentPricesFetched=true;
    });

  }

  bool isIcoStageDataMinimalFetched=false;
  fetchIcoStageDataMinimal()async{
    Response response=await apiClient.icoStageDataMinimal();
    IcoStageMinimalApiModel icoStageMinimal=IcoStageMinimalApiModel.fromJson(response.data['response']);
    Provider.of<AccessTokenProvider>(context,listen: false).updateIcoStageApiMinimal(icoStageMinimal);
    setState(() {
      isIcoStageDataMinimalFetched=true;
    });
  }

  bool isIcoStageDataFullFetched=false;
  fetchIcoStageDataFull()async{
    Response response=await apiClient.getFullStageData();
    IcoStageFullApiModel icoStageFullData=IcoStageFullApiModel.fromJson(response.data['response']);
    Provider.of<AccessTokenProvider>(context,listen: false).updateIcoStageFullData(icoStageFullData);
    setState(() {
      isIcoStageDataFullFetched=true;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    fetchUserInfo();
    fetchActiveBonus();
    fetchCurrentPrices();
    fetchIcoStageDataFull();
    fetchIcoStageDataMinimal();
    // checkStatus();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child:
      // Provider.of<AccessTokenProvider>(context).isCurrentPricesFetched &&
      //     Provider.of<AccessTokenProvider>(context).isActiveBonusFetched &&
      //     Provider.of<AccessTokenProvider>(context).icoStageDataFullFetched &&
      //     Provider.of<AccessTokenProvider>(context).icoStageDataMinimalFetched &&
      //     Provider.of<AccessTokenProvider>(context).userInfoFetched?
      isUserInfoFetched &&
          isActiveBonusFetched &&
          isCurrentPricesFetched &&
          isIcoStageDataMinimalFetched&&
          isIcoStageDataFullFetched?
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          // alignment: Alignment.bottomCenter,
          children: [
            _pages[_currentIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.1,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff03E5D4),
                        blurRadius: 10,
                        spreadRadius: 1),
                  ],
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: _currentIndex == 0
                                  ? const AssetImage(
                                  'images/navigationAssets/WalletColor.png')
                                  : const AssetImage(
                                  'images/navigationAssets/Wallet.png'),
                              height: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: _currentIndex == 0
                                    ? Color(0xff03E5D4)
                                    : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: _currentIndex == 1
                                    ? const AssetImage(
                                    'images/navigationAssets/ChartColor.png')
                                    : const AssetImage(
                                    'images/navigationAssets/Chart.png'),
                                height: 22,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: _currentIndex == 1
                                      ? Color(0xff03E5D4)
                                      : Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = 2;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: _currentIndex == 2
                                    ? const AssetImage(
                                    'images/navigationAssets/CardColor.png')
                                    : const AssetImage(
                                    'images/navigationAssets/Card.png'),
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: _currentIndex == 2
                                      ? Color(0xff03E5D4)
                                      : Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = 3;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: _currentIndex == 3
                                    ? const AssetImage(
                                    'images/navigationAssets/SettingColor.png')
                                    : const AssetImage(
                                    'images/navigationAssets/Setting.png'),
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: _currentIndex == 3
                                      ? const Color(0xff03E5D4)
                                      : Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ):
      Scaffold(
          backgroundColor: Colors.black38,
          body: Stack(
            alignment: Alignment.center,
            children: const [
              Image(
                image: AssetImage('images/background.png'),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Center(
                child: Image(
                  image: AssetImage('images/splashLogo.png'),
                ),
              )
            ],
          ))
      ,
    );
  }
}
