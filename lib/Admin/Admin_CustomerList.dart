import 'package:flutter/material.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:provider/provider.dart';

import '../Provider/MainProvider.dart';
import '../constant/refactoring.dart';

class AdminCustomerList extends StatelessWidget {
  const AdminCustomerList({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            quarterContainerWithIcon(height, width, "Customers",context),
           // SizedBox(height: height/20,),
            Consumer<MainProvider>(
                builder: (context,val,child) {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  physics: ScrollPhysics(),
                  itemCount: val.RegistrationList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child:Container(
                      height: height/5,
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name",style: TextStyle(color: Colors.white),),
                                SizedBox(width: 5,),
                                Text(":",style: TextStyle(color: Colors.white)),
                                SizedBox(width: 10,),
                                Text(val.RegistrationList[index].name,style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Phone Number",style: TextStyle(color: Colors.white),),
                                SizedBox(width: 5,),
                                Text(":",style: TextStyle(color: Colors.white)),
                                SizedBox(width: 10,),
                                Text(val.RegistrationList[index].phone,style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          SizedBox(height: height/20,),
                          Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: height/20,
                                  width: width/8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(child: Image.asset("assets/phone.png")),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: height/20,
                                  width: width/8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(child: Image.asset("assets/customerwhatsup.png")),
                                )
                              ],
                            ),
                          )
                        ],
                      ),

                    ),
                  );
                },

                    );
              }
            )
          ],
        ),
      ),
    );
  }
}
