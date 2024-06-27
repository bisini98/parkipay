import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Admin_Page.dart';
import 'package:parkipay/Provider/LoginProvider.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/AuthScreen.dart';

import 'package:provider/provider.dart';

import 'Admin/Admin_map.dart';

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
          ),
        ),
        home:AdminPage(),
      ),
    );
  }
}

