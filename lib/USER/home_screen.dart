import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/refactoring.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation.dart';

// class Home_screen extends StatelessWidget {
//   String photo;
//   String profileName;
//   String profilePhone;
//   String userId;
//   String storeWithFieald;
//
//
//    Home_screen({super.key,required this.photo,required this.profileName,required this.profilePhone,required this.userId,required this.storeWithFieald,});
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return WillPopScope(
//       onWillPop: () async{
//         showExitPopup(context);
//         return true;
//       },
//       child: Scaffold(
//         backgroundColor: AppColors.btn1Color,
//         body: SingleChildScrollView(
//           physics: NeverScrollableScrollPhysics(),
//           child: Column(
//             children: [
//             // halfContainer(height),
//             Container(
//             height: height/2.75,
//             decoration: BoxDecoration(
//                 color: AppColors.bgColor,
//                 borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
//             ),
//             child: Container(
//               margin: EdgeInsets.only(left: 20,top: 30),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text("Your Location",style: TextStyle(color: Colors.white),),
//                       Icon(Icons.arrow_drop_down,color: Colors.white,),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(Icons.location_on_outlined,size: 10,color: Colors.white,),
//                       Text("Near NH 213, Perintalmanna",style: TextStyle(color: Colors.white,fontSize: 8),)
//                     ],
//                   ),
//                   SizedBox(height: height/15,),
//                   Row(
//                     children: [
//                       Text("Find Your Parking \nSpace",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
//                     ],
//                   ),
//                   SizedBox(height: height/20,),
//                   Row(
//                     children: [
//                       Container(
//                         height: 50,
//                         width: 250,
//                         decoration: BoxDecoration(
//                           color: AppColors.btn1Color,
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             prefixIcon: Icon(Icons.search_outlined,color: AppColors.iconColor,),
//                             hintText: "Find Parking Area",
//                             hintStyle:  TextStyle(color: AppColors.iconColor,fontSize: 15),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 10,),
//                       Container(
//                         height: 50,
//                         width: 50,
//                         decoration: BoxDecoration(
//                             color: AppColors.btn1Color,
//                             borderRadius: BorderRadius.circular(15)
//                         ),
//                         child: Icon(Icons.my_location_outlined),
//                       )
//                     ],
//                   )
//
//                 ],
//               ),
//             ),
//           ),
//               //SizedBox(height: 10,),
//              SizedBox(
//                height: height,
//                child: Consumer<MainProvider>(
//                  builder: (context,value,child) {
//                    return GridView.builder(
//                      shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//                     padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
//                     itemCount: value.CategoryList.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 6,
//                       mainAxisExtent: height/3.5,
//                       crossAxisSpacing: 6,
//                       childAspectRatio: 1,
//                     ),
//                     itemBuilder: (BuildContext context, int index){
//                       return InkWell(onTap: () {
//                         print("helelee"+profileName);
//                         value.getMap(value.CategoryList[index].id);
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => Bottombar(categoryid: value.CategoryList[index].id,
//                           storeId:value.CategoryList[index].id ,Signupphoto:photo ,Profilename: profileName,
//                           Profilephone: profilePhone,userId: userId, storeWithFieald: storeWithFieald,
//                         ),));
//                       },
//                         child: Stack(
//                           children:[
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.grey,
//                                   borderRadius: BorderRadius.circular(10),
//                                   image: DecorationImage(
//                                     image: NetworkImage( value.CategoryList[index].photo),
//                                     fit: BoxFit.cover,
//                                   )
//                               ),
//                               ),
//                             Positioned(
//                               bottom: 0,
//                               child: Container(
//                                 height: height/15,
//                                 width: width/2.15,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                   color: Colors.black.withOpacity(0.65),
//                                 ),
//
//                                 alignment: Alignment.center,
//                                 child: Text( value.CategoryList[index].name,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),
//                               ),
//                             ),
//                           ]
//
//                         ),
//                       );
//                     }
//                    );
//                  }
//                ),
//              )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<bool> showExitPopup(BuildContext CONTXT) async {
//
//     return await showDialog(
//         context: CONTXT,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             backgroundColor: Colors.white,
//             content: SizedBox(
//               height: 95,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                       "Do you want to EXIT ?",style: TextStyle(
//                       fontSize:17,
//
//                       fontFamily:'ink nut',
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.bgColor)),
//                   const SizedBox(height: 19),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ElevatedButton(
//                             onPressed: () {
//                               exit(0);
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: AppColors.bgColor),
//                             child: Center(child:  Text("yes",style: TextStyle( color: Colors.white,fontSize: 17,fontWeight: FontWeight.w700)))
//                         ),
//                       ),
//                       const SizedBox(width: 15),
//                       Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.of(context).pop(false);
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white,
//                             ), child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
//
//                           ))
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }



class HomeScreen extends StatefulWidget {
  final String photo;
  final String profileName;
  final String profilePhone;
  final String userId;
  final String storeWithFieald;

  HomeScreen({
    Key? key,
    required this.photo,
    required this.profileName,
    required this.profilePhone,
    required this.userId,
    required this.storeWithFieald,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentLocation = "Near NH 213, Perintalmanna"; // Default location

  // Function to get the current location
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can access the position of the device.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentLocation = "${position.latitude}, ${position.longitude}";
    });
  }

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
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: height / 2.75,
                decoration: BoxDecoration(
                    color: AppColors.bgColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Container(
                  margin: EdgeInsets.only(left: 20, top: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Your Location",
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 10,
                            color: Colors.white,
                          ),
                          Text(
                            _currentLocation,
                            style: TextStyle(
                                color: Colors.white, fontSize: 8),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height / 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Find Your Parking \nSpace",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 20,
                      ),
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
                                prefixIcon: Icon(
                                  Icons.search_outlined,
                                  color: AppColors.iconColor,
                                ),
                                hintText: "Find Parking Area",
                                hintStyle: TextStyle(
                                    color: AppColors.iconColor, fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: _getCurrentLocation,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: AppColors.btn1Color,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(Icons.my_location_outlined),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height,
                child: Consumer<MainProvider>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      itemCount: value.CategoryList.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 6,
                        mainAxisExtent: height / 3.5,
                        crossAxisSpacing: 6,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            print("helelee" + widget.profileName);
                            value.getMap(value.CategoryList[index].id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bottombar(
                                  categoryid: value.CategoryList[index].id,
                                  storeId: value.CategoryList[index].id,
                                  Signupphoto: widget.photo,
                                  Profilename: widget.profileName,
                                  Profilephone: widget.profilePhone,
                                  userId: widget.userId,
                                  storeWithFieald: widget.storeWithFieald,
                                ),
                              ),
                            );
                          },
                          child: Stack(children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        value.CategoryList[index].photo),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: height / 15,
                                width: width / 2.15,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  color: Colors.black.withOpacity(0.65),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  value.CategoryList[index].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ]),
                        );
                      },
                    );
                  },
                ),
              )
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
                  Text("Do you want to EXIT?",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'ink nut',
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
                            child: Center(
                                child: Text("Yes",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700)))),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
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
            ),
          );
        });
  }
}
