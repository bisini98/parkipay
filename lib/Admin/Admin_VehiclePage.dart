import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Add_VehiclePage.dart';
import 'package:parkipay/Admin/Admin_map.dart';

import '../constant/colors.dart';
import '../constant/refactoring.dart';
import 'Add_HomeScreen.dart';

class AdminVehiclePage extends StatelessWidget {
  AdminVehiclePage({super.key});

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.bgColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddVehiclePage(),));
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
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
            SizedBox(height: height/10,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminMapPage(),));
              },
                child: fillbtn(width/2, height/15, AppColors.AdminbtnColor, "Show Map", Colors.white
                ))

          ],
        ),
      ),
    );
  }
}
