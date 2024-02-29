import 'package:flutter/material.dart';
import 'package:parkipay/constant/colors.dart';

import '../constant/refactoring.dart';

class AdminPaymentList extends StatelessWidget {
  AdminPaymentList({super.key});

  List<String>txt=[
    "Payment Success",
    "Payment Failed",
    "Payment Success",
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
            quarterContainerWithIcon(height, width, "Payments"),
            SizedBox(
              height: height/1.22,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                physics: ScrollPhysics(),
                itemCount: txt.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: paymentListcontainer(height, width,txt[index],index==1?Colors.red:Colors.green),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
