import 'package:flutter/material.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/USER/map.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/refactoring.dart';
import 'package:provider/provider.dart';

class Continue extends StatelessWidget {
  final String storeId;
  final String userId;
  final String registerphoneNumber;
  String storeWithField;
  String profileName;
  String signupPhoto;
  String categoryId;


  Continue({super.key, required this.storeId, required this.userId, required this.registerphoneNumber, required this.storeWithField,required this.profileName,required this.signupPhoto,required this.categoryId,});

  // Function to simulate ticket download
  void downloadTicket(BuildContext context) {
    // Simulate ticket generation
    // Here, you can generate a PDF or any other format for the ticket

    // Show a dialog to simulate the download
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Ticket Download"),
          content: Text("Your ticket is ready to download."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            quarterContainer(height / 1, width, "Contact Details"),
            SizedBox(height: height / 13),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nearest available spot is ready for you!",
                  style: TextStyle(color: AppColors.bgColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Enter details to receive parking slip",
                  style: TextStyle(color: AppColors.bgColor),
                ),
              ],
            ),
            SizedBox(height: height / 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text("*", style: TextStyle(color: Colors.red)),
                  SizedBox(width: 2),
                  Text("Mobile Number"),
                ],
              ),
            ),
            SizedBox(height: 20),
            numbertxtfrm(height, width, "eg: 99345xxxxx"),
            SizedBox(height: 10),
            Text(
              "Your Number will only be used for sending the parking slip",
              style: TextStyle(fontSize: 10, color: AppColors.bgColor),
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset("assets/whatsapp.png", scale: 4.5),
                  SizedBox(width: 5),
                  Text(
                    "Receive parking slip on Whatsapp?",
                    style: TextStyle(color: AppColors.bgColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Consumer<MainProvider>(
                    builder: (context, values, child) {
                      return Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.black,
                        value: values.whatsapp,
                        onChanged: (value) {
                          values.checkboxvalue(value);
                          if (value == true) {
                            // Call the ticket download function
                            downloadTicket(context);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: height / 5),
            Consumer<MainProvider>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    value.getMap(storeId);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapPage(
                          storeId: storeId,
                          userId: userId,
                          registerphoneNumber: registerphoneNumber,
                          storeWithFieald: storeWithField,
                          profileName: profileName,
                          signupPhoto: signupPhoto,
                          categoryid: categoryId,

                        ),
                      ),
                    );
                  },
                  child: fillbtn(width / 1.22, height / 15, AppColors.btnColor, "Continue", Colors.white),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
