import 'package:flutter/material.dart';
import 'package:parkipay/USER/map.dart';
import 'package:parkipay/constant/colors.dart';

import '../constant/refactoring.dart';

class ParkingSlip extends StatelessWidget {
  const ParkingSlip({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: Column(
        children: [
          quarterContainer(height/1, width, "Parking Slip"),
          SizedBox(height: height/13,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Happy Parking !",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.w600),),
              SizedBox(height: 10,),
              Text("Please make sure you park on the right spot",style: TextStyle(color: AppColors.bgColor),),
            ],
          ),
          SizedBox(height: height/15,),
          parkingslip(height,width),
          SizedBox(height: height/20,),
          Text("Check SMS/Whatsapp to view parking slip",style: TextStyle(color: AppColors.bgColor),),
      SizedBox(height: height/30,),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage(),));
        },
          child: fillbtn(width/1.22, height/15, AppColors.btnColor, "View Map",Colors.white)
      )

        ],
      ),
    );
  }
}
