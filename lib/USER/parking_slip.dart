import 'package:flutter/material.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/USER/map.dart';
import 'package:parkipay/USER/next_payment.dart';
import 'package:parkipay/USER/payments.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:provider/provider.dart';

import '../constant/refactoring.dart';

class ParkingSlip extends StatelessWidget {
  String storeId;
  String userId;
  String registerphoneNumber;
  String fieldName;
  String floorName;

   ParkingSlip({super.key,required this.storeId,required this.userId,required this.registerphoneNumber,required this.fieldName,required this.floorName,});

  @override
  Widget build(BuildContext context) {
    print("hhhhhhh"+fieldName);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    DateTime now = DateTime.now();
    String period = now.hour >= 12 ? 'PM' : 'AM';
    int hour = now.hour % 12 == 0 ? 12 : now.hour % 12;
    String minute = now.minute.toString().padLeft(2, '0');
    String currentTime = '$hour:$minute $period';

    String laneLetter = fieldName.substring(0, 2);

    RegExp regExp = RegExp(r'\d+$');
    Match? match = regExp.firstMatch(fieldName);
    String lastNumbers = '';
    if (match != null) {
      lastNumbers = match.group(0)!;
    }

    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: Column(
        children: [
          quarterContainer(height/1, width, "Parking Slip"),
          SizedBox(height: height/13,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Happy Parking !",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.w600),),
              SizedBox(height: 10,),
              Text("Please make sure you park on the right spot",style: TextStyle(color: AppColors.bgColor),),
            ],
          ),
          SizedBox(height: height/15,),
          // parkingslip(height,width),
      Consumer<MainProvider>(
        builder: (context,value,child) {
          return Container(
            margin: EdgeInsets.only(bottom: 15),
            height: height/2.60,
            width: width/1.20,
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  //margin: EdgeInsets.only(top: 20),
                  height: height/10,
                  width: height/10,
                  decoration: BoxDecoration(
                      color: AppColors.spotColor
                  ),

                  child: Center(child: Text(fieldName.toString(),style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.w600,fontSize: 25),)),
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                          children: [
                            Icon(Icons.alarm,color: AppColors.bgColor,),
                            Text('$currentTime',style: TextStyle(color: AppColors.bgColor)),
                          ]),
                      VerticalDivider(
                        color: AppColors.bgColor,
                        width: 20,
                        thickness: 1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Parking Details:",style: TextStyle(color: AppColors.bgColor),),
                          SizedBox(height: 5,),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Text('Floor $floorName',style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
                                VerticalDivider(
                                  color: AppColors.bgColor,
                                  width: 20,
                                  thickness: 2,
                                ),
                                Text("Lane $laneLetter",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
                                VerticalDivider(
                                  color: AppColors.bgColor,
                                  width: 20,
                                  thickness: 2,
                                ),
                                Text("Pos.$lastNumbers",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Free parking for first 30 mins, afterwards ₹8/hr",style: TextStyle(fontSize: 12,color: AppColors.bgColor),),
                  ],
                ),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSlip(),));
                    },
                    child: Text("Pay at exit",style: TextStyle(fontWeight: FontWeight.w600,color: AppColors.bgColor),)
                )
              ],
            ),
          );
        }
      ),
          SizedBox(height: height/20,),
          Text("Check SMS/Whatsapp to view parking slip",style: TextStyle(color: AppColors.bgColor),),
      SizedBox(height: height/30,),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage(storeId: storeId,userId: userId,registerphoneNumber: registerphoneNumber),));
        },
          child: fillbtn(width/1.22, height/15, AppColors.btnColor, "View Map",Colors.white)
      )

        ],
      ),
    );
  }
}
