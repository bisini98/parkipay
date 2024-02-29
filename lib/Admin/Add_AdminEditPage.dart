import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Add_mappage.dart';
import 'package:parkipay/Admin/Admin_Home.dart';
import 'package:parkipay/Admin/Admin_VehiclePage.dart';
import 'package:parkipay/Admin/Admin_map.dart';
import 'package:parkipay/constant/colors.dart';

import '../constant/refactoring.dart';

class AdminEditPage extends StatelessWidget {
   AdminEditPage({super.key});

  List<String>text=[
    "D1",
    "D2",
    "D3",
    "D4",
    "D5",
    "D6",
    "D7",
    "D8",
    "D9",
    "D10"
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height/20,),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text("Homescreen :",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
            ),
            SizedBox(height: height/25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                addImgcontainer(height/1.22,width/1.22),
                GestureDetector(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome(),));
                  },
                    child: fillbtnwithicon(width/4, height/15, AppColors.AdminbtnColor, "Edit", Colors.white))
              ],
            ),
            SizedBox(height: height/30,),
            Padding(
              padding: const EdgeInsets.only(right: 140),
              child: fillbtn(width/2, height/15, AppColors.btnColor, "Type Name", Colors.white),
            ),
            SizedBox(height: height/25,),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text("Add Vehicle :",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
            ),
            SizedBox(height: height/30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                addcontainer(height/1.22, width/1.22),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminVehiclePage(),));
                  },
                    child: fillbtnwithicon(width/4, height/15, AppColors.AdminbtnColor, "Edit", Colors.white))
              ],
            ),
            SizedBox(height: height/30,),
            Padding(
              padding: const EdgeInsets.only(right: 140),
              child: fillbtn(width/2, height/15, AppColors.btnColor, "Type Name", Colors.white),
            ),
            SizedBox(height: height/30,),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text("Map :",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
            ),
            SizedBox(height: height/25,),
            Stack(
               children: [
                 Container(
                   height: height/4,
                   width: width/1.1,
                   decoration: BoxDecoration(
                       color: Colors.white
                   ),
                   child: ListView.builder(
                     itemCount: text.length,
                     shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                     physics: ScrollPhysics(),
                     padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                     itemBuilder: (context, index) {
                       return Padding(
                         padding: const EdgeInsets.only(left: 10),
                         child: mapListContainer(height/5, width,text[index]),
                       );
                     },
                   ),

                 ),
                 Positioned(
                   left: 210,
                     top: 100,
                     child: GestureDetector(
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => AdminMapPage(),));
                       },
                         child: fillbtnwithicon(width/4, height/15, AppColors.AdminbtnColor, "Edit", Colors.white))),
               ],
            ),
            SizedBox(height: height/10,),
            fillbtn(width/3, height/15, AppColors.AdminbtnColor, "Done", Colors.white),
            SizedBox(height: height/10,)

          ],
        ),
      ),
    );
  }
}
