import 'package:flutter/material.dart';
import 'package:parkipay/constant/AppConstants.dart';

import '../constant/refactoring.dart';

class Tickets extends StatelessWidget {
  const Tickets({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            quarterContainer(height/1, width, "Tickets"),
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
