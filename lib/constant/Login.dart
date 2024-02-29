import 'package:flutter/material.dart';
import 'package:parkipay/constant/Signup.dart';
import 'package:parkipay/constant/colors.dart';
import 'package:parkipay/constant/refactoring.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: height/5,),
              Text("Login",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
              SizedBox(height: height/6,),
              Text("Enter your phone number, We'll send you a \n verification code on the same number",style: TextStyle(color: Colors.white,fontSize: 14),),
              SizedBox(height: height/10),
              button(width/1.22, height/15, AppColors.btn1Color, "Phone", Icons.phone_outlined),
              SizedBox(height: height/15,),
              button1(width/1.22, height/15, AppColors.btnColor,"Get OTP",Icons.arrow_forward_outlined),
              SizedBox(height: height/6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Need an account?",style: TextStyle(color: Colors.white),),
                  SizedBox(width: 2,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                    },
                      child: Text("Sign up",style: TextStyle(color: AppColors.btnColor,fontWeight: FontWeight.w500),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}

