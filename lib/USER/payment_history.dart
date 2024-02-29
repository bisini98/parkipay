import 'package:flutter/material.dart';
import 'package:parkipay/constant/colors.dart';

import '../constant/refactoring.dart';

class PaymentHistory extends StatelessWidget {
   PaymentHistory({super.key});

  List<String>text=[
    "Payment Success",
    "Payment Failed",
    "Payment Success"
  ];

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
            quarterContainer(height/1, width, "Payment History"),
            //SizedBox(height: height/20,),
            SizedBox(
              height: height/1.2,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  physics: ScrollPhysics(),
                  itemCount: text.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: paymentHistory(height, width,text[index],index==1?Colors.red:Colors.green),
                  );
                },),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: fillbtn(width/1.22, height/15, AppColors.btnColor, "View All", Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
