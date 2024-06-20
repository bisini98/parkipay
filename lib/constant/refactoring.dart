

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/AuthScreen.dart';
import 'package:provider/provider.dart';

import '../Admin/Admin_CustomerList.dart';
import 'LoginForm.dart';


//................Login Page Button.......
Widget loginForm(double wth,double ht,Color btn1color,String txt,IconData icon,TextEditingController controller,){
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: wth * 0.50,
    ),
    child: Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          // Container(
          //   width: wth,
          //   height: ht,
          //   decoration: BoxDecoration(
          //       color: AppColors.btnColor,
          //       borderRadius: BorderRadius.circular(10)
          //   ),
          //   child: Icon(icon),
          //
          // ),
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: txt
            ),
          ),
          SizedBox(height: ht,),
          Container(
            height: ht,
            width: wth*10,
            decoration: BoxDecoration(
              color: AppColors.btnColor,
            ),
            child: Center(child: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.w800),)),
          ),
          Spacer(flex: 2,),
        ],
      ),
    ),
  );
}
Widget signupForm(double wth,double ht,Color btn1color,String txt,IconData icon,TextEditingController controller,){
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: wth * 0.13
    ),
    child: Form(
        child: Column(
          children: [
            Spacer(),

          ],
        )
    ),
  );
}
Widget socialIcons(String image){
  return IconButton(
    onPressed: () {},
    icon: Image.asset(image,scale:4,),
  );
}
Widget personbutton(double wth,double ht,Color btn1color,String txt,IconData icon,TextEditingController controller){
  return Container(
      width: wth,
      height: ht,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: btn1color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2)
            )
          ]
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: ht,
            decoration: BoxDecoration(
                color: AppColors.btnColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(icon),

          ),
          Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: txt
              ),
            ),
          ))

        ],
      )
  );
}

//.............Fill button + Icon
Widget button1(double wth,double ht,Color btncolor,String txt,IconData icon){
  return Container(
    width: wth,
    height: ht,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
        color: btncolor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2)
          )
        ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(txt,style: TextStyle(fontWeight: FontWeight.bold,fontSize:15,),),
        SizedBox(width: 5,),
        Icon(icon,size: 25,),
      ],
    ),

  );
}

//..........Filled Button
Widget fillbtn(double wth,double ht,Color btncolor,String txt,Color color){
  return Container(
    width: wth,
    height: ht,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
        color: btncolor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2)
          )
        ]
    ),
    child: Center(child: Text(txt,style: TextStyle(color:color,fontWeight: FontWeight.bold,fontSize:15,),)),

  );
}
Widget fillbtnwithicon(double wth,double ht,Color btncolor,String txt,Color color){
  return Container(
    width: wth,
    height: ht,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
        color: btncolor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2)
          )
        ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(txt,style: TextStyle(color:color,fontWeight: FontWeight.bold,fontSize:15,),),
        Icon(Icons.edit_note_outlined,color: Colors.white,)
      ],
    ),


  );
}
Widget otpbox(double height,double width){
  return Padding(
      padding: const EdgeInsets.only(left: 25),
    child: Container(height: height,width: width,
      decoration: BoxDecoration(
        color: AppColors.otpColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
        style: TextStyle(color: Colors.white,fontSize: 25),
      ),
    ),
  );
}
Widget halfContainer(double height){
  return Container(
    height: height/2.75,
    decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
    ),
    child: Container(
      margin: EdgeInsets.only(left: 20,top: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Your Location",style: TextStyle(color: Colors.white),),
              Icon(Icons.arrow_drop_down,color: Colors.white,),
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on_outlined,size: 10,color: Colors.white,),
              Text("Near NH 213, Perintalmanna",style: TextStyle(color: Colors.white,fontSize: 8),)
            ],
          ),
          SizedBox(height: height/15,),
          Row(
            children: [
              Text("Find Your Parking \nSpace",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: height/20,),
          Row(
            children: [
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: AppColors.btn1Color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search_outlined,color: AppColors.iconColor,),
                    hintText: "Find Parking Area",
                      hintStyle:  TextStyle(color: AppColors.iconColor,fontSize: 15),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.btn1Color,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Icon(Icons.my_location_outlined),
              )
            ],
          )

        ],
      ),
    ),
  );
}
Widget halfContainer1(double height,double width){

  return Container(
    decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
    ),
    child: Container(width: width,
      margin: EdgeInsets.only(left: 20,top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.settings,color: Colors.white,),
              )
            ],
          ),
          SizedBox(height: height/7),
          Row(
            children: [
              Text("Hi",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 24),),
              SizedBox(width: 5,),
              Text("Praji,",style: TextStyle(color: Colors.white,fontSize: 24),),
            ],
          ),
          SizedBox(height: 5,),
          Text("I found a spot!",style: TextStyle(color: Colors.white,fontSize: 24),),
          SizedBox(height: height/20,),
        ],
      ),
    ),
  );
}

