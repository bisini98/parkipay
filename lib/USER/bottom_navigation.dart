
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkipay/USER/Vehicle_page.dart';
import 'package:parkipay/USER/continue_page.dart';
import 'package:parkipay/USER/home_screen.dart';
import 'package:parkipay/USER/payments.dart';
import 'package:parkipay/USER/profile_page.dart';
import 'package:parkipay/USER/ticket_page.dart';
import 'package:parkipay/constant/colors.dart';

class Bottombar extends StatefulWidget {
  Bottombar({super.key,});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int selectedIndex = 0;



  @override
  void _itemTapped(int index){
    setState(() {
      selectedIndex = index;

    });

  }


  @override
  Widget build(BuildContext context) {
    var pages = [
      VehiclePage(),
      Tickets(),
      PaymentSlip(),
      Profile()
    ];

    return Scaffold(
      body: pages[selectedIndex],

      extendBody: true,
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(20),
        child: DotNavigationBar(
          // enableFloatingNavBar: true,
          margin: EdgeInsets.zero,marginR: EdgeInsets.zero,paddingR: EdgeInsets.zero,
          // enableFloatingNavBar: true,
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
        padding: const EdgeInsets.only(top: 50),
        child: FloatingActionButton(backgroundColor: AppColors.bgColor,
          child: Image.asset("assets/Group 5.png"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Continue(),));
          },
        ),
      ),
    );
  }
}