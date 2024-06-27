import 'package:flutter/material.dart';
import 'package:parkipay/constant/AppConstants.dart';

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: Container(
          height: height/4,
          width: width/1.05,
          decoration: BoxDecoration(
            color: AppColors.navigationColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20,right: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Name",style: TextStyle(color: Colors.white),),
                        SizedBox(width: 5,),
                        Text(":",style: TextStyle(color: Colors.white)),
                        SizedBox(width: 10,),
                        Text("Bisini",style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Phone",style: TextStyle(color: Colors.white),),
                          SizedBox(width: 5,),
                          Text(":",style: TextStyle(color: Colors.white)),
                          SizedBox(width: 10,),
                          Text("6789997",style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10,),
                          Text("Slot No",style: TextStyle(color: Colors.white),),
                          SizedBox(width: 5,),
                          Text(":",style: TextStyle(color: Colors.white)),
                          SizedBox(width: 10,),
                          Container(
                            height: height/30,
                            width: width/8,
                            decoration: BoxDecoration(
                              color: AppColors.bgColor
                            ),
                              child: Center(child: Text("RH2",style: TextStyle(color: Colors.white)))),
                        ],
                      ),
                    ),

                    SizedBox(height: height/35,),
                    Container(
                      height: height/15,
                      width: width/3.55,
                      decoration: BoxDecoration(
                        color: Color(0xffC62727),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(child: Text("Check Out",style: TextStyle(color: Colors.white),)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: height/20,
                          width: width/8,
                          decoration: BoxDecoration(
                            color: AppColors.spotColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(child: Image.asset("assets/phone.png")),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          height: height/20,
                          width: width/8,
                          decoration: BoxDecoration(
                            color: AppColors.spotColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(child: Image.asset("assets/customerwhatsup.png")),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

            ),
      ),
    );
  }
}
