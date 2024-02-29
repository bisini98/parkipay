import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Admin_Page.dart';
import 'package:parkipay/Admin/Admin_VehiclePage.dart';
import 'package:parkipay/constant/colors.dart';

import '../constant/refactoring.dart';

class AddVehiclePage extends StatelessWidget {
  const AddVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Add Vehicles :",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
              ],
            ),
          ),
          Center(child: addImgcontainer(height/1.22,width/1.22)),
          fillbtn(width/2, height/15, AppColors.btnColor, "Type Name", Colors.white),


          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => AdminVehiclePage(),));
            },
              child: fillbtn(width/3, height/15, AppColors.AdminbtnColor, "Save", Colors.white))
        ],
      ),
    );
  }
}
