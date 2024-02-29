import 'package:flutter/material.dart';
import 'package:parkipay/constant/colors.dart';

import '../constant/refactoring.dart';
import 'Add_ParkingSlip.dart';

class AdminParkingSlip extends StatelessWidget {
  const AdminParkingSlip({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.bgColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddParkingSlip(),));
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            quarterContainerWithIcon(height, width, "Parking Slip"),
            //SizedBox(height: height/50,),
            SizedBox(
              height: height/1.22,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                physics: ScrollPhysics(),
                itemCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {

                  return parkingslip(height,width);
                },
              ),
            ),
            SizedBox(height: 20,),
            fillbtn(width/1.22, height/15, AppColors.btnColor, "View All", Colors.white)
          ],
        ),
      ),
    );
  }
}
