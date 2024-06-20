import 'package:flutter/material.dart';
import 'package:parkipay/constant/AppConstants.dart';

import '../constant/refactoring.dart';

class NextPaymentPage extends StatelessWidget {
  const NextPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: Column(
        children: [
          quarterContainer(height/1, width, "Payment"),
          SizedBox(height: height/13,),
          Row(
            children: [
              Text("To Pay: ",style: TextStyle(color: AppColors.bgColor),),
              Text("₹16.00",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.w600),)
            ],
          ),
          SizedBox(height: height/12,),
          Divider(
           color: AppColors.dividerColor,
            indent: 5,
            endIndent: 5,
            thickness: 1,
          ),
          ListTile(
            leading: Image.asset("assets/upi 1.png",scale: 4,),
            title: Text("UPI",style: TextStyle(color: AppColors.bgColor),),
            trailing: Icon(Icons.arrow_forward_ios_outlined,color: AppColors.bgColor,size: 15,),
          ),
          Divider(
            color: AppColors.dividerColor,
            indent: 5,
            endIndent: 5,
            thickness: 1,
          ),
          ListTile(
            leading: Image.asset("assets/debit or credit.png",),
            title: Text("Debit/Credit Card",style: TextStyle(color: AppColors.bgColor),),
            trailing: Icon(Icons.arrow_forward_ios_outlined,color: AppColors.bgColor,size: 15,),
          ),
          Divider(
            color: AppColors.dividerColor,
            indent: 5,
            endIndent: 5,
            thickness: 1,
          ),
          ListTile(
            leading: Image.asset("assets/netbanking.png",),
            title: Text("Net banking",style: TextStyle(color: AppColors.bgColor),),
            trailing: Icon(Icons.arrow_forward_ios_outlined,color: AppColors.bgColor,size: 15,),
          ),
          Divider(
            color: AppColors.dividerColor,
            indent: 5,
            endIndent: 5,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left:15,top: 150),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("By processing, I express my consent to complete this transaction ",style: TextStyle(fontSize: 10),),
              ],
            ),
          ),
          SizedBox(height: height/50,),
          fillbtn(width/1.22, height/15, AppColors.btnColor, "Pay   ₹16.00", Colors.white)
        ],
      ),
    );
  }
}
