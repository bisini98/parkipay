import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/refactoring.dart';

class PaymentFailedPage extends StatelessWidget {
  const PaymentFailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: Center(
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap:(){
                      Navigator.pop(context);
                    },
                      child: Icon(Icons.arrow_back_ios_sharp,color: AppColors.btnColor,)),
                ],
              ),
            ),
            SizedBox(height: height/5,),
            Center(child: Image.asset("assets/paymentfailed.png",scale: 2,)),
            SizedBox(height: height/4,),
            fillbtn(width/1.22, height/15, AppColors.btnColor, "Retry", Colors.white)

          ],
        ),
      ),
    );
  }
}
