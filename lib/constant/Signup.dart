import 'package:flutter/material.dart';
import 'package:parkipay/constant/Login.dart';
import 'package:parkipay/constant/colors.dart';
import 'package:parkipay/constant/refactoring.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
              Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
              SizedBox(height: height/40,),
              Text("Create a new account",style: TextStyle(color: Colors.white),),
              SizedBox(height: height/7,),
              personbutton(width/1.22, height/15, AppColors.btn1Color, "Name", Icons.person_outline_outlined),
              SizedBox(height: height/25,),
              button(width/1.22, height/15, AppColors.btn1Color, "Phone", Icons.phone_outlined),
              SizedBox(height: height/12,),
              fillbtn(width/1.22, height/15, AppColors.btnColor, "Create Account",Colors.black),
              SizedBox(height: height/6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an Account?",style: TextStyle(color: Colors.white),),
                  SizedBox(width: 2,),
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                      },
                      child: Text("Login",style: TextStyle(color: AppColors.btnColor,fontWeight: FontWeight.w500),
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
