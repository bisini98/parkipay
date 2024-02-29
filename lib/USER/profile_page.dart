import 'package:flutter/material.dart';
import 'package:parkipay/USER/payment_history.dart';
import 'package:parkipay/constant/colors.dart';

import '../constant/refactoring.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: Column(
        children: [
          quarterContainer(height/1, width, "Profile"),
          SizedBox(height: height/20,),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
              backgroundImage: NetworkImage("https://plus.unsplash.com/premium_photo-1677553953986-a78e31a192f8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWFufGVufDB8fDB8fHww"),
            child: Container(
              margin: EdgeInsets.only(left: 80,top: 50),
              height: 20,
                width: 20,
                color: Color(0xff6B4DE2),
                child: Icon(Icons.edit,color: Colors.white,size: 15,),),
          ),
          SizedBox(height: 10,),
          Text("Antony Joseph",style: TextStyle(fontWeight: FontWeight.w600),),
          SizedBox(height: 5,),
          Text("7890XXXXXX"),
          SizedBox(height: height/10,),
          ListTile(
            leading: Icon(Icons.account_circle,color: AppColors.bgColor,),
            title: Text("Edit Profile",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.normal),),
          ),
          ListTile(
            leading: Image.asset("assets/payment.png",scale: 4,color: AppColors.bgColor,),
            title: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentHistory(),));
              },
                child: Text("Payment History",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.normal),)),
          ),
          ListTile(
            leading: Icon(Icons.help_outline_sharp,color: AppColors.bgColor,),
            title: Text("Help",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.normal),),
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined,color: AppColors.btnColor,),
            title: Text("Logout",style: TextStyle(color: AppColors.btnColor,fontWeight: FontWeight.normal),),
          ),

        ],
      ),
    );
  }
}
