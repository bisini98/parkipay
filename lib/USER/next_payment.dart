import 'package:flutter/material.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:provider/provider.dart';

import '../constant/refactoring.dart';



class NextPaymentPage extends StatelessWidget {
  final double totalAmount; // Declare a field to hold the total amount

  const NextPaymentPage({Key? key, required this.totalAmount}) : super(key: key); // Update constructor

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.btn1Color, // Replace with your preferred background color
      body: Column(
        children: [
          quarterContainer(height / 1, width, "Payment"),
          SizedBox(height: height / 13),
          Padding(
            padding: EdgeInsets.only(left: defaultPadding),
            child: Row(
              children: [
                Text(
                  "To Pay: ",
                  style: TextStyle(color: AppColors.bgColor),
                ),
                Text(
                  "₹${totalAmount.toStringAsFixed(2)}", // Display totalAmount formatted as currency
                  style: TextStyle(
                    color: AppColors.bgColor,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: height / 12),
          Divider(
            color: AppColors.dividerColor,
            indent: 5,
            endIndent: 5,
            thickness: 1,
          ),
          ListTile(
            leading: Image.asset("assets/upi 1.png", scale: 4),
            title: Text("UPI", style: TextStyle(color: AppColors.bgColor)),
            trailing: Icon(Icons.arrow_forward_ios_outlined, color: AppColors.bgColor, size: 15),
          ),
          Divider(
            color: AppColors.dividerColor,
            indent: 5,
            endIndent: 5,
            thickness: 1,
          ),
          ListTile(
            leading: Image.asset("assets/debit or credit.png"),
            title: Text("Debit/Credit Card", style: TextStyle(color: AppColors.bgColor)),
            trailing: Icon(Icons.arrow_forward_ios_outlined, color: AppColors.bgColor, size: 15),
          ),
          Divider(
            color: AppColors.dividerColor,
            indent: 5,
            endIndent: 5,
            thickness: 1,
          ),
          ListTile(
            leading: Image.asset("assets/netbanking.png"),
            title: Text("Net banking", style: TextStyle(color: AppColors.bgColor)),
            trailing: Icon(Icons.arrow_forward_ios_outlined, color: AppColors.bgColor, size: 15),
          ),
          Divider(
            color: AppColors.dividerColor,
            indent: 5,
            endIndent: 5,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 150),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "By processing, I express my consent to complete this transaction ",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          SizedBox(height: height / 50),
              Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap: () {
                        value.razorpayGateway('$totalAmount');
                      },
                      child: Container(
                            width: width / 1.22,
                            height: height / 15,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Pay  ₹${totalAmount.toStringAsFixed(2)}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                    );
                  }
                )
        ],
      ),
    );
  }
}