Widget quarterContainer(double height,double width, txt){

  return Container(
    height: height/5,
    width: width,
    decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
    ),
    child: Center(child: Text(txt,style: TextStyle(color: Colors.white),)),
  );
}
Widget quarterContainerWithIcon(double height,double width, txt){

  return Container(
    height: height/5,
    width: width,
    decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 15,),
          SizedBox(width: width/4,),
          Text(txt,style: TextStyle(color: Colors.white),),
        ],
      ),
    ),
  );
}

Widget numbertxtfrm(hyt,wdt,String text,) {
  return Container(
    height: hyt/16,
    width: wdt/1.10,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Color(0xff6E6B69),),
    ),
    child: TextFormField(
      // controller: controller,
      keyboardType: TextInputType.number,
      // showCursor: false,
      decoration: InputDecoration(border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(7)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        fillColor: Colors.white,
        filled: true,
        hintText: text,
        hintStyle: TextStyle(
            color: Color(0xffAB9B9B), fontSize: 10,),
      ),

    ),
  );
}
Widget rownumbertxtfrm(hyt,wdt,String text,TextEditingController controller) {
  return Container(
    height: hyt/16,
    width: wdt/1.10,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      border: Border.all(color: Color(0xff6E6B69),),
    ),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,

      decoration: InputDecoration(border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(7)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        fillColor: Colors.white,
        filled: true,
        hintText: text,
        hintStyle: TextStyle(
          color: Color(0xffAB9B9B), fontSize: 10,),
      ),

    ),
  );
}
Widget Adminnumfieldtxtfrm(hyt,wdt,String text) {
  return Container(
    height: hyt/16,
    width: wdt/1.10,
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xff6E6B69),),
    ),
    child: TextFormField(
      keyboardType: TextInputType.number,

      decoration: InputDecoration(border: OutlineInputBorder(
          borderSide: BorderSide.none,
          ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        fillColor: Colors.white,
        filled: true,
        hintText: text,
        hintStyle: TextStyle(
          color: Color(0xffAB9B9B), fontSize: 10,),
      ),

    ),
  );
}
Widget Adminnumbertxtfrm(hyt,wdt,String text,Color clr) {
  return Container(
    height: hyt/16,
    width: wdt/1.10,
    decoration: BoxDecoration(
      color: AppColors.AdminnumtxtcontainerColor,
      borderRadius: BorderRadius.circular(7),
      border: Border.all(color: Color(0xff6E6B69),),
    ),
    child: TextFormField(
      keyboardType: TextInputType.number,

      decoration: InputDecoration(border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(7)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        fillColor: Colors.white,
        filled: true,
        hintText: text,
        hintStyle: TextStyle(
          color: Colors.black, fontSize: 10,fontWeight: FontWeight.w600),
      ),

    ),
  );
}

