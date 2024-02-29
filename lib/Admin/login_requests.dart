import 'package:flutter/material.dart';
import 'package:parkipay/constant/colors.dart';
import 'package:parkipay/constant/refactoring.dart';

class LoginRequests extends StatelessWidget {
  const LoginRequests({super.key});

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
          quarterContainerWithIcon(height, width, "Login Requests"),
            SizedBox(
              height: height/1.22,

                child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                physics: ScrollPhysics(),
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: loginrequestcontainer(height, width),
        );
    }
                ))
          ],
        ),
      ),
    );
  }
}
