import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/constant/CustomSnackBarContent.dart';
import 'package:parkipay/constant/LoginForm.dart';
import 'package:parkipay/constant/SignupForm.dart';
import 'package:parkipay/constant/refactoring.dart';
import 'package:provider/provider.dart';

import '../Provider/LoginProvider.dart';
import 'AppConstants.dart';

class AuthScreen extends StatefulWidget {
  String from;

  AuthScreen({super.key,required this.from});

  @override
  State<AuthScreen> createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {

  bool _isShowSignUp = false;
  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  void setUpAnimation(){
    _animationController = AnimationController(vsync: this,duration: defaultDuration);
    _animationTextRotate = Tween<double>(begin: 0,end: 90).animate(_animationController);
  }

  void updateView(){
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp ? _animationController.forward() : _animationController.reverse();
  }
  @override
  void initState(){
    setUpAnimation();
        super.initState();
  }
  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Stack(
            children: [
              //Login.....
              AnimatedPositioned(
                duration: defaultDuration,
                width: _size.width * 0.88,
                height: _size.height,
                 left:  _isShowSignUp ? - _size.width * 0.76 : 0,
                child: Container(
                  color: AppColors.bgColor,
                  child: LoginForm(formKey: loginFormKey,),
                ),
              ),

              // Signup....
              AnimatedPositioned(
                duration: defaultDuration,
                  height: _size.height,
                  width: _size.width * 0.88,
                  left: _isShowSignUp ? _size.width * 0.12 : _size.width * 0.88,

                  child: Container(
                    color: AppColors.btnColor,
                    child: SignUpForm(formKey: signUpFormKey,),
                  )
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                  top: _size.height * 0.1,
                  left: 0,
                  right: _isShowSignUp ? - _size.width * 0.06 : _size.width * 0.06,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white60,
                    child: AnimatedSwitcher(
                      duration: defaultDuration,
                      child: _isShowSignUp ?SvgPicture.asset("assets/animationcar.svg",
                        color: AppColors.btnColor,
                      ): SvgPicture.asset("assets/animationcar.svg",
                        color: AppColors.bgColor,
                      ),
                    ),
                  )
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                width: _size.width,
                bottom: _size.height * 0.1,
                right: _isShowSignUp ? - _size.width * 0.06 : _size.width * 0.06,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialIcons("assets/facebook.png",),
                    socialIcons("assets/linkedin.png",),
                    socialIcons("assets/twitter.png"),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                bottom: _isShowSignUp ? _size.height / 2 - 80 :  _size.height * 0.3,
                  left:_isShowSignUp ? 0 : _size.width * 0.44 - 80,
                  child: AnimatedDefaultTextStyle(
                    duration: defaultDuration,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                          fontSize: _isShowSignUp ? 20 : 32,fontWeight: FontWeight.bold,color: _isShowSignUp?AppColors.btnColor:Colors.white70
                      ),
                    child: Transform.rotate(
                      angle: -_animationTextRotate.value * pi / 180,
                      alignment: Alignment.topLeft,
                      child: Consumer<LoginProvider>(
                        builder: (context,value,child) {
                          return InkWell(
                            onTap: () {
                              value.sendotp(context);
                              value.otpverifycontroller.clear();
                              if(_isShowSignUp){
                                updateView();
                              }else{
                                //Login
                              }
                              // if (loginFormKey.currentState != null && loginFormKey.currentState!.validate()) {
                              //   // Proceed with login logic
                              //   value.sendotp(context);
                              //   value.otpverifycontroller.clear();
                              //   if (_isShowSignUp) {
                              //     updateView();
                              //   } else {
                              //   }
                              // } else {
                              //
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text(
                              //         "Please fill in the required fields",
                              //         style: TextStyle(color: Colors.red, fontSize: 20),
                              //       ),
                              //       duration: Duration(seconds: 2),
                              //     ),
                              //   );
                              // }

                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                              width: 160,
                              // color: AppColors.spotColor,
                              child: Text(
                                "Log in".toUpperCase(),
                                ),
                            ),
                          );
                        }
                      ),
                    ),
                  )
              ),
              //Signup Text .....
              AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: !_isShowSignUp ? _size.height / 2 - 80 :  _size.height * 0.3,
                  right:_isShowSignUp ?  _size.width * 0.44 - 80 : 0,
                  child: AnimatedDefaultTextStyle(
                    duration: defaultDuration,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: !_isShowSignUp ? 20 : 32,fontWeight: FontWeight.bold,color: _isShowSignUp? Colors.white70 : AppColors.bgColor
                    ),
                    child: Transform.rotate(
                      angle: (90 - _animationTextRotate.value) * pi / 180,
                      alignment: Alignment.topRight,
                      child: Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return InkWell(
                            onTap: () {
                              if (_isShowSignUp) {
                                if (signUpFormKey.currentState != null && signUpFormKey.currentState!.validate()) {
                                  if (value.SignUpFileImg == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Please select an image",
                                          style: TextStyle(color: Colors.red, fontSize: 20),
                                        ),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                    return;
                                  }if(value.SignUpImg!= null){
                                  value.AddRegistration("NEW","",context,'');
                                  value.SignUpclear();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: CustomSnackBarContent(colorcontainer: Colors.green, errorText: "Sign Up Successful", errorHeadline: "Welcome!", colorbubble: AppColors.greensnackbar, img: "assets/check.svg"),
                                      // Text(
                                      //   "Sign Up Successful",
                                      //   style: TextStyle(color: Colors.green, fontSize: 20),
                                      // ),
                                      behavior: SnackBarBehavior.floating,
                                      duration: Duration(seconds: 2),
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                    ),
                                  );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Image upload failed",
                                          style: TextStyle(color: Colors.red, fontSize: 20),
                                        ),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                }else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Please fill in the required fields",
                                        style: TextStyle(color: Colors.red, fontSize: 20),
                                      ),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              } else {
                                updateView();
                              }
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthScreen(),));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                              width: 160,
                              // color: AppColors.spotColor,
                              child: Text(
                                "Sign up".toUpperCase(),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  )
              ),
            ],
          );
        }
      ),
    );
  }
}