Widget txtfrm(hyt,wdt,String text) {
  return Container(
    height: hyt/16,
    width: wdt/1.10,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      border: Border.all(color: Color(0xff6E6B69),),
    ),
    child: TextFormField(
      keyboardType: TextInputType.text,

      decoration: InputDecoration(border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(7)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        fillColor: Colors.white,
        filled: true,
        hintText: text,
        hintStyle: TextStyle(
          color: Color(0xffAB9B9B), fontSize: 10,),
      ),


    ),
  );
}
Widget admintxtfrm(hyt,wdt,String text,TextEditingController controller) {
  return Container(
    height: hyt/12,
    width: wdt/1.10,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      // border: Border.all(color: Color(0xff6E6B69),),
    ),
    child: TextFormField(

      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,

      decoration: InputDecoration(border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(7)),
        // contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        fillColor: AppColors.btnColor,
        filled: true,

        hintText: text,
        hintStyle: TextStyle(

          color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
      ),
      validator: (value) {
        if(value!.isEmpty){
          return "* this field is required";
        }else{}
      },
    ),
  );
}

Widget parkingslip (double height, double width){
  return Container(
    margin: EdgeInsets.only(bottom: 15),
    height: height/2.60,
    width: width/1.20,
    decoration: BoxDecoration(
        color: Colors.white
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          //margin: EdgeInsets.only(top: 20),
          height: height/10,
          width: height/10,
          decoration: BoxDecoration(
            color: AppColors.spotColor
          ),
          child: Center(child: Text("A2",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.w600,fontSize: 25),)),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.alarm,color: AppColors.bgColor,),
                  Text("11:10 AM",style: TextStyle(color: AppColors.bgColor)),
                  ]),
              VerticalDivider(
                color: AppColors.bgColor,
                width: 20,
                thickness: 1,
              ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Parking Details:",style: TextStyle(color: AppColors.bgColor),),
                      SizedBox(height: 5,),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Text("Floor 1",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
                            VerticalDivider(
                              color: AppColors.bgColor,
                              width: 20,
                              thickness: 2,
                            ),
                            Text("Lane A",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
                            VerticalDivider(
                              color: AppColors.bgColor,
                              width: 20,
                              thickness: 2,
                            ),
                            Text("Pos.2",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Free parking for first 30 mins, afterwards ₹8/hr",style: TextStyle(fontSize: 12,color: AppColors.bgColor),),
          ],
        ),
        InkWell(
          onTap: (){},
            child: Text("Pay at exit",style: TextStyle(fontWeight: FontWeight.w600,color: AppColors.bgColor),)
        )
      ],
    ),
  );
}

Widget adminparkingslip (double height, double width){
  return Container(
    margin: EdgeInsets.only(bottom: 15),
    height: height/2.60,
    width: width/1.20,
    decoration: BoxDecoration(
        color: Colors.white
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          //margin: EdgeInsets.only(top: 20),
          height: height/10,
          width: height/10,
          decoration: BoxDecoration(
              color: AppColors.spotColor
          ),
          child: Center(child: Text("Exact Place",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 10),)),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                  children: [
                    Icon(Icons.alarm,color: AppColors.bgColor,),
                    Text("Time",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 10),),
                  ]),
              VerticalDivider(
                color: AppColors.bgColor,
                width: 20,
                thickness: 1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Parking Details:",style: TextStyle(color: AppColors.bgColor),),
                  SizedBox(height: 5,),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Text("Floor",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 10),),
                        VerticalDivider(
                          color: AppColors.bgColor,
                          width: 20,
                          thickness: 2,
                        ),
                        Text("Lane",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 10),),
                        VerticalDivider(
                          color: AppColors.bgColor,
                          width: 20,
                          thickness: 2,
                        ),
                        Text("Position",style: TextStyle(color: Color(0xff8B8B8B),fontSize: 10),),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Free parking for first 30 mins, afterwards ₹8/hr",style: TextStyle(fontSize: 12,color: AppColors.bgColor),),
          ],
        ),
        InkWell(
            onTap: (){},
            child: Text("Pay at exit",style: TextStyle(fontWeight: FontWeight.w600,color: AppColors.bgColor),)
        )
      ],
    ),
  );
}
Widget paymentslip (double height, double width){
  return Container(
    height: height/6,
    color: AppColors.spotColor,
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.alarm,color: AppColors.bgColor,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("11:10 AM - 1:05 PM",style: TextStyle(color: AppColors.bgColor),),
              SizedBox(height: 5,),
              Text("2 Hours",style: TextStyle(fontWeight: FontWeight.w600,color: AppColors.bgColor),),
            ],
          ),
          VerticalDivider(
            color: AppColors.bgColor,
            indent: 10,
            endIndent: 10,
            width: 20,
            thickness: 1,
          ),
          Text("A2",style: TextStyle(fontWeight: FontWeight.w600,color: AppColors.bgColor,fontSize: 30),)
        ],
      ),
    ),
  );
}

