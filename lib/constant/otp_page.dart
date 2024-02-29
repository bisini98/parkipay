import 'package:flutter/material.dart';
import 'package:parkipay/constant/colors.dart';
import 'package:parkipay/constant/refactoring.dart';

class OTP extends StatelessWidget {
  const OTP({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height/8,),
          Container(margin: EdgeInsets.all(20),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back",style: TextStyle(color: Colors.white,fontSize: 30),),
                SizedBox(height: 5,),
                Text("We sent a 4-digit code to your number : ",style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          SizedBox(height: height/15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 17,),
              otpbox(50, 50),
              otpbox(50, 50),
              otpbox(50, 50),
              otpbox(50, 50)
            ],
          ),
          SizedBox(height: height/6,),
          fillbtn(width/1.22, height/15, AppColors.btnColor, "Verify",Colors.black),
        ],
      ),
    );
  }
}
