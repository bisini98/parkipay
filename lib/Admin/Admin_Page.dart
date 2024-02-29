import 'package:flutter/material.dart';
import 'package:parkipay/Admin/login_requests.dart';
import 'package:parkipay/constant/colors.dart';
import 'package:parkipay/constant/refactoring.dart';

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
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
          halfContainerAdmin(height,width),
            SizedBox(height: height/20,),
        SizedBox(
          height: height,
          child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                childAspectRatio: 1,

              ),
              itemBuilder: (BuildContext context, int index){
                return Container(
                  height: height/4,
                  width: width/4,
                  decoration: BoxDecoration(
                      color:AppColors.AdminContColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icons[index],
                      SizedBox(height: 5,),
                      Text(text[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12,shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.7),
                          offset: Offset(2,6),
                          blurRadius: 10
                        )
                      ]),)
                    ],
                  ),
                );
              }
          ),
        ),
        ],
        ),
      ),
    );
  }
}
