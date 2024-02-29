import 'package:flutter/material.dart';
import 'package:parkipay/USER/map.dart';
import 'package:parkipay/constant/colors.dart';
import 'package:parkipay/constant/refactoring.dart';

class Continue extends StatelessWidget {
   Continue({super.key});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: Column(
        children: [
          quarterContainer(height/1, width, "Contact Details"),
          SizedBox(height: height/13,),
          Padding(
            padding: const EdgeInsets.only(right: 55),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nearest available spot is ready for you!",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Enter details to receive parking slip",style: TextStyle(color: AppColors.bgColor),),
              ],
            ),
          ),

          SizedBox(height: height/15,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text("*",style: TextStyle(color: Colors.red),),
                SizedBox(width: 2,),
                Text("Mobile Number")
              ],
            ),
          ),
          SizedBox(height: 20,),
          numbertxtfrm(height, width, "eg: 99345xxxxx"),
          SizedBox(height: 10,),
          Text("Your Number will only be used for sending  the parking slip",style: TextStyle(fontSize: 10,color: AppColors.bgColor),),
          SizedBox(height: 80,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Image.asset("assets/whatsapp.png",scale: 4.5,),
                SizedBox(width: 5,),
                Text("Receive parking slip on Whatsapp?",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
                SizedBox(width: 5,),
                Checkbox(value: false,
                    onChanged: (value){
                    value=true;
                }),
              ],
            ),
          ),
          SizedBox(height: height/5,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage(),));
            },
              child: fillbtn(width/1.22, height/15, AppColors.btnColor, "Continue",Colors.white
              )),
        ],
      ),
    );
  }
}
