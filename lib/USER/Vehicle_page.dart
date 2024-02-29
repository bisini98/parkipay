import 'package:flutter/material.dart';
import 'package:parkipay/constant/colors.dart';

import '../constant/refactoring.dart';

class VehiclePage extends StatelessWidget {
   VehiclePage({super.key});

  List<String>img=[
    "assets/Motorbike.png",
    "assets/Car.png",
    "assets/Delivery.png"
  ];
  List<dynamic>text=[
    "Bike",
    "Car",
    "Truck"
  ];

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
            halfContainer1(height/1,width/1),
            SizedBox(height: 20,),
            SizedBox(
              height: height/4.5,
              //width: width/2,
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context,int index){

                    return Container(
                      margin: EdgeInsets.all(8),
                      height: height/4,
                      width: width/3.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.strockColor)
                        // image: DecorationImage(
                        //     image: AssetImage(img[index],),
                        // )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(img[index],scale: 5,),
                          Text(text[index]),
                        ],
                      ),
                    );
                  }
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("Recent Place",style: TextStyle(color: AppColors.textColor),),
                ),
              ],
            ),
           // SizedBox(height: 20,),
            SizedBox(
              height: height/3.1,
              child: ListView.builder(
                physics: ScrollPhysics(),
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: height/5,
                      width: width/1.05,
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: height/10,
                            width: width/5,
                            decoration: BoxDecoration(
                                color: AppColors.spotColor
                            ),
                            child: Center(child: Text("A2",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.w900),)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: height/20,
                                width: width/3.40,
                                decoration: BoxDecoration(
                                  color: AppColors.btnColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("Car Parking",style: TextStyle(color: Colors.white),)),
                              ),
                              //SizedBox(height: 10,),
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Text("Floor 1",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
                                    VerticalDivider(
                                      color: AppColors.bgColor,
                                      width: 20,
                                      thickness: 2,
                                    ),
                                    Text("Lane A",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
                                    VerticalDivider(
                                      color: AppColors.bgColor,
                                      width: 20,
                                      thickness: 2,
                                    ),
                                    Text("Pos.2",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.alarm,color: AppColors.bgColor,),
                                  SizedBox(width: 2,),
                                  Text("2 Hours",style: TextStyle(fontWeight: FontWeight.w500),),
                                  SizedBox(width: 10,),
                                  Image.asset("assets/ri-car-fill.png",scale: 2,),
                                  SizedBox(width: 2,),
                                  Text("A2",style: TextStyle(fontWeight: FontWeight.w500,),),
                                ],
                              )

                            ],
                          )
                        ],
                      ),
                    );
                  },
              ),
            ),
            SizedBox(height: height/3,)
          ],
        ),
      ),
    );
  }
}
