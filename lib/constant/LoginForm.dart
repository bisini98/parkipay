import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parkipay/Provider/LoginProvider.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/constant/SignupForm.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/otp_page.dart';
import 'package:parkipay/constant/refactoring.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginForm({super.key,required this.formKey});

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    final _size = MediaQuery.of(context).size;
    // return Scaffold(
    //   backgroundColor: AppColors.btnColor,
    //   // body: Center(
    //   //   child: SingleChildScrollView(
    //   //     physics: ScrollPhysics(),
    //   //     child: Column(
    //   //       children: [
    //   //         SizedBox(
    //   //           height: height / 5,
    //   //         ),
    //   //         Text(
    //   //           "Login",
    //   //           style: TextStyle(
    //   //               color: Colors.white,
    //   //               fontSize: 40,
    //   //               fontWeight: FontWeight.bold),
    //   //         ),
    //   //         SizedBox(
    //   //           height: height / 6,
    //   //         ),
    //   //         Text(
    //   //           "Enter your phone number, We'll send you a \n verification code on the same number",
    //   //           style: TextStyle(color: Colors.white, fontSize: 14),
    //   //         ),
    //   //         SizedBox(height: height / 10),
    //   //         Consumer<LoginProvider>(builder: (context, value, child) {
    //   //           return button(width / 1.22, height / 15, AppColors.btn1Color,
    //   //               "Phone", Icons.phone_outlined, value.Loginphnnumber);
    //   //         }),
    //   //         SizedBox(
    //   //           height: height / 15,
    //   //         ),
    //   //         Consumer<LoginProvider>(
    //   //           builder: (context,value,child) {
    //   //             return  InkWell(
    //   //               onTap: () {
    //   //                 value.sendotp(context);
    //   //                 value.otpverifycontroller.clear();
    //   //               },
    //   //                 child: button1(width / 1.22, height / 15, AppColors.btnColor,
    //   //                     "Get OTP", Icons.arrow_forward_outlined));
    //   //           }
    //   //         ),
    //   //         SizedBox(
    //   //           height: height / 6,
    //   //         ),
    //   //         Row(
    //   //           mainAxisAlignment: MainAxisAlignment.center,
    //   //           children: [
    //   //             Text(
    //   //               "Need an account?",
    //   //               style: TextStyle(color: Colors.white),
    //   //             ),
    //   //             SizedBox(
    //   //               width: 2,
    //   //             ),
    //   //             Consumer<MainProvider>(builder: (context, value, child) {
    //   //               return InkWell(
    //   //                   onTap: () {
    //   //                     value.SignUpclear();
    //   //                     Navigator.push(
    //   //                         context,
    //   //                         MaterialPageRoute(
    //   //                           builder: (context) => SignUp(),
    //   //                         ));
    //   //                   },
    //   //                   child: Text(
    //   //                     "Sign up",
    //   //                     style: TextStyle(
    //   //                         color: AppColors.btnColor,
    //   //                         fontWeight: FontWeight.w500),
    //   //                   ));
    //   //             })
    //   //           ],
    //   //         )
    //   //       ],
    //   //     ),
    //   //   ),
    //   // ),
    //
    // );
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              // Spacer(),
            // Container(
            //   width: wth,
            //   height: ht,
            //   decoration: BoxDecoration(
            //       color: AppColors.btnColor,
            //       borderRadius: BorderRadius.circular(10)
            //   ),
            //   child: Icon(icon),
            //
            // ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: defaultPadding),
               child: Text(
                 "Enter your phone number, We'll send you a verification code on the same number",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
             ),
            Consumer<LoginProvider>(
              builder: (context,value,child) {
                return TextFormField(
                  controller: value.Loginphnnumber,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone"
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    if (!RegExp(r'^\+?\d{10,15}$').hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                );
              }
            ),
            SizedBox(height: _size.height/15,),
            // Container(
            //   height: _size.height/13,
            //   width: _size.width,
            //   decoration: BoxDecoration(
            //     color: AppColors.spotColor,
            //   ),
            //   child: Center(child: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.w800,color: AppColors.bgColor),)),
            // ),
            // Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
