import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Add_HomeScreen.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:provider/provider.dart';

import '../constant/AppConstants.dart';
import '../constant/refactoring.dart';

class AdminHome extends StatelessWidget {
  AdminHome({super.key});
  // List<String>images=[
  //   "assets/img.png",
  //   "assets/img_1.png",
  //   "assets/img_2.png",
  //   "assets/img_3.png"
  //
  // ];
  // List<String>txt=[
  //   "Nesto",
  //   "Lulu",
  //   "Market City",
  //   "Hilite"
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
              value.categoryclear();
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddHomeScreen(from: "NEW",oldid: "",),));
            },
            child: Icon(Icons.add,color: Colors.white,),
          );
        }
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            quarterContainerWithIcon(height, width, "Home Screen"),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return value.gethomescreenLoader?Center(child: CircularProgressIndicator(color: Colors.blue,)):GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    //scrollDirection: Axis.vertical,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    itemCount: value.CategoryList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6,
                      mainAxisExtent: height/3.5,
                      crossAxisSpacing: 6,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (BuildContext context, int index){
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
                                            value.DeleteCategory(
                                                value.CategoryList[index].id,context);
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
                                            print("hjjk"+ value.CategoryList[index].id);
                                            value.EditCategory(
                                                value.CategoryList[index].id);
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddHomeScreen(
                                                          from: "EDIT",
                                                          oldid: value.CategoryList[index].id
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
                        child: Stack(
                            children:[
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(value.CategoryList[index].photo.toString()),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                              Positioned(
                                top:171,
                                child: Container(
                                  height: height/15,
                                  width: width/2.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black.withOpacity(0.65),
                                  ),

                                  alignment: Alignment.center,
                                  child: Text(value.CategoryList[index].name,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),
                                ),
                              ),
                            ]

                        ),
                      );
                    }
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
