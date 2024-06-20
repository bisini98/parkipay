import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/USER/payment_history.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/AuthScreen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/LoginForm.dart';
import '../constant/refactoring.dart';

class Profile extends StatelessWidget {
  String Signupphoto;
  String Profilename;
  String Profilephone;
  Profile({super.key,required this.Signupphoto,required this.Profilename,required this.Profilephone});



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: Column(
        children: [
          quarterContainer(height / 1, width, "Profile"),
          SizedBox(
            height: height / 20,
          ),
          Consumer<MainProvider>(
            builder: (context,value,child) {
              return CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  Signupphoto.toString()
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 80, top: 50),
                  height: 20,
                  width: 20,
                  color: Color(0xff6B4DE2),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              );
            }
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            Profilename.toString(),
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5,
          ),
          Text(Profilephone.toString()),
          SizedBox(
            height: height / 10,
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: AppColors.bgColor,
            ),
            title: Text(
              "Edit Profile",
              style: TextStyle(
                  color: AppColors.bgColor, fontWeight: FontWeight.normal),
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/payment.png",
              scale: 4,
              color: AppColors.bgColor,
            ),
            title: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentHistory(),
                      ));
                },
                child: Text(
                  "Payment History",
                  style: TextStyle(
                      color: AppColors.bgColor, fontWeight: FontWeight.normal),
                )),
          ),
          ListTile(
            leading: Icon(
              Icons.help_outline_sharp,
              color: AppColors.bgColor,
            ),
            title: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Center(
                        child: const Text("Help & Support",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "semibold",
                              color: Colors.white,
                            )),
                      ),
                      contentPadding: EdgeInsets.zero,
                      backgroundColor: AppColors.bgColor,
                      content: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: height / 4.8,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Consumer<MainProvider>(
                                  builder: (context, value, child) {
                                return InkWell(
                                  onTap: () {
                                    value.makingPhoneCall("+7907863998");
                                  },
                                  child: Container(
                                    height: height / 20.5,
                                    width: width / 1.5,
                                    decoration: BoxDecoration(
                                      color: AppColors.btnColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: Colors.blue,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "+91 7907863998",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: "semibold",
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                              SizedBox(
                                height: 15,
                              ),
                              Consumer<MainProvider>(
                                  builder: (context, value, child) {
                                return InkWell(
                                  onTap: () {
                                   value.launchWhatsApp(
                                      phoneNumber: '+7907863998', // Replace with the target phone number
                                      message: 'Hello, How can I help you?',
                                    );
                                  },
                                  child: Container(
                                    height: height / 20.5,
                                    width: width / 1.5,
                                    decoration: BoxDecoration(
                                      color: AppColors.btnColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/whatsapp.png",
                                          scale: 4,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "+91 7907863998",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: "semibold",
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Text(
                  "Help",
                  style: TextStyle(
                      color: AppColors.bgColor, fontWeight: FontWeight.normal),
                )),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: AppColors.btnColor,
                  elevation: 20,
                  content: Text("Do you want to Logout ?",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'ink nut',
                          fontWeight: FontWeight.w700,
                          color: AppColors.bgColor)),
                  actions: <Widget>[
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            FirebaseAuth auth = FirebaseAuth.instance;
                            auth.signOut();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AuthScreen(),
                                ));
                          },
                          child: Container(
                            height: 45,
                            width: 90,
                            decoration: BoxDecoration(
                              color: AppColors.btn1Color,
                              borderRadius: BorderRadius.circular(8),
                              // boxShadow: [
                              //   BoxShadow(
                              //     // color: Color(0x26000000),
                              //     blurRadius: 2.0, // soften the shadow
                              //     spreadRadius: 1.0, //extend the shadow
                              //   ),
                              // ]
                            ),
                            child: Center(
                                child: Text("yes",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700))),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.bgColor,
                                boxShadow: [
                                  BoxShadow(
                                    // color: Color(0x26000000),
                                    blurRadius: 2.0, // soften the shadow
                                    spreadRadius: 1.0, //extend the shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                  child: Text("No",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700))),
                            ))
                      ],
                    )
                  ],
                ),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: AppColors.btnColor,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                    color: AppColors.btnColor, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
