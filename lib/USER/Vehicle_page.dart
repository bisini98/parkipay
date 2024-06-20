import 'package:flutter/material.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:provider/provider.dart';

import '../constant/refactoring.dart';
import 'map.dart';

class VehiclePage extends StatelessWidget {
  String categoryid;
  final String storeId;
  String Signupphoto;
  String Profilename;
  String userId;
  String registerphoneNumber;

   VehiclePage({super.key,required this.categoryid,required this.storeId,required this.Signupphoto,required this.Profilename,required this.userId,required this.registerphoneNumber});

  @override
  Widget build(BuildContext context) {
    int selectedindex=0;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            // halfContainer1(height/1,width/1),
        Container(
        decoration: BoxDecoration(
        color: AppColors.bgColor,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
        ),
        child: Container(width: width,
          margin: EdgeInsets.only(left: 20,top: 30),
          child: Consumer<MainProvider>(
              builder: (context,value,child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10,top: 20),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                                Signupphoto.toString()
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: height/10),
                    Row(
                      children: [
                        Text("Hi",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 24),),
                        SizedBox(width: 5,),
                        Text(Profilename.toString(),style: TextStyle(color: Colors.white,fontSize: 24),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text("I found a spot!",style: TextStyle(color: Colors.white,fontSize: 24),),
                    SizedBox(height: height/20,),
                  ],
                );
              }
          ),
        ),
      ),
            SizedBox(height: 20,),
            SizedBox(
              height: height/4.50,
              // width: width/2,
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: value.VehicleList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context,int index){

                        return InkWell(onTap: () {
                          selectedindex=index;
                          print("ssjjdbhc"+storeId);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage(storeId: storeId,userId: userId,registerphoneNumber: registerphoneNumber,),));
                        },
                          child: Container(
                            margin: EdgeInsets.all(8),
                            height: height/4,
                            width: width/3.5,
                            decoration: BoxDecoration(
                                color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:selectedindex==index?AppColors.bgColor: AppColors.strockColor,width: selectedindex==index?2:0)
                              // image: DecorationImage(
                              //     image: AssetImage(img[index],),
                              // )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:height/5.8,
                                  width: width,
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                                      image: DecorationImage(

                                          image: NetworkImage(value.VehicleList[index].photo.toString(),scale: 3) )
                                    //
                                  ),
                                  //
                                ),
                                Text(value.VehicleList[index].name.toString()),
                              ],
                            ),
                          ),
                        );
                      }
                  );
                }
              ),
            ),
            SizedBox(height: 10,),
           //  Row(
           //    mainAxisAlignment: MainAxisAlignment.start,
           //    children: [
           //      Padding(
           //        padding: const EdgeInsets.only(left: 10),
           //        child: Text("Recent Place",style: TextStyle(color: AppColors.textColor),),
           //      ),
           //    ],
           //  ),
           // // SizedBox(height: 20,),
           //  SizedBox(
           //    height: height/2.20,
           //    child: ListView.builder(
           //      physics: ScrollPhysics(),
           //        itemCount: 3,
           //        shrinkWrap: true,
           //        scrollDirection: Axis.vertical,
           //        itemBuilder: (context, index) {
           //          return Container(
           //            margin: EdgeInsets.only(bottom: 10),
           //            height: height/5,
           //            width: width/1.05,
           //            decoration: BoxDecoration(
           //                color: Colors.white
           //            ),
           //            child: Row(
           //              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           //              children: [
           //                Container(
           //                  height: height/10,
           //                  width: width/5,
           //                  decoration: BoxDecoration(
           //                      color: AppColors.spotColor
           //                  ),
           //                  child: Center(child: Text("A2",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.w900),)),
           //                ),
           //                Column(
           //                  mainAxisAlignment: MainAxisAlignment.spaceAround,
           //                  children: [
           //                    Container(
           //                      height: height/20,
           //                      width: width/3.40,
           //                      decoration: BoxDecoration(
           //                        color: AppColors.btnColor,
           //                        borderRadius: BorderRadius.circular(20),
           //                      ),
           //                      child: Center(child: Text("Car Parking",style: TextStyle(color: Colors.white),)),
           //                    ),
           //                    //SizedBox(height: 10,),
           //                    IntrinsicHeight(
           //                      child: Row(
           //                        children: [
           //                          Text("Floor 1",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
           //                          VerticalDivider(
           //                            color: AppColors.bgColor,
           //                            width: 20,
           //                            thickness: 2,
           //                          ),
           //                          Text("Lane A",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
           //                          VerticalDivider(
           //                            color: AppColors.bgColor,
           //                            width: 20,
           //                            thickness: 2,
           //                          ),
           //                          Text("Pos.2",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
           //                        ],
           //                      ),
           //                    ),
           //                    Row(
           //                      children: [
           //                        Icon(Icons.alarm,color: AppColors.bgColor,),
           //                        SizedBox(width: 2,),
           //                        Text("2 Hours",style: TextStyle(fontWeight: FontWeight.w500),),
           //                        SizedBox(width: 10,),
           //                        Image.asset("assets/ri-car-fill.png",scale: 2,),
           //                        SizedBox(width: 2,),
           //                        Text("A2",style: TextStyle(fontWeight: FontWeight.w500,),),
           //                      ],
           //                    )
           //
           //                  ],
           //                )
           //              ],
           //            ),
           //          );
           //        },
           //    ),
           //  ),
           //  SizedBox(height: height/3,)
          ],
        ),
      ),
    );
  }
}
