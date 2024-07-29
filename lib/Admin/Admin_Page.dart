import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Admin_CustomerList.dart';
import 'package:parkipay/Admin/Admin_Home.dart';
import 'package:parkipay/Admin/Admin_ParkingSlip.dart';
import 'package:parkipay/Admin/Admin_Payments.dart';
import 'package:parkipay/Admin/Admin_StaffDetails.dart';
import 'package:parkipay/Admin/Admin_VehiclePage.dart';
import 'package:parkipay/Admin/login_requests.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/refactoring.dart';
import 'package:provider/provider.dart';



class AdminPage extends StatelessWidget {
  AdminPage({super.key});

  List<String>text=[
    "Login Requests",
    "Home Page",
    "Vehicle",
    "Customers",
    "Parking Slips",
    "Payments"
  ];

  List<dynamic>icons=[
    Icon(Icons.group_add,color: Colors.white),
    Icon(Icons.home,color: Colors.white),
    Image.asset("assets/vehicle.png",scale: 4,),
    Image.asset("assets/customerlist.png",color: Colors.white,scale: 1.20,),
    Image.asset("assets/ri-ticket-2-line.png",color: Colors.white,scale: 4,),
    Image.asset("assets/payment.png",color: Colors.white,scale: 4,),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () async {
          showExitPopup(context);
          return true;
        },
      child: Scaffold(
        backgroundColor: AppColors.btn1Color,
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
            halfContainerAdmin(height,width,context),
              SizedBox(height: height/20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return InkWell(
                    onTap: () {
                      value.getRegistration();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginRequests(),));
                    },
                      child: AdminHomeContainerWithIcon(height/1.40, width, "Login Requests",Icons.group_add,));
                }
              ),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return InkWell(
                    onTap: () {
                      value.getCategory();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome(),));
                    },
                      child: AdminHomeContainerWithIcon(height/1.40, width, "Home Page",Icons.home,));
                }
              ),
            ],
          ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Consumer<MainProvider>(
                  //   builder: (context,val,child) {
                  //     return InkWell(
                  //       onTap: () {
                  //         val.getVehicle();
                  //         Navigator.push(context, MaterialPageRoute(builder: (context) => AdminVehiclePage(),));
                  //       },
                  //         child: AdminHomeContainerWithImg(height/1.40, width, "Vehicle","assets/vehicle.png",4));
                  //   }
                  // ),
                  Consumer<MainProvider>(
                      builder: (context,val,child) {
                      return InkWell(
                        onTap: () {
                          val.getcustomer();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminCustomerList(),));
                        },
                          child: AdminHomeContainerWithImg(height/1.40, width, "Customers","assets/customerlist.png",1.20));
                    }
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          value.getStaff();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => StaffDetails(),));
                        },
                          child: AdminHomeContainerWithImg(height/1.40, width, "Add Staff","assets/ri-ticket-2-line.png",4)),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPaymentList(),));
                        },
                          child: AdminHomeContainerWithImg(height/1.40, width, "Payments","assets/payment.png",4)),
                    ],
                  );
                }
              ),
          SizedBox(height: 20,),
          // SizedBox(
          //   height: height,
          //   child: Consumer<MainProvider>(
          //     builder: (context,value,child) {
          //       return GridView.builder(
          //           padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
          //           itemCount: 6,
          //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2,
          //             mainAxisSpacing: 30,
          //             crossAxisSpacing: 30,
          //             childAspectRatio: 1,
          //
          //           ),
          //           itemBuilder: (BuildContext context, int index){
          //             return InkWell(
          //               onTap: () {
          //                 // text[index] == "Login Requests" ? null :
          //                 // text[index] == "Home Page" ?   value.homepage_functions(context):
          //                 // text[index] == "Vehicle" ? null :
          //                 // text[index] == "Customers"? null :
          //                 // text[index] == "Parking Slips" ? null :
          //                 // text[index] == "Payments" ? null
          //
          //               },
          //               child: Container(
          //                 height: height/4,
          //                 width: width/4,
          //                 decoration: BoxDecoration(
          //                     color:AppColors.AdminContColor,
          //                   borderRadius: BorderRadius.circular(5)
          //                 ),
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     icons[index],
          //                     SizedBox(height: 5,),
          //                     Text(text[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12,shadows: [
          //                       Shadow(
          //                         color: Colors.black.withOpacity(0.7),
          //                         offset: Offset(2,6),
          //                         blurRadius: 10
          //                       )
          //                     ]),)
          //                   ],
          //                 ),
          //               ),
          //             );
          //           }
          //       );
          //     }
          //   ),
          // ),
          ],
          ),
        ),
      ),
    );
  }

  Future<bool> showExitPopup(BuildContext CONTXT) async {

    return await showDialog(
        context: CONTXT,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: SizedBox(
              height: 95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Do you want to EXIT ?",style: TextStyle(
                      fontSize:17,

                      fontFamily:'ink nut',
                      fontWeight: FontWeight.w700,
                      color: AppColors.bgColor)),
                  const SizedBox(height: 19),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              exit(0);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.bgColor),
                            child: Center(child:  Text("yes",style: TextStyle( color: Colors.white,fontSize: 17,fontWeight: FontWeight.w700)))
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ), child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),

                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

}



