import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parkipay/STAFF/tabbarPage/tab1.dart';
import 'package:parkipay/STAFF/tabbarPage/tab2.dart';
import 'package:parkipay/constant/AppConstants.dart';

import '../constant/refactoring.dart';

class UserStatus extends StatefulWidget {
  const UserStatus({super.key});

  @override
  _UserStatusState createState() => _UserStatusState();
}

class _UserStatusState extends State<UserStatus>
  with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState(){
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      // appBar: AppBar(
      //   toolbarHeight: height/4,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       bottomLeft: Radius.circular(12),
      //       bottomRight: Radius.circular(12),
      //     ),
      //   ),
      //   backgroundColor: AppColors.bgColor,
      //
      // ),
      body: SingleChildScrollView(

        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.bgColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 80,left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hi,Staff",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20),),
                    Icon(Icons.logout_outlined,color: AppColors.btnColor,)
                  ],
                ),
              ),
              SizedBox(height:height/8,),
              Container(
                    width: width/1.5,
                    decoration: BoxDecoration(
                        color: AppColors.AdminContColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(10),
                          child: TabBar(
                            unselectedLabelColor: Colors.white,
                            labelColor: Colors.white,
                            indicatorColor: Colors.red,
                            indicatorWeight: 2,
                            dividerColor:AppColors.AdminContColor,

                            indicator: BoxDecoration(
                                color: AppColors.bgColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            indicatorPadding: EdgeInsets.symmetric(horizontal: -20), // Negative value to increase width

                            controller: tabController,
                            tabs: [
                              Tab(text: "In Process",),
                              Tab(text: "Completed",),
                            ],),
                        )
                      ],
                    ),
                  ),
              SizedBox(height: 20,),
              Expanded(
                  child: TabBarView(
                    controller: tabController,
                      children: [
                        Tab1(),
                        Tab2(),
                      ]
                  )
              )
            ],
          ),
        ),



    ),
    );
  }

}