Widget paymentHistory (double height, double width,String txt,Color color){
  return Container(
           height: height/3,
           color: Colors.white,
           child: Column(
             children: [
               Row(
                 children: [
                   Container(
                     height: height/10,
                     width: width/1.091,
                     color: AppColors.spotColor,
                     child: IntrinsicHeight(
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Icon(Icons.alarm,color: AppColors.bgColor,),

                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("11:10 AM - 1:05 PM",style: TextStyle(color: AppColors.bgColor),),
                               SizedBox(height: 5,),
                               Text("2 Hours",style: TextStyle(fontWeight: FontWeight.w600,color: AppColors.bgColor),),
                             ],
                           ),
                           VerticalDivider(
                             color: AppColors.bgColor,
                             indent: 10,
                             endIndent: 10,
                             width: 20,
                             thickness: 1,
                           ),
                           Text("A2",style: TextStyle(fontWeight: FontWeight.w600,color: AppColors.bgColor,fontSize: 30),)
                         ],
                       ),
                     ),
                   ),
                 ],
               ),
               SizedBox(height: height/60,),
               Text("Price Details",style: TextStyle(color: AppColors.bgColor,fontSize: 20),),
               Padding(
                 padding: const EdgeInsets.all(10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Hourly charge"),
                         SizedBox(height: 5,),
                         Text("Total Hours "),
                         SizedBox(height: height/40,),
                         Text("Total Amount",style: TextStyle(color: AppColors.bgColor,fontSize: 15))
                       ],
                     ),
                     Column(
                       children: [
                         Text("₹8.00"),
                         SizedBox(height: 5,),
                         Text("2"),
                         SizedBox(height: height/40,),
                         Text("₹16.00",style: TextStyle(color: AppColors.bgColor,fontSize: 15))
                       ],
                     ),
                   ],
                 ),
               ),
               Text(txt,style: TextStyle(color: color,fontSize: 20,fontWeight: FontWeight.w600),)
             ],
           ),

         );
}

//.............Admin Home Container

Widget AdminHomeContainerWithIcon(double height,double width,String admintext,IconData icon){
  return Container(
      height: height/4,
      width: width/3,
      decoration: BoxDecoration(
        color:AppColors.AdminContColor,
        borderRadius: BorderRadius.circular(5)
  ),
   child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,color: Colors.white,),
            SizedBox(height: 5,),
            Text(textAlign: TextAlign.center,admintext,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12,shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.7),
                offset: Offset(2,6),
                blurRadius: 10
                )
            ]),)
    ],),
  );
}
Widget AdminHomeContainerWithImg(double height,double width,String admintext,String img,double size){
  return Container(
    height: height/4,
    width: width/3,
    decoration: BoxDecoration(
        color:AppColors.AdminContColor,
        borderRadius: BorderRadius.circular(5)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(img,color: Colors.white,scale: size,),
        SizedBox(height: 5,),
        Text(textAlign: TextAlign.center,admintext,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12,shadows: [
          Shadow(
              color: Colors.black.withOpacity(0.7),
              offset: Offset(2,6),
              blurRadius: 10
          )
        ]),)
      ],),
  );
}

