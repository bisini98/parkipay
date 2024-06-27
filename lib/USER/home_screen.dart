import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/refactoring.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation.dart';

class Home_screen extends StatelessWidget {
  String photo;
  String profileName;
  String profilePhone;
  String userId;
  String storeWithFieald;



   Home_screen({super.key,required this.photo,required this.profileName,required this.profilePhone,required this.userId,required this.storeWithFieald});

   List<String>images=[
     "assets/img.png",
     "assets/img_1.png",
     "assets/img_2.png",
     "assets/img_3.png"

   ];
   List<String>txt=[
     "Nesto",
     "Lulu",
     "Market City",
     "Hilite"
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
          halfContainer(height),
            //SizedBox(height: 10,),
           SizedBox(
             height: height,
             child: Consumer<MainProvider>(
               builder: (context,value,child) {
                 return GridView.builder(
                   shrinkWrap: true,
                  scrollDirection: Axis.vertical,
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
                    return InkWell(onTap: () {
                      value.getMap(value.CategoryList[index].id);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Bottombar(categoryid: value.CategoryList[index].id,storeId:value.CategoryList[index].id ,Signupphoto:photo ,Profilename: profileName,Profilephone: profilePhone,userId: userId, storeWithFieald: storeWithFieald,),));
                    },
                      child: Stack(
                        children:[
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage( value.CategoryList[index].photo),
                                  fit: BoxFit.cover,
                                )
                            ),
                            ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: height/15,
                              width: width/2.15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.65),
                              ),

                              alignment: Alignment.center,
                              child: Text( value.CategoryList[index].name,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ]

                      ),
                    );
                  }
                 );
               }
             ),
           )
          ],
        ),
      ),
    );
  }
}