// class AdminPage extends StatelessWidget {
//   AdminPage({Key? key}) : super(key: key);
//
//   final List<AdminMenuItem> menuItems = [
//     AdminMenuItem("Login Requests", Icons.group_add, Colors.blue),
//     AdminMenuItem("Home Page", Icons.home, Colors.green, height: 200, width: 150),
//     AdminMenuItem("Vehicle", "assets/vehicle.png", Colors.orange),
//     AdminMenuItem("Customers", "assets/customerlist.png", Colors.purple),
//     AdminMenuItem("Add Staff", "assets/ri-ticket-2-line.png", Colors.red, height: 200, width: 150),
//     AdminMenuItem("Payments", "assets/payment.png", Colors.teal),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return WillPopScope(
//       onWillPop: () async {
//         return showExitPopup(context);
//       },
//       child: Scaffold(
//         backgroundColor: AppColors.btn1Color,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               halfContainerAdmin(height, width, context),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: StaggeredGrid.count(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 16.0,
//                   crossAxisSpacing: 16.0,
//                   children: menuItems.asMap().entries.map((entry) {
//                     int index = entry.key;
//                     AdminMenuItem item = entry.value;
//                     return StaggeredGridTile.fit(
//                       crossAxisCellCount: index == 0 ? 2 : 1, // Span full width if it's the first item
//                       child: AdminMenuItemWidget(item),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<bool> showExitPopup(BuildContext context) async {
//     return await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.white,
//           content: SizedBox(
//             height: 95,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Do you want to EXIT ?", style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w700,
//                   color: AppColors.bgColor,
//                 ),
//                 ),
//                 const SizedBox(height: 19),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           exit(0);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.bgColor,
//                         ),
//                         child: Center(child: Text("yes", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700))),
//                       ),
//                     ),
//                     const SizedBox(width: 15),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context).pop(false);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                         ),
//                         child: Center(child: Text("No", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w700))),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class AdminMenuItem {
//   final String title;
//   final dynamic icon;
//   final Color color;
//   final double? height;
//   final double? width;
//
//   AdminMenuItem(this.title, this.icon, this.color, {this.height, this.width});
// }
// class AdminMenuItemWidget extends StatelessWidget {
//   final AdminMenuItem item;
//
//   const AdminMenuItemWidget(this.item, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: item.height ?? (item.title.length > 10 ? 180 : 150),
//       width: item.width ?? double.infinity,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             item.color.withOpacity(0.7),  // Example: Adjust opacity here (e.g., 0.7)
//             item.color.withOpacity(0.5),  // Example: Another opacity level (e.g., 0.5)
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: item.color.withOpacity(0.3),
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           item.icon is IconData
//               ? Icon(item.icon, size: 48, color: Colors.white)
//               : Image.asset(item.icon, height: 48, color: Colors.white),
//           SizedBox(height: 16),
//           Text(
//             item.title,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
// Widget halfContainerAdmin(double height, double width, BuildContext context) {
//   // Placeholder widget for the halfContainerAdmin
//   return Container(
//     height: height/2.75,
//     width: width,
//     decoration: BoxDecoration(
//         color: AppColors.bgColor,
//         borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
//     ),
//
//     child:Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 20,bottom: 10),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               InkWell(onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     backgroundColor: AppColors.btnColor,
//                     elevation: 20,
//                     content:  Text(
//                         "Do you want to Logout ?",style: TextStyle(
//                         fontSize:17,
//
//                         fontFamily:'ink nut',
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white)),
//                     actions: <Widget>[
//                       Row(
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               FirebaseAuth auth = FirebaseAuth.instance;
//                               auth.signOut();
//                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthScreen(from: "",),));
//                             },
//                             child: Container(
//                               height: 45,
//                               width: 90,
//                               decoration: BoxDecoration(
//                                   color:Colors.white ,
//                                   borderRadius: BorderRadius.circular(8),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Color(0x26000000),
//                                       blurRadius: 2.0, // soften the shadow
//                                       spreadRadius: 1.0, //extend the shadow
//                                     ),
//                                   ] ),
//                               child: Center(child:  Text("yes",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
//                             ),
//                           ),
//                           TextButton(
//                               onPressed: (){
//                                 Navigator.pop(context);                                  },
//                               child: Container(
//                                 height: 45,
//                                 width: 90,
//
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(8),
//                                   color: AppColors.bgColor,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Color(0x26000000),
//                                       blurRadius: 2.0, // soften the shadow
//                                       spreadRadius: 1.0, //extend the shadow
//                                     ),
//                                   ],
//                                 ),
//                                 child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
//                               ))
//                         ],
//                       )
//
//                     ],
//                   ),
//                 );
//               },
//                   child: Icon(Icons.logout_outlined,color: AppColors.btnColor,)),
//             ],
//           ),
//         ),
//         Center(
//           child: CircleAvatar(
//               radius: 50,
//               backgroundColor: AppColors.btnColor,
//               backgroundImage: AssetImage("assets/Rectangle.png")
//           ),
//         ),
//         SizedBox(height: 5,),
//         Text("Hello,Admin",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
//       ],
//     ),
//   );
// }



