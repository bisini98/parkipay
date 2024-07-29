import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/STAFF/tabbarPage/Staff_Inprocess.dart';
import 'package:parkipay/STAFF/tabbarPage/Staff_Completed.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:provider/provider.dart';

import '../constant/AuthScreen.dart';


class UserStatus extends StatefulWidget {
  const UserStatus({super.key});

  @override
  _UserStatusState createState() => _UserStatusState();
}

class _UserStatusState extends State<UserStatus> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    final mainProvider = Provider.of<MainProvider>(context, listen: false);

    tabController = TabController(
        initialIndex: mainProvider.tabInitialIndex,
        vsync: this,
        length: 2
    );
    tabController.addListener(handleTabSelection);

    // Fetch the current staff information when the widget is initialized
    mainProvider.fetchCurrentStaff();
  }

  void handleTabSelection() {
    if (tabController.indexIsChanging) {
      final mainProvider = Provider.of<MainProvider>(context, listen: false);
      mainProvider.tabInitialIndex = tabController.index;
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        showExitPopup(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.btn1Color,
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<MainProvider>(
                          builder: (context, value, child) {
                            return Text(
                              "Hi, ${value.currentStaff?.name ?? 'Staff'}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20
                              ),
                            );
                          }
                      ),
                      InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: AppColors.btnColor,
                                elevation: 20,
                                content: Text(
                                    "Do you want to Logout ?",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'ink nut',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white
                                    )
                                ),
                                actions: <Widget>[
                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          FirebaseAuth auth = FirebaseAuth.instance;
                                          auth.signOut();
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => AuthScreen(from: "",)),
                                          );
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0x26000000),
                                                  blurRadius: 2.0,
                                                  spreadRadius: 1.0,
                                                ),
                                              ]
                                          ),
                                          child: Center(
                                            child: Text(
                                                "Yes",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w700
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                              height: 45,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: AppColors.bgColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x26000000),
                                                    blurRadius: 2.0,
                                                    spreadRadius: 1.0,
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                    "No",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.w700
                                                    )
                                                ),
                                              )
                                          )
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          child: Icon(Icons.logout_outlined, color: AppColors.btnColor,)
                      )
                    ],
                  ),
                ),
                SizedBox(height: height / 8,),
                Container(
                  width: width / 1.5,
                  decoration: BoxDecoration(
                      color: AppColors.AdminContColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TabBar(

                          unselectedLabelColor: Colors.white,
                          labelColor: Colors.white,
                          indicatorColor: Colors.red,
                          indicatorWeight: 2,
                          dividerColor: AppColors.AdminContColor,
                          indicator: BoxDecoration(
                              color: AppColors.bgColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          indicatorPadding: EdgeInsets.symmetric(horizontal: -20),
                          controller: tabController,
                          tabs: [
                            Tab(text: "In Process",),
                            Tab(text: "Completed",),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                    child: TabBarView(
                        controller: tabController,
                        children: [
                          StaffInprocess(),
                          StaffCompleted(),
                        ]
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> showExitPopup(BuildContext CONTXT) async {

    return await showDialog(
        context: CONTXT,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: SizedBox(
              height: 95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Do you want to EXIT ?",style: TextStyle(
                      fontSize:17,

                      fontFamily:'ink nut',
                      fontWeight: FontWeight.w700,
                      color: AppColors.bgColor)),
                  const SizedBox(height: 19),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              exit(0);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.bgColor),
                            child: Center(child:  Text("yes",style: TextStyle( color: Colors.white,fontSize: 17,fontWeight: FontWeight.w700)))
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ), child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),

                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

}
