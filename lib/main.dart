import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Add_HomeScreen.dart';
import 'package:parkipay/Admin/Add_ParkingSlip.dart';
import 'package:parkipay/Admin/Admin_VehiclePage.dart';
import 'package:parkipay/Admin/Admin_CustomerList.dart';
import 'package:parkipay/Admin/Admin_Home.dart';
import 'package:parkipay/Admin/Admin_Page.dart';
import 'package:parkipay/Admin/Admin_ParkingSlip.dart';
import 'package:parkipay/Admin/Admin_Payments.dart';
import 'package:parkipay/Admin/Admin_map.dart';
import 'package:parkipay/Admin/login_requests.dart';
import 'package:parkipay/Provider/LoginProvider.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/STAFF/userStatus.dart';
import 'package:parkipay/USER/bottom_navigation.dart';
import 'package:parkipay/USER/Vehicle_page.dart';
import 'package:parkipay/USER/continue_page.dart';
import 'package:parkipay/USER/home_screen.dart';
import 'package:parkipay/USER/map.dart';
import 'package:parkipay/USER/parking_slip.dart';
import 'package:parkipay/USER/payment_failed.dart';
import 'package:parkipay/USER/payment_success.dart';
import 'package:parkipay/USER/payments.dart';
import 'package:parkipay/USER/ticket_page.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/AuthScreen.dart';
import 'package:parkipay/constant/SignupForm.dart';
import 'package:parkipay/constant/SplashScreen.dart';
import 'package:parkipay/constant/otp_page.dart';
import 'package:provider/provider.dart';

import 'constant/LoginForm.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => MainProvider(),),
      ChangeNotifierProvider(create: (context) => LoginProvider(),)
    ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
      
          primarySwatch: Colors.blue,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white38,
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.symmetric(
              vertical: defaultPadding * 1.2,horizontal: defaultPadding
            )
          )
        ),
        home:AuthScreen(),
      ),
    );
  }
}

