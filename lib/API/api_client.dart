import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API Model/Auth API Model/access_token_model.dart';
import '../API Model/Auth API Model/signup_api_model.dart';
import '../API Model/Auth API Model/user_kyc_api_model.dart';
import '../constant/bottom_navigation_bar.dart';
import '../provider/access_token_provider.dart';
import '../screen/created_account.dart';
import '../static constants/static_constants.dart';
import 'package:http/http.dart' as Http;

class ApiClient {
  final Dio _dio = Dio();
  // final HttpClient http=HttpClient();

  ///*****************************************************
  /// User Signup or registration Api
  ///*****************************************************
  Future registerUser(Map<String,dynamic> userData,BuildContext context) async {
    try {
      Response response = await _dio.post(
          "${StaticValues.baseUrl}${StaticValues.signupPath}",  //ENDPONT URL
          data: userData, //REQUEST BODY
          queryParameters: {

          },  //QUERY PARAMETERS
        options: Options(
          headers: {
            "Accept":"application/json"
          }
        )

      );

      print(response.headers);
      print(response);
      Provider.of<AccessTokenProvider>(context,listen: false).stopLoading();
      if(response.statusCode==200){
        await Provider.of<AccessTokenProvider>(context,listen:false).update(AccessTokenModel.fromJson(response.data));
        print(Provider.of<AccessTokenProvider>(context,listen:false).accessTokenInstance?.accessToken);
        final Future<SharedPreferences> prefrences = SharedPreferences.getInstance();
        SharedPreferences prefs= await prefrences;
        prefs.setString(SignUpAPIFields.email, userData[SignUpAPIFields.email]);
        prefs.setString(SignUpAPIFields.password, userData[SignUpAPIFields.password]);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const CreatedAccount()),(route)=>false);
      }else{

      }
      //returns the successful json object
      // return response.data;
    } on DioError catch (e) {
      //returns the error object if there is
      print(e.response!.data);
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e.response!.data}")));
      Provider.of<AccessTokenProvider>(context,listen: false).stopLoading();
      return e.response!.data;
    }
  }

  ///*****************************************************
  /// User Login Api
  ///*****************************************************
  login(Map<String,dynamic> user,BuildContext context) async {
    try {
      Response response = await _dio.post(
          "${StaticValues.baseUrl}${StaticValues.loginPath}",  //ENDPONT URL
          data: user, //REQUEST BODY
          // queryParameters: {
          //
          // },  //QUERY PARAMETERS
          options: Options(
            // method: "POST"
          )
      );
      // print(response.statusCode);
      print(response);

      if(response.statusCode==200){
        print(response.data);
        Provider.of<AccessTokenProvider>(context,listen:false).update(AccessTokenModel.fromJson(response.data));
        print(Provider.of<AccessTokenProvider>(context,listen:false).accessTokenInstance?.accessToken);
        final Future<SharedPreferences> prefrences = SharedPreferences.getInstance();
        SharedPreferences prefs= await prefrences;
        await prefs.setString(SignUpAPIFields.email, user[SignUpAPIFields.email]);
        await prefs.setString(SignUpAPIFields.password, user[SignUpAPIFields.password]);
        // SharedPreferences prefs=await _prefs;
        Provider.of<AccessTokenProvider>(context,listen: false).stopLoading();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavBar()),(route)=>false);
      }else{
        Provider.of<AccessTokenProvider>(context,listen: false).stopLoading();
        return response.data;

      }
      //returns the successful json object
      // return response.data;
    } on DioError catch (e) {
      Fluttertoast.showToast(msg: "Error: $e");
      Provider.of<AccessTokenProvider>(context,listen: false).stopLoading();
      return e;
    }
  }

  ///*****************************************************
  /// Get User information from api
  ///*****************************************************
  Future userInfo(BuildContext context) async {
    try {
      print(Provider.of<AccessTokenProvider>(context,listen: false).accessTokenInstance?.accessToken);
      Response response = await _dio.get(
        "${StaticValues.baseUrl}${StaticValues.userInfoPath}",  //ENDPONT URL
        // data: userData, //REQUEST BODY
        queryParameters: {
          'secret':StaticValues.secret
        },  //QUERY PARAMETERS
        options: Options(
          // responseType: ResponseType.json,
          headers: {"Authorization": "Bearer ${Provider.of<AccessTokenProvider>(context,listen: false).accessTokenInstance?.accessToken}"}, //HEADERS
          // method: "POST"
        )
      );

      print("==========> UserInfo <===========");
      print(response);

      print("==========> UserInfo <===========");

      if(response.statusCode==200){
        return response;

      }else{

      }
      //returns the successful json object
      // return response.data;
    } on DioError catch (e) {
      Fluttertoast.showToast(msg: "Error: $e");
      return e;
    }
  }

  ///*****************************************************
  /// Post user kyc status
  ///*****************************************************
  Future getKycStatus(BuildContext context) async {
    try {
      print(Provider.of<AccessTokenProvider>(context,listen: false).accessTokenInstance?.accessToken);
      Response response = await _dio.get(
          "${StaticValues.baseUrl}${StaticValues.getKycStatusPath}",  //ENDPONT URL
          queryParameters: {
            'secret':StaticValues.secret
          },  //QUERY PARAMETERS
          options: Options(
            // responseType: ResponseType.json,
            headers: {"Authorization": "Bearer ${Provider.of<AccessTokenProvider>(context,listen: false).accessTokenInstance?.accessToken}"}, //HEADERS
            // method: "POST"
          )
      );


      if(response.statusCode==200){
      // var data=response.data;
        showDialog(context: context,
            builder:(context){
          return AlertDialog(
            content: Card(
              child: ListTile(
                title: Text("${response.data['response']}"),
              ),
            ),
          );
            });

      }else{

      }
      //returns the successful json object
      // return response.data;
    } on DioError catch (e) {
      //returns the error object if there is
      // return e.response!.data;
      Fluttertoast.showToast(msg: "Error: $e");

      return e;
    }
  }

  ///*****************************************************
  /// Post user kyc
  ///*****************************************************
  Future postUserKyc(data,BuildContext context) async {
    try {
      print(Provider.of<AccessTokenProvider>(context,listen: false).accessTokenInstance?.accessToken);
      Response response = await _dio.post(
          "${StaticValues.baseUrl}${StaticValues.postKycPath}",  //ENDPONT URL
          data: data, //REQUEST BODY
          queryParameters: {
            'secret':StaticValues.secret
          },  //QUERY PARAMETERS
          options: Options(
            // responseType: ResponseType.json,
            headers: {"Authorization": "Bearer ${Provider.of<AccessTokenProvider>(context,listen: false).accessTokenInstance?.accessToken}"}, //HEADERS
            method: "POST"
          )
      );


      if(response.statusCode==200){

      }else{

      }
      //returns the successful json object
      // return response.data;
    } on DioError catch (e) {
      //returns the error object if there is
      // return e.response!.data;
      Fluttertoast.showToast(msg: "Error: $e");
      return e;
    }
  }

  ///*****************************************************
  /// Get User Ico Stage data minimal Api
  ///*****************************************************
  icoStageDataMinimal() async {
    try {
      Response response = await _dio.get(
          "${StaticValues.baseUrl}${StaticValues.icoStageDataMinimalPath}",  //ENDPONT URL
          queryParameters: {
            "secret":StaticValues.secret
          },  //QUERY PARAMETERS
          options: Options(
            // method: "POST"
          )
      );

      if(response.statusCode==200){
        return response;
      }else{
        // return response.data;
      }
      //returns the successful json object
      // return response.data;
    } on DioError catch (e) {
      //returns the error object if there is
      // return e.response!.data;
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
      Fluttertoast.showToast(msg: "Error: $e");

      return e;
    }
  }

  ///*****************************************************
  /// Get Active bonus
  ///*****************************************************
  getActiveBonus(BuildContext context) async {
    try {
      Response response = await _dio.get(
          "${StaticValues.baseUrl}${StaticValues.activeBonusPath}",  //ENDPONT URL
          queryParameters: {
            "secret":StaticValues.secret
          },  //QUERY PARAMETERS
          options: Options(
            // method: "POST"
          )
      );
      // print(response.statusCode);
      print("==========> Active Bonus <===========");

      print(response);

      print("==========> Active Bonus <===========");


      if(response.statusCode==200){
        return response;
      }else{
        return response.data;
      }
      //returns the successful json object
      // return response.data;
    } on DioError catch (e) {
      //returns the error object if there is
      // return e.response!.data;
      Fluttertoast.showToast(msg: "Error: $e");
      return e;
    }
  }

  ///*****************************************************
  /// Get current Prices
  ///*****************************************************
  getcurrentPrices(BuildContext context) async {
    try {
      Response response = await _dio.get(
          "${StaticValues.baseUrl}${StaticValues.currentPricesPath}",  //ENDPONT URL
          queryParameters: {
            "secret":StaticValues.secret
          },  //QUERY PARAMETERS
          options: Options(
            // method: "POST"
          )
      );
      // print(response.statusCode);
      print("==========> Current Prices <===========");
      print(response);
      print("==========> Current Prices <===========");


      if(response.statusCode==200){
        return response;
      }else{
        return response.data;
      }

    } on DioError catch (e) {

      Fluttertoast.showToast(msg: "Error: $e");
      return e;
    }
  }

  ///*****************************************************
  /// Get Full stage data
  ///*****************************************************
  getFullStageData() async {
    try {
      Response response = await _dio.get(
          "${StaticValues.baseUrl}${StaticValues.icoStageDataFullPath}",  //ENDPONT URL
          queryParameters: {
            "secret":StaticValues.secret
          },  //QUERY PARAMETERS
          options: Options(
            // method: "POST"
          )
      );

      if(response.statusCode==200){
        return response;
      }else{
        return response;
      }

    } on DioError catch (e) {
      Fluttertoast.showToast(msg: "Error: $e");
      return e;
    }
  }


  postKycData(
      UserKycModel user,BuildContext context
      )async{

    var headers = {
      'Authorization': 'Bearer ${Provider.of<AccessTokenProvider>(context,listen:false).accessTokenInstance!.accessToken}',
      'Cookie': 'gigx_session=eyJpdiI6IkVtU3kwWjlGaW1jZlgyVndac084T1E9PSIsInZhbHVlIjoib1FEY1ZwKzU2SE1kM1VqcXR4eU9oczdneWNBVkgyR0FhK09OZjNNWEhDRndUVEx6aU94WXZWVmNpaGszZm1LWEN2bVVJVWtBVDRDNCt0Z2o1RFZVdEtqRHYwOFY2d2dFRjBIV05sVXpkaGhLN0xMSlFwRDRteW96YXBnRnUrTDMiLCJtYWMiOiI1ZTc3ZTczNWEwODBjYzgyMjhjMDRmOTQxZTBlOGEwMGY1OWYzYzRmZWRlNmI5ODg2OTQyYjM4MzU2MDI3N2ZiIiwidGFnIjoiIn0%3D',
      "Accept":"application/json"
    };

    var request = Http.MultipartRequest('POST', Uri.parse(StaticValues.baseUrl+StaticValues.postKycPath));
    request.fields.addAll({
      'secret': 'ZE7EDFlxRz8RJIGKbhbY7qrG',
      'first_name': user.first_name,
      'last_name': user.last_name,
      'email': user.email,
      'password': user.password,
      'phone': user.phone,
      'dob': user.dob,
      'gender': user.gender,
      'telegram': user.telegram,
      'country': user.country,
      'state': user.state,
      'city': user.city,
      'zip': user.zip,
      'address_1': user.address_1,
      'address_2': user.address_2,
      'wallet_address': user.wallet_address,
      'wallet_name': user.wallet_name,
      'documentType': user.documentType
    });
    request.files.add(await Http.MultipartFile.fromPath('document_one', user.document_one));
    request.files.add(await Http.MultipartFile.fromPath('document_image_hand', user.document_image_hand));
    request.files.add(await Http.MultipartFile.fromPath('document_two', user.document_two));
    request.headers.addAll(headers);



    Http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var message = body['message'];
      // Fluttertoast.showToast(msg: message);
      Provider.of<AccessTokenProvider>(context,listen: false).stopLoading();
      Navigator.pushAndRemoveUntil(context, (MaterialPageRoute(builder: (context)=>BottomNavBar())), (route) => false);
      //toast

    }
    else {
      Fluttertoast.showToast(msg: "${response.reasonPhrase}");
    }
  }


}