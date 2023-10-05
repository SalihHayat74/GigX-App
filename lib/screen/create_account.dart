import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gigx_website/API%20Model/Auth%20API%20Model/signup_api_model.dart';
import 'package:gigx_website/API Model/Auth API Model/user_kyc_api_model.dart';
import 'package:gigx_website/API/api_client.dart';
import 'package:gigx_website/constant/reusable_button.dart';
import 'package:gigx_website/constant/reusable_text.dart';
import 'package:gigx_website/screen/login.dart';
import 'package:gigx_website/static constants/static_constants.dart';
import 'package:gigx_website/screen/verify_email.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../provider/access_token_provider.dart';
import 'created_account.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  // String baseUrl = 'https://token.gigxcoin.net/register';
  // TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  // TextEditingController confirmPasswordController= TextEditingController();
  // TextEditingController secret=TextEditingController();
  TextEditingController first_name=TextEditingController();
  TextEditingController last_name=TextEditingController();
  // TextEditingController email=TextEditingController();
  // TextEditingController password=TextEditingController();
  TextEditingController dob=TextEditingController();
  TextEditingController phone=TextEditingController();
  // TextEditingController gender=TextEditingController();
  TextEditingController telegram=TextEditingController();
  // TextEditingController country=TextEditingController();
  TextEditingController state=TextEditingController();
  TextEditingController city=TextEditingController();
  TextEditingController zip=TextEditingController();
  TextEditingController address_1=TextEditingController();
  TextEditingController address_2=TextEditingController();
  TextEditingController wallet_address=TextEditingController();
  TextEditingController wallet_name=TextEditingController();
  // TextEditingController documentType=TextEditingController();
  // TextEditingController document_one=TextEditingController();
  // TextEditingController document_image_hand=TextEditingController();
  // TextEditingController document_two=TextEditingController();
  List<Map<String,String>> data=[];

 String selectedGender='Male';

  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            const Image(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SingleChildScrollView(
                child: Column(children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Create a new\nGig',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30),
                      children: [
                        TextSpan(
                            text: 'X',
                            style: TextStyle(
                                color: Color(0xff03E5D4), fontSize: 30)),
                        TextSpan(
                            text: 'Coin account',
                            style: TextStyle(color: Colors.white, fontSize: 30))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ReusableText(
                    title: 'Joins us Now!',
                    color: Color(0xffB4B4B4),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: first_name,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'First Name',
                            prefixIcon: Icon(
                              Icons.person_outlined,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: last_name,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Last Name',
                            prefixIcon: Icon(
                              Icons.person_outlined,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your email',
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: phone,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Mobile Number',
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: passwordController,
                        obscureText: visibility,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            suffixIcon: visibility
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visibility = !visibility;
                                      });
                                    },
                                    icon: const Icon(Icons.visibility_off))
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visibility = !visibility;
                                      });
                                    },
                                    icon: const Icon(Icons.visibility)),
                            prefixIcon: const Icon(
                              Icons.lock_outlined,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: dob,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Date of Birth',
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(15),
                  //         color: Colors.white),
                  //     child: const TextField(
                  //       keyboardType: TextInputType.number,
                  //       decoration: InputDecoration(
                  //           border: InputBorder.none,
                  //           hintText: 'License Number',
                  //           prefixIcon: Icon(
                  //             Icons.more_horiz_sharp,
                  //             color: Color(0xff03E5D4),
                  //           )),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      padding: const EdgeInsets.only(left: 10,right: 20),
                      width: MediaQuery.of(context).size.width*7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Row(
                        children: [
                          const Icon(Icons.male,color:Color(0xff03E5D4)),
                          Container(
                            padding: const EdgeInsets.only(left: 13),
                            width: MediaQuery.of(context).size.width*.70,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(

                                // menuMaxHeight: Get.height * 0.25,
                                style: const TextStyle(color: Colors.red,fontSize: 15),
                                value: selectedGender,
                                // controller: _bankNameController
                                items: <String>[
                                  'Male',
                                  'Female',
                                  'Other'

                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,style: const TextStyle(color: Colors.black54 ),),
                                  );
                                }).toList(),
                                onChanged: (String? changedValue) {
                                  selectedGender = changedValue!;
                                  setState(() {
                                    selectedGender = changedValue!;
                                  });
                                },

                                // isExpanded: true,
                                // underline: SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: telegram,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Telegram',
                            prefixIcon: Icon(
                              Icons.telegram,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: state,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'State',
                            prefixIcon: Icon(
                              Icons.location_on_rounded,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: city,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'City',
                            prefixIcon: Icon(
                              Icons.location_on_outlined,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: zip,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Zip',
                            prefixIcon: Icon(
                              Icons.markunread_mailbox,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: address_1,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Address 1',
                            prefixIcon: Icon(
                              Icons.location_on_outlined,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: address_2,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Address 2',
                            prefixIcon: Icon(
                              Icons.location_on_outlined,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: wallet_address,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Wallet Address',
                            prefixIcon: Icon(
                              Icons.wallet_giftcard,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        controller: wallet_name,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Wallet Name',
                            prefixIcon: Icon(
                              Icons.abc,
                              color: Color(0xff03E5D4),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Provider.of<AccessTokenProvider>(context).isLoading?
                  const Center(child: CircularProgressIndicator()):
                  InkWell(
                    onTap: () async{

                      if(
                      emailController.text.isEmpty||
                      passwordController.text.isEmpty||
                      first_name.text.isEmpty||
                      last_name.text.isEmpty||
                      dob.text.isEmpty||
                      phone.text.isEmpty||
                      state.text.isEmpty||
                      city.text.isEmpty||
                      zip.text.isEmpty||
                      address_1.text.isEmpty||
                      // address_2.text.isEmpty||
                      wallet_address.text.isEmpty||
                      wallet_name.text.isEmpty
                      ){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("All fields are required")));

                      }else
                      if(passwordController.text.length<10){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password must be at least 10 characters")));
                      }else if(emailController.text.contains('@') && wallet_address.text.length>9){
                        Provider.of<AccessTokenProvider>(context,listen: false).startLoading();
                        String name=first_name.text+last_name.text;

                        ///
                        /// Model for signing up user
                        SignUpAPIModel user=SignUpAPIModel(
                            name: name,
                            email: emailController.text,
                            password: passwordController.text,
                            secret: StaticValues.secret);

                        ///
                        ///
                        /// Model for user KYC data
                        UserKycModel userKyc=UserKycModel(
                            secret: StaticValues.secret,
                            first_name: first_name.text,
                            last_name: last_name.text,
                            email: emailController.text,
                            password: passwordController.text,
                            dob: dob.text,
                            phone: phone.text,
                            gender: selectedGender,
                            telegram: telegram.text,
                            country: '',
                            state: state.text,
                            city: city.text,
                            zip: zip.text,
                            address_1: address_1.text,
                            address_2: address_2.text,
                            wallet_address: wallet_address.text,
                            wallet_name: wallet_name.text,
                            documentType: 'License',
                            document_one: '',
                            document_image_hand: '',
                            document_two: '',
                        );
                        // print(user.toJson());
                        Provider.of<AccessTokenProvider>(context,listen:false).updateUserKyc(userKyc);
                        await ApiClient().registerUser(user.toJson(),context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyEmail()));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter email format incorrect '@' or wallet length is less than 10")));

                      }

                      // signUp(user.toJson());
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const CreatedAccount()));
                    },
                    child: const ReusableButton(
                      title: 'Create account',
                      value: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        'Already a member?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                    ),
                    TextButton(
                      onPressed: (){
                        Provider.of<AccessTokenProvider>(context,listen: false).stopLoading();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const LogIn()));
                      },
                      child: const Text(
                        'Login Here',
                        style: TextStyle(
                          color: Color(0xff03E5D4),
                        ),
                      ),
                    ),
                  ],
                ),


                  // RichText(
                  //     text: const TextSpan(
                  //         text: 'Already a member?',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //         ),
                  //         children: [
                  //       TextSpan(
                  //           text: 'Login',
                  //           style: TextStyle(
                  //             color: Color(0xff03E5D4),
                  //           ))
                  //     ])),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text:
                              'By creating an account you are agreeing to\nGigXCoin\'s ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                                text: 'Terms and conditions',
                                style: TextStyle(
                                  color: Color(0xff03E5D4),
                                ))
                          ])),
                ]),
              ),
            )
          ],
        ));
  }
}
