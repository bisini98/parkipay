import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Add_AdminEditPage.dart';
import 'package:parkipay/Admin/Admin_Page.dart';
import 'package:parkipay/constant/colors.dart';
import 'package:parkipay/constant/refactoring.dart';

class AddMapPage extends StatelessWidget {
  const AddMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Rows",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
              numbertxtfrm(height, width/5.5, "4"),
              fillbtn(width/3, height/12, AppColors.btnColor, "Save", Colors.white)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Fields",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
              Adminnumfieldtxtfrm(height, width/5.5, "4"),
              fillbtn(width/3, height/12, AppColors.btnColor, "Save", Colors.white)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Columns",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
              numbertxtfrm(height, width/5.5, "5"),
              fillbtn(width/3, height/12, AppColors.btnColor, "Save", Colors.white)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Fields",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
              Adminnumfieldtxtfrm(height, width/5.5, "4"),
              fillbtn(width/3, height/12, AppColors.btnColor, "Save", Colors.white)
            ],
          ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminEditPage(),));
          },
            child: fillbtn(width/3, height/15, AppColors.AdminbtnColor, "Done", Colors.white))
        ],
      ),
    );
  }
}
