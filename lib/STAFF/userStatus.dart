import 'package:flutter/material.dart';
import 'package:parkipay/constant/AppConstants.dart';

import '../constant/refactoring.dart';

class UserStatus extends StatelessWidget {
  const UserStatus({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      appBar: AppBar(
        toolbarHeight: height/4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        backgroundColor: AppColors.bgColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10), // Optional: Add padding to the avatar
          child: CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.btnColor,
            backgroundImage: AssetImage("assets/Rectangle.png"),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Optional: Add some padding
            child: Icon(Icons.logout_outlined, color: AppColors.btnColor),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // halfContainerStaff(height,width,context),
            Container(
              height: height/5,
              width: width,
              decoration: BoxDecoration(
                color: AppColors.btnColor
              ),
            )

          ],
        ),
      ),
    );
  }
}