Widget halfContainerAdmin(double height, double wth,BuildContext context){
  return Container(
    height: height/2.75,
    width: wth,
    decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
    ),

        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20,bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: AppColors.btnColor,
                        elevation: 20,
                        content:  Text(
                            "Do you want to Logout ?",style: TextStyle(
                            fontSize:17,

                            fontFamily:'ink nut',
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                        actions: <Widget>[
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  FirebaseAuth auth = FirebaseAuth.instance;
                                  auth.signOut();
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthScreen(),));
                                },
                                child: Container(
                                  height: 45,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color:Colors.white ,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x26000000),
                                          blurRadius: 2.0, // soften the shadow
                                          spreadRadius: 1.0, //extend the shadow
                                        ),
                                      ] ),
                                  child: Center(child:  Text("yes",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                                ),
                              ),
                              TextButton(
                                  onPressed: (){
                                     Navigator.pop(context);                                  },
                                  child: Container(
                                    height: 45,
                                    width: 90,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.bgColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x26000000),
                                          blurRadius: 2.0, // soften the shadow
                                          spreadRadius: 1.0, //extend the shadow
                                        ),
                                      ],
                                    ),
                                    child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                                  ))
                            ],
                          )

                        ],
                      ),
                    );
                  },
                      child: Icon(Icons.logout_outlined,color: AppColors.btnColor,)),
                ],
              ),
            ),
            Center(
              child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.btnColor,
                  backgroundImage: AssetImage("assets/Rectangle.png")
              ),
            ),
            SizedBox(height: 5,),
            Text("Hello,Admin",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
          ],
        ),
  );
}
Widget halfContainerStaff(double height, double wth,BuildContext context){
  return Container(
    height: height/2.75,
    width: wth,
    decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
    ),

    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Padding(
          padding: const EdgeInsets.only(right: 20,bottom: 80),
          child: Row(
             // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: defaultPadding),
                child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.btnColor,
                    backgroundImage: AssetImage("assets/Rectangle.png")
                ),
              ),
              InkWell(onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: AppColors.btnColor,
                    elevation: 20,
                    content:  Text(
                        "Do you want to Logout ?",style: TextStyle(
                        fontSize:17,

                        fontFamily:'ink nut',
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                    actions: <Widget>[
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              FirebaseAuth auth = FirebaseAuth.instance;
                              auth.signOut();
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthScreen(),));
                            },
                            child: Container(
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                  color:Colors.white ,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x26000000),
                                      blurRadius: 2.0, // soften the shadow
                                      spreadRadius: 1.0, //extend the shadow
                                    ),
                                  ] ),
                              child: Center(child:  Text("yes",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                            ),
                          ),
                          TextButton(
                              onPressed: (){
                                Navigator.pop(context);                                  },
                              child: Container(
                                height: 45,
                                width: 90,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.bgColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x26000000),
                                      blurRadius: 2.0, // soften the shadow
                                      spreadRadius: 1.0, //extend the shadow
                                    ),
                                  ],
                                ),
                                child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                              ))
                        ],
                      )

                    ],
                  ),
                );
              },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding),
                    child: Icon(Icons.logout_outlined,color: AppColors.btnColor,),
                  )),
            ],
          ),
        ),

        SizedBox(height: 5,),
        Text("Hello,Staff",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
      ],
    ),
  );
}

