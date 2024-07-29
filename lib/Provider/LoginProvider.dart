import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parkipay/Admin/Admin_Page.dart';
import 'package:parkipay/STAFF/userStatus.dart';
import 'package:parkipay/USER/home_screen.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/CustomSnackBarContent.dart';
import 'package:provider/provider.dart';


import '../constant/otp_page.dart';
import 'MainProvider.dart';

class LoginProvider extends ChangeNotifier {


  TextEditingController Loginphnnumber=TextEditingController();
  TextEditingController otpverifycontroller = TextEditingController();

  String VerificationId = "";
  TextEditingController otp_verbify = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;



  void sendotp(BuildContext context) async {
    print("vknfknvmfb");

    await auth.verifyPhoneNumber(
      phoneNumber: "+91${Loginphnnumber.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("sxsxxsaaaa");
        await auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          backgroundColor: Colors.red,
          content: CustomSnackBarContent(colorcontainer: Colors.teal, errorText: "Verification Completed", errorHeadline: "Well done!", colorbubble: AppColors.lightgreensnackbar, img: "assets/check.svg"),
          // Text(
          //     "Verification Completed",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w800,)),
          duration:
          Duration(minutes: 15),
        ));
        if (kDebugMode) {}
      },
      verificationFailed: (FirebaseAuthException e) {
        print("klxmslxms");
        if (e.code == "invalid-phone-number") {
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:CustomSnackBarContent(colorcontainer: Colors.orange, errorText: "Sorry, Verification Failed", errorHeadline: "Warning!", colorbubble: AppColors.orangesnackbar, img: "assets/exclamation.svg"),
            // Text("Sorry, Verification Failed"),

            behavior: SnackBarBehavior.floating,
            duration: Duration(milliseconds: 3000),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ));
          if (kDebugMode) {

          }

        }
      },

      codeSent: (String verificationId, int? resendToken) {
        print("mxxosxhsj");
        VerificationId = verificationId;

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Otpscreen(),
            ));
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: CustomSnackBarContent(colorcontainer: Colors.green,errorHeadline: "Well done!",errorText: "OTP sent to phone successfully",colorbubble: AppColors.greensnackbar,img: "assets/check.svg",),
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 3000),
          backgroundColor: Colors.transparent,
          elevation: 0,

        ));
        Loginphnnumber.clear();
        log("Verification Id : $verificationId");

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }
  void verify(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: otpverifycontroller.text);
    await auth.signInWithCredential(credential).then((value) {
      final user = value.user;
      if (user != null) {
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Bottombar() ,));
        userAuthorized(user.phoneNumber, context);
      } else {
        if (kDebugMode) {
        }
      }
    });
  }
  String fieldName='';
  Future<void> userAuthorized(String? phoneNumber, BuildContext context) async {
    String loginUsername='';
    String loginUsertype='';
    String loginUserid='';
    String productid='';
    String userId='';
    String loginphno="";
    String loginPhoto="";


    MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);

    try {
      var phone = phoneNumber!;
      print(phoneNumber.toString()+"duudud");
      db.collection("USERS").where("PHONE_NUMBER",isEqualTo:phone).get().then((value) {
        if(value.docs.isNotEmpty){
          print("fiifuif");
          for(var element in value.docs) {
            print(element.id+' JNRJRF');
            Map<dynamic, dynamic> map = element.data();
            loginUsername = map['USER_NAME'].toString();
            loginUsertype = map['TYPE'].toString();
            loginphno=map["PHONE_NUMBER"].toString();
            loginUserid = element.id;
            userId = map["USER_ID"].toString();
            String uid = userId;
            print("vjhbfehvb"+loginUsertype);
            if (loginUsertype == "ADMIN") {
              print("cb bcb");
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminPage(),));
            }else if(loginUsertype=='STAFF'){
               mainProvider.getUserTicketSlots();
               mainProvider.tabInitialIndex=0;
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => UserStatus(),));
            }
            else {
              print("efvhjbfjv"+userId);
              print("mxnxn");

              db.collection("REGISTRATION").doc(element.id).get().then((valueee){
                print("dfdfdf");
                if(valueee.exists){
                  print("cxcjjjc"+valueee.id);
                  Map<dynamic, dynamic> customerMap = valueee.data() as Map;

                  if(customerMap['STATUS']=='APPROVED') {
                    String storeFieald='';
                    loginPhoto = customerMap["SIGNUP_PHOTO"].toString();

                    if(customerMap['FIELD_NAME']!=null && customerMap['FIELD_NAME']!='null' ){
                      storeFieald =   customerMap['STORE_ID'].toString()+customerMap['FIELD_NAME'].toString();
                    }


                    print("fefvb" + fieldName);

                    mainProvider.getCategory();
                    mainProvider.getVehicle();
                    // mainProvider.getUsersticketslot();
                    print("njjjjjjj"+loginUsername);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen(
                          photo: loginPhoto,
                          profileName: loginUsername,
                          profilePhone: loginphno,
                          userId: userId, storeWithFieald: storeFieald,

                        ),));
                  }else{
                        print("vghbnhmbn")  ;                }    }
              });
              
              

            }
          }

        }
        else {
          final snackBar =  SnackBar(
              backgroundColor: Colors.white,
              duration: Duration(milliseconds: 3000),
              content: CustomSnackBarContent(colorcontainer: Colors.red, errorText: "Sorry , You don't have any access", errorHeadline: "Oh snap!", colorbubble: AppColors.redsnackbar, img: "assets/close.svg")
              //  Text("Sorry , You don't have any access",
              //   textAlign: TextAlign.center,
              //   softWrap: true,
              //   style: TextStyle(
              //       fontSize: 18,
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold),
              // )
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

      });


    } catch (e) {


    }
  }

}