import 'package:flutter/material.dart';
import 'package:parkipay/USER/next_payment.dart';

import '../constant/AppConstants.dart';
import '../constant/refactoring.dart';

class PaymentSlip extends StatelessWidget {
  const PaymentSlip({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            quarterContainer(height/1, width, "Payment"),
            SizedBox(height: height/13,),
            paymentslip(height, width),
            SizedBox(height: height/20,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Price Details",style: TextStyle(color: AppColors.bgColor,fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hourly charge"),
                      SizedBox(height: 5,),
                      Text("Total Hours "),
                      SizedBox(height: height/30,),
                      Text("Total Amount",style: TextStyle(color: AppColors.bgColor,fontSize: 20))
                    ],
                  ),
                  Column(
                    children: [
                      Text("₹8.00"),
                      SizedBox(height: 5,),
                      Text("2"),
                      SizedBox(height: height/30,),
                      Text("₹16.00",style: TextStyle(color: AppColors.bgColor,fontSize: 20))
                    ],
                  )
                ],
              ),
            ),
        SizedBox(height: height/10,),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NextPaymentPage(),));
          },
            child: Center(child: fillbtn(width/1.22, height/15, AppColors.btnColor, "Continue to Pay",Colors.white))),
          ],
        ),
      ),
    );
  }
}
