import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Admin_Page.dart';
import 'package:parkipay/constant/AuthScreen.dart';
import 'package:parkipay/constant/LoginForm.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:provider/provider.dart';

import '../Provider/LoginProvider.dart';
import '../Provider/MainProvider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late BuildContext _context;
  @override
  void initState() {
    super.initState();
    print("codeeee");
    Timer(const Duration(seconds: 3), () {
      final FirebaseAuth auth = FirebaseAuth.instance;
      // MainProvider mainProvider = Provider.of<MainProvider>(_context, listen: false);

      var loginUser = auth.currentUser;
      if (loginUser == null) {
        print("ghmmmmmj" + loginUser.toString());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AuthScreen(from: "",)),
        );
      } else {
        print("user existtttttt" + loginUser.toString());
        LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
        loginProvider.userAuthorized(loginUser.phoneNumber, context);
      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("PARKIPAY",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}
