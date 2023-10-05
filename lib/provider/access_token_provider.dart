
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gigx_website/API%20Model/Auth%20API%20Model/access_token_model.dart';
import 'package:gigx_website/API%20Model/Auth%20API%20Model/active_bonus_api_model.dart';
import 'package:gigx_website/API%20Model/Auth%20API%20Model/ico_stage_data_full_model.dart';

import '../API Model/Auth API Model/current_prices_api_model.dart';
import '../API Model/Auth API Model/ico_stage_api_data_model.dart';
import '../API Model/Auth API Model/user_info_api_model.dart';
import '../API Model/Auth API Model/user_kyc_api_model.dart';


///    ========================> Important <=========================
///    When user get logged in to the app all of his data is stored
///    here in this provider variables
///    If You want to access data use the below commands
///    Reading Data=>
///            Provider.of<AccessTokenProvide>(context).{Variable}
///    Updating Data=>
///            Provider.of<AccessTokenProvide>(context,listen:false).{Method}
///

class AccessTokenProvider with ChangeNotifier{
  AccessTokenModel? accessTokenInstance;

  ///==================================>
  /// Ico stage data minimal api instance
  ///===================================>
  bool icoStageDataMinimalFetched=false;
  IcoStageMinimalApiModel? icoStageApiModel;
  updateIcoStageMinimalData(IcoStageMinimalApiModel icoStageData){
    icoStageApiModel=icoStageData;
    icoStageDataMinimalFetched=true;
    notifyListeners();
  }

  ///
  /// User Info Instance
  ///
  bool userInfoFetched=false;
  UserInfoModel? userInfo;
  updateUserInformation(UserInfoModel user){
    userInfo=user;
    userInfoFetched=true;
    notifyListeners();
  }

  ///
  /// Fetch Current Prices
  ///
  bool isCurrentPricesFetched=false;
  CurrentPricesModel? currentPricesInstance;
  updateCurrentPrices(CurrentPricesModel currentPrices){
    currentPricesInstance=currentPrices;
    isCurrentPricesFetched=true;
    notifyListeners();
  }

  ///
  /// Fetch Active Bonuses
  ///
  bool isActiveBonusFetched=false;
  ActiveBonusApiModel? activeBonusInstance;
  updateActiveBonus(ActiveBonusApiModel activeBonus){
    activeBonusInstance=activeBonus;
    isActiveBonusFetched=true;
    notifyListeners();
  }

  ///
  /// Ico stage data minimal api instance
  ///
  bool icoStageDataFullFetched=false;
  IcoStageFullApiModel? icoStageFull;
  updateIcoStageFullData(IcoStageFullApiModel icoStageData){
    icoStageFull=icoStageData;
    icoStageDataFullFetched=true;
    notifyListeners();
  }

  String? document_one;
  String? document_image_hand;
  String? document_two;
  String countryName='';
  String countryFlagPath='';
  bool isLoading=false;
  UserKycModel? userKyc;
  UserKycModel? userKyc1;

  updateUserInfo(var userInformation){
    userInfo=userInformation;
    notifyListeners();
  }

  updateUserKyc(var user){
    userKyc=user;
    notifyListeners();
  }
  updateUserKyc1(var user){
    userKyc=user;
    notifyListeners();
  }

  updateDrivingLicenceImage(String value){
    document_one=value;
    notifyListeners();
  }
  updatePassportImage(String value){
    document_two=value;
    notifyListeners();
  }
  updateNidImage(var value){
    document_image_hand=value;
    notifyListeners();
  }


  updateCountryName(String value,String countryFlag){
    countryName=value;
    countryFlagPath=countryFlag;
    notifyListeners();
  }
  startLoading(){
    isLoading=true;
    notifyListeners();
  }
  stopLoading(){
    isLoading=false;
    notifyListeners();
  }

  updateIcoStageApiMinimal(IcoStageMinimalApiModel instance){
    icoStageApiModel=instance;
    notifyListeners();
  }

  update(AccessTokenModel instance){
    accessTokenInstance = instance;
    notifyListeners();
  }



}