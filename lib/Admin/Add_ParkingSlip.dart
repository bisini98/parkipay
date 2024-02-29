import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Admin_Page.dart';
import 'package:parkipay/Admin/Admin_ParkingSlip.dart';
import 'package:parkipay/constant/colors.dart';
import 'package:parkipay/constant/refactoring.dart';

class AddParkingSlip extends StatelessWidget {
  const AddParkingSlip({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //SizedBox(height: height/30,),
          Center(child: adminparkingslip(height, width)),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage(),));
            },
              child: fillbtn(width/3, height/15, AppColors.AdminbtnColor, "Save", Colors.white))

        ],
      ),
    );
  }
}
