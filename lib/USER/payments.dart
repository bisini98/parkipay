import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/USER/next_payment.dart';
import 'package:provider/provider.dart';

import '../constant/AppConstants.dart';
import '../constant/refactoring.dart';

class PaymentSlip extends StatelessWidget {
  final DateTime? checkinDate;
  final DateTime? checkoutDate;
  String fieldName;

  PaymentSlip({
    super.key,
    required this.checkinDate,
    required this.checkoutDate,
    required this.fieldName,
  });

  @override
  Widget build(BuildContext context) {
    // Check for nullability and handle default values
    if (checkinDate == null || checkoutDate == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Payment Slip'),
        ),
        body: Center(
          child: Text('Checkin or Checkout date is null.'),
        ),
      );
    }

    // Calculate duration in hours
    Duration duration = checkoutDate!.difference(checkinDate!);
    int totalHours = duration.inHours;

    // Calculate total amount
    double hourlyRate = 8.00; // ₹8.00 per hour
    double totalAmount = totalHours * hourlyRate;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  quarterContainer(height / 1, width, "Payment"),
                  Container(
                    height: height / 6,
                    color: AppColors.spotColor,
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.alarm, color: AppColors.bgColor),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${checkinDate != null ? DateFormat('h:mm a').format(checkinDate!) : "Not checked in yet"} - ${checkoutDate != null ? DateFormat('h:mm a').format(checkoutDate!) : "Not checked out yet"}',
                                style: TextStyle(color: AppColors.bgColor),
                              ),
                              SizedBox(height: 5),
                              Text('$totalHours hours', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.bgColor)),
                            ],
                          ),
                          VerticalDivider(
                            color: AppColors.bgColor,
                            indent: 10,
                            endIndent: 10,
                            width: 20,
                            thickness: 1,
                          ),
                          Consumer<MainProvider>(
                            builder: (context, value, child) {
                              return Text(
                                fieldName.toString(),
                                style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.bgColor, fontSize: 30),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height / 20),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("Price Details", style: TextStyle(color: AppColors.bgColor, fontSize: 20)),
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
                            SizedBox(height: 5),
                            Text("Total Hours"),
                            SizedBox(height: height / 30),
                            Text("Total Amount", style: TextStyle(color: AppColors.bgColor, fontSize: 20)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("₹$hourlyRate"),
                            SizedBox(height: 5),
                            Text("$totalHours"),
                            SizedBox(height: height / 30),
                            Text("₹${totalAmount.toStringAsFixed(2)}", style: TextStyle(color: AppColors.bgColor, fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Center(
            child: Container(
              width: width/1.22,
              padding: EdgeInsets.only(bottom: 40),
              child: GestureDetector(
                onTap: () {
                  // Navigate to NextPaymentPage and pass totalAmount
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NextPaymentPage(totalAmount: totalAmount),
                    ),
                  );
                },
                child: Container(
                  width: width / 1.22,
                  height: height / 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.btnColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    "Continue to Pay",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


