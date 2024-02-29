import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Admin_Home.dart';
import 'package:parkipay/Admin/Admin_Page.dart';
import 'package:parkipay/constant/colors.dart';
import 'package:parkipay/constant/refactoring.dart';

class AddHomeScreen extends StatelessWidget {
  const AddHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //SizedBox(height: height/5,),
          Center(child: addImgcontainer(height,width)),
          //SizedBox(height: height/10,),
          fillbtn(width/1.22, height/15, AppColors.btnColor, "Type Name", Colors.white),
          //SizedBox(height: height/10,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome(),));
            },
              child: fillbtn(width/3, height/15, AppColors.AdminbtnColor, "Save", Colors.white))
        ],
      ),
    );
  }
}
