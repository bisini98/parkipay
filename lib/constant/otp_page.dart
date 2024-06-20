import 'package:flutter/material.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/refactoring.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../Provider/LoginProvider.dart';

class Otpscreen extends StatelessWidget {
  const Otpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height/8,),
            Container(margin: EdgeInsets.all(20),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Back",style: TextStyle(color: Colors.white,fontSize: 30),),
                  SizedBox(height: 5,),
                  Text("We sent a 6-digit code to your number : ",style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
            SizedBox(height: height/15,),
            Consumer<LoginProvider>(
                builder: (context,vale,child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child:Pinput(
                      controller:vale.otpverifycontroller,
                      length: 6,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      defaultPinTheme: PinTheme(
                          textStyle:
                          TextStyle(fontWeight: FontWeight.bold),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration( boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 2.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                            ),
                          ], borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 1,
                                  color:Colors.blue.withOpacity(0.9)))),
        
                         onCompleted: (pin){
                        vale.verify(context);
        
                      },
        
                    ),
                  );
                }
            ),
            SizedBox(height: height/6,),
            fillbtn(width/1.22, height/15, AppColors.btnColor, "Verify",Colors.black),
          ],
        ),
      ),
    );
  }
}
