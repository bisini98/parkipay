import 'package:flutter/material.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/refactoring.dart';
import 'package:provider/provider.dart';

import 'Admin_CustomerList.dart';

class LoginRequests extends StatelessWidget {
  const LoginRequests({super.key});


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: SingleChildScrollView(
       // physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
          quarterContainerWithIcon(height, width, "Login Requests"),
            SizedBox(
              height: height/1.22,

                child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    physics: ScrollPhysics(),
                    itemCount: value.RegistrationList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Consumer<MainProvider>(
                                builder: (context,value,child) {
                                   return Container(
                                     height: height/4,
                                     width: width/1.22,
                                     decoration: BoxDecoration(
                                         color:AppColors.AdminLoginRequestColor,
                                         borderRadius: BorderRadius.circular(10)
                                     ),
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.only(left: 20),
                                           child: Consumer<MainProvider>(
                                               builder: (context,value,child) {
                                                 return Row(
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     Text("Name",style: TextStyle(color: Colors.white),),
                                                     SizedBox(width: 5,),
                                                     Text(":",style: TextStyle(color: Colors.white)),
                                                     SizedBox(width: 10,),
                                                     Text(value.RegistrationList[index].name,style: TextStyle(color: Colors.white),),

                                                   ],
                                                 );
                                               }
                                           ),
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
                                               Text(value.RegistrationList[index].phone,style: TextStyle(color: Colors.white),),
                                             ],
                                           ),
                                         ),
                                         SizedBox(height: height/20,),
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Consumer<MainProvider>(
                                               builder: (context,value,child) {
                                                 return InkWell(
                                                   onTap: () {
                                                     value.statutsapv(value.RegistrationList[index].id, value.RegistrationList[index].name
                                                         , value.RegistrationList[index].phone, context);
                                                   },
                                                   child: Container(
                                                     height: height/15,
                                                     width: width/3.55,
                                                     decoration: BoxDecoration(
                                                       color: Color(0xff61B853),
                                                       borderRadius: BorderRadius.circular(15),
                                                     ),
                                                     child: Center(child: Text("Accept",style: TextStyle(color: Colors.white),)),
                                                   ),
                                                 );
                                               }
                                             ),
                                             SizedBox(width: 10,),
                                             Consumer<MainProvider>(
                                               builder: (context,val,child) {
                                                 return InkWell(  onTap: () {
                                                   val.statusreject(value.RegistrationList[index].id, context);
                                                 },
                                                   child: Container(
                                                     height: height/15,
                                                     width: width/3.55,
                                                     decoration: BoxDecoration(
                                                       color: Color(0xffC62727),
                                                       borderRadius: BorderRadius.circular(15),
                                                     ),
                                                     child: Center(child: Text("Decline",style: TextStyle(color: Colors.white),)),
                                                   ),
                                                 );
                                               }
                                             )
                                           ],
                                         )
                                       ],
                                     ),

                                   );
                                }
                              ),
                            );
                        }
                    );
                  }
                ))
          ],
        ),
      ),
    );
  }
}
