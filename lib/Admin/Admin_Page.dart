import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Admin_CustomerList.dart';
import 'package:parkipay/Admin/Admin_Home.dart';
import 'package:parkipay/Admin/Admin_ParkingSlip.dart';
import 'package:parkipay/Admin/Admin_Payments.dart';
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
    return Scaffold(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminParkingSlip(),));
                  },
                    child: AdminHomeContainerWithImg(height/1.40, width, "Parking Slips","assets/ri-ticket-2-line.png",4)),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPaymentList(),));
                  },
                    child: AdminHomeContainerWithImg(height/1.40, width, "Payments","assets/payment.png",4)),
              ],
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
    );
  }
}