Widget customerListcontainer(double height,double width){
  return Container(
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
              Text("Phone",style: TextStyle(color: Colors.white),),
              SizedBox(width: 5,),
              Text(":",style: TextStyle(color: Colors.white)),
              SizedBox(width: 10,),
              Text("9495432187",style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Vehicle Number",style: TextStyle(color: Colors.white),),
              SizedBox(width: 5,),
              Text(":",style: TextStyle(color: Colors.white)),
              SizedBox(width: 10,),
              Text("KL10L3331",style: TextStyle(color: Colors.white)),
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

  );
}

Widget paymentListcontainer(double height,double width,String txt1,Color color){
  return Container(
    height: height/5,
    width: width/1.22,
    decoration: BoxDecoration(
        color:AppColors.AdminpaymentcontainerColor,
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
              Text("Ram",style: TextStyle(color: Colors.white)),
            ],
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
              Text("9495432187",style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Payment Method",style: TextStyle(color: Colors.white),),
              SizedBox(width: 5,),
              Text(":",style: TextStyle(color: Colors.white)),
              SizedBox(width: 10,),
              Text("UPI",style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        SizedBox(height: height/40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(txt1,style: TextStyle(color: color,fontSize: 20,fontWeight: FontWeight.w600))
                ],
              )
            ],
          ),
        );

}

Widget addImgcontainer (double height,double width){
  return Container(
    height: height/4,
    width: width/2,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10)
    ),
    child: Icon(Icons.image_outlined,color: AppColors.AdminbtnColor,size: 80,),
  );
}
Widget addcontainer (double height,double width){
  return Container(
    height: height/4,
    width: width/2,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
    ),
    child: Center(
      child: CircleAvatar(
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: AppColors.bgColor,
      ),
    ),
  );
}
Widget mapSpotContainer(double height,double width){
  return Container(
    height: height/10,
    width: width,
    color: Colors.white,
    child: Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height/20,
          width: width/10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black)
          ),
          
        ),
        SizedBox(width: 5,),
        Text("Available",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
        SizedBox(width: 15,),
        Container(
          height: height/20,
          width: width/10,
          decoration: BoxDecoration(
              color: AppColors.FilledcontainerColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)
          ),

        ),
        SizedBox(width: 5,),
        Text("Filled",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold)),
        SizedBox(width: 15,),
        Container(
          height: height/20,
          width: width/10,
          decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)
          ),

        ),
        SizedBox(width: 5,),
        Text("Selected",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold)),
        //SizedBox(width: 15,),
      ],
    ),
  );
}

Widget mapListContainer (double height,double width,String text,Color myColor,){

  return Container(
    height: height/15,
    width: width/7,
    decoration: BoxDecoration(
      color: myColor,

      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: AppColors.bgColor)
    ),
    child: Center(child: Text(text,style: TextStyle(color: AppColors.bgColor,fontSize: 15,fontWeight: FontWeight.w600),)),
  );
}
Widget PlaceVisitedContainer(double height, double width,){
  return  SizedBox(
    height: height/2.05,
    width: width/1.10,
    child: ListView.builder(
      physics: ScrollPhysics(),
      itemCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          height: height/5,
          width: width/1.05,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: height/10,
                width: width/5,
                decoration: BoxDecoration(
                    color: AppColors.spotColor
                ),
                child: Center(child: Text("A2",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.w900),)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: height/20,
                    width: width/3.40,
                    decoration: BoxDecoration(
                      color: AppColors.btnColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text("Car Parking",style: TextStyle(color: Colors.white),)),
                  ),
                  //SizedBox(height: 10,),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Text("Floor 1",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
                        VerticalDivider(
                          color: AppColors.bgColor,
                          width: 20,
                          thickness: 2,
                        ),
                        Text("Lane A",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
                        VerticalDivider(
                          color: AppColors.bgColor,
                          width: 20,
                          thickness: 2,
                        ),
                        Text("Pos.2",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.alarm,color: AppColors.bgColor,),
                      SizedBox(width: 2,),
                      Text("2 Hours",style: TextStyle(fontWeight: FontWeight.w500),),
                      SizedBox(width: 10,),
                      Image.asset("assets/ri-car-fill.png",scale: 2,),
                      SizedBox(width: 2,),
                      Text("A2",style: TextStyle(fontWeight: FontWeight.w500,),),
                    ],
                  )

                ],
              )
            ],
          ),
        );
      },
    ),
  );
}
