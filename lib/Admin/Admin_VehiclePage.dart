import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:parkipay/Admin/Add_VehiclePage.dart';
import 'package:parkipay/Admin/Admin_map.dart';
import 'package:parkipay/Model/ModelClass.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:provider/provider.dart';

import '../constant/AppConstants.dart';
import '../constant/refactoring.dart';
import 'Add_HomeScreen.dart';


class AdminVehiclePage extends StatelessWidget {

  final String storeId;
  AdminVehiclePage({super.key,required this.storeId});

  // List<String>img=[
  //   "assets/Motorbike.png",
  //   "assets/Car.png",
  //   "assets/Delivery.png"
  // ];
  // List<dynamic>text=[
  //   "Bike",
  //   "Car",
  //   "Truck"
  // ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      floatingActionButton: Consumer<MainProvider>(
        builder: (context,value,child) {
          return FloatingActionButton(
            backgroundColor: AppColors.bgColor,
            onPressed: () {
              value.Vehicleclear();
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddVehiclePage(from: "NEW",oldid: "",),));
            },
            child: Icon(Icons.add,color: Colors.white,),
          );
        }
      ),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            quarterContainerWithIcon(height, width, "Categories"),
            SizedBox(height: height/35,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text("Add Vehicles :",style: TextStyle(fontWeight: FontWeight.w600),)
                ],
              ),
            ),
            SizedBox(height: height/10,),
            SizedBox(
              width: width,
              height: height/3.80,
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  print(value.VehicleList.length.toString()+'hi');
                  return value.getvehicleLoader?Center(child: CircularProgressIndicator(color: Colors.blue,)):ListView.builder(

                       physics:  ScrollPhysics(),

                      itemCount: value.VehicleList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context,index){

                        return InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content:  Text(
                                    "Do you want to  EDIT or DELETE ?",style: TextStyle(
                                    fontSize:17,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue)),
                                actions: <Widget>[
                                  Center(
                                    child: Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            value.DeleteVehicle(
                                                value.VehicleList[index].id,context);
                                            Navigator.of(context).pop();

                                          },
                                          child: Container(
                                            height: 45,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                color:Colors.red ,
                                                borderRadius: BorderRadius.circular(8),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x26000000),
                                                    blurRadius: 2.0, // soften the shadow
                                                    spreadRadius: 1.0, //extend the shadow
                                                  ),
                                                ] ),
                                            child: Center(child:  Text("Delete",style: TextStyle( color:AppColors.otpColor,fontSize: 17,fontWeight: FontWeight.w700))),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            print("hjjk"+ value.VehicleList[index].id);
                                            value.EditVehicle(
                                                value.VehicleList[index].id);
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddVehiclePage(
                                                          from: "EDIT",
                                                          oldid: value.VehicleList[index].id
                                                      ),
                                                ));
                                          },
                                          child:Container(
                                            height: 45,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                color:AppColors.AdminpaymentcontainerColor ,
                                                borderRadius: BorderRadius.circular(8),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x26000000),
                                                    blurRadius: 2.0, // soften the shadow
                                                    spreadRadius: 1.0, //extend the shadow
                                                  ),
                                                ] ),
                                            child: Center(child:  Text("Edit",style: TextStyle( color:Colors.white,fontSize: 17,fontWeight: FontWeight.w700))),
                                          ),)
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            );
                          },
                          child: Container(
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
                                Container(
                                  height:height/5.8,
                                  width: width,
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                                    image: DecorationImage(
                                      // fit: BoxFit.fill,
                                        image: NetworkImage(value.VehicleList[index].photo.toString(),scale: 3) )
                                      //
                                  ),
                                    //
                                ),
                                Text(value.VehicleList[index].name.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                        );
                      }
                  );
                }
              ),
            ),
            SizedBox(height: height/10,),

             Consumer<MainProvider>(
              builder: (context,value,child) {
                return   value.VehicleList.isNotEmpty? GestureDetector(
                  onTap: () {
                    print("hello"+storeId);
                     // value.getMap(storeId);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShowMapAdmin(storeId: storeId,),));
                  },
                    child: fillbtn(width/2, height/15, AppColors.AdminbtnColor, "Show Map", Colors.white
                    )):SizedBox();
              }
            )

          ],
        ),
      ),
    );
  }
}
