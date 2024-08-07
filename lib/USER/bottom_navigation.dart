


import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/USER/Vehicle_page.dart';
import 'package:parkipay/USER/continue_page.dart';
import 'package:parkipay/USER/payments.dart';
import 'package:parkipay/USER/profile_page.dart';
import 'package:parkipay/USER/ticket_page.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:provider/provider.dart';


class Bottombar extends StatefulWidget {
  String categoryid;
  String storeId;
  String Signupphoto;
  String Profilename;
  String Profilephone;
  String userId;
  String storeWithFieald;


  Bottombar({super.key,required this.categoryid,required this.storeId,required this.Signupphoto,required this.Profilename,required this.Profilephone,required this.userId,required this.storeWithFieald,});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {

  int selectedIndex = 0;



  @override
  void _itemTapped(int index){
    setState(() {

      selectedIndex = index;
      if(selectedIndex==0){

      }

    });

  }


  @override
  Widget build(BuildContext context) {
    print("dcdcdcdcdcdcd"+widget.Profilename);
    var pages = [
      VehiclePage(categoryid:  widget.categoryid,storeId: widget.storeId,Signupphoto: widget.Signupphoto,Profilename: widget.Profilename,userId: widget.userId,registerphoneNumber: widget.Profilephone, storeWithFieald:widget.storeWithFieald,),
      Consumer<MainProvider>(
        builder: (context,value,child) {
          value.getticketslot(widget.userId);
          return Tickets();
        }
      ),
      PaymentSlip(checkinDate: DateTime.now(),checkoutDate: null,fieldName: ""),
      Profile(userId:widget.userId,Signupphoto: widget.Signupphoto,Profilename: widget.Profilename,Profilephone: widget.Profilephone, storeWithFieald: widget.storeWithFieald,),
    ];

    return Scaffold(
      body: pages[selectedIndex],

      extendBody: true,
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: DotNavigationBar(
           enableFloatingNavBar: true,
          margin: EdgeInsets.zero,marginR: EdgeInsets.zero,paddingR: EdgeInsets.zero,
          selectedItemColor: AppColors.bgColor,
          unselectedItemColor: Colors.white,
          backgroundColor: AppColors.navigationColor,
          currentIndex: selectedIndex,

          onTap: _itemTapped,
          items: [
            DotNavigationBarItem(
              icon: Icon(Icons.home),
            ),
            DotNavigationBarItem(
              icon: Image.asset("assets/ri-ticket-2-line.png",scale: 4.5,),

            ),
            DotNavigationBarItem(
              icon: Image.asset("assets/payment.png",scale: 4.5,),
            ),
            DotNavigationBarItem(
              icon: Icon(Icons.person_outline),

            ),
          ],

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: FloatingActionButton(shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: AppColors.bgColor,
          child: Image.asset("assets/Group 6.png",),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Continue(storeId: widget.categoryid,userId: widget.userId,registerphoneNumber: widget.Profilephone,signupPhoto: widget.Signupphoto,profileName: widget.Profilename,storeWithField: widget.storeWithFieald,categoryId: widget.categoryid,),));
          },
        ),
      ),
    );
  }
}