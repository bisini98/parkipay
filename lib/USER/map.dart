import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parkipay/USER/parking_slip.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/refactoring.dart';
import 'package:provider/provider.dart';

import '../Model/ModelClass.dart';
import '../Provider/MainProvider.dart';

class MapPage extends StatefulWidget {

  final String storeId;
  String userId;
  String registerphoneNumber;

  MapPage({Key? key, required this.storeId,required this.userId,required this.registerphoneNumber,}) : super(key: key);

  @override
  _ShowMapAdminState createState() => _ShowMapAdminState();
}

class _ShowMapAdminState extends State<MapPage> {
  int selectedFloorIndex = 0;
  String floorMapId = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MainProvider>(context, listen: false).getMap(widget.storeId);
      var mapList = Provider.of<MainProvider>(context, listen: false).mapRowMainList;
      if (mapList.isNotEmpty) {
        floorMapId = mapList[0].id;
      } else {
        // Handle the case where mapList is empty
        // You can show an error message or set a default value for floorMapId
        print("Map list is empty!");
      }
      // floorMapId = Provider.of<MainProvider>(context, listen: false).mapRowMainList[0].id;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Store ID: ${widget.storeId}");
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    MainProvider mainprovider = Provider.of<MainProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.btn1Color,

      appBar: AppBar(
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        backgroundColor: AppColors.bgColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Map",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            mapSpotContainer(height, width),
            Container(
              height: height/12,
              width: width,
              color: AppColors.spotColor,
              child: Consumer<MainProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.mapRowMainList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFloorIndex = index;
                            floorMapId = value.mapRowMainList[index].id;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          color: selectedFloorIndex == index
                              ? Colors.primaries[selectedFloorIndex % Colors.primaries.length]
                              : AppColors.navigationColor,
                          child: Center(
                            child: Text(
                              'FLOOR ${value.mapRowMainList[index].floorName}',
                              style: TextStyle(color:Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Consumer<MainProvider>(
              builder: (context, value, child) {
                if (value.mapRowMainList.isEmpty) {
                  return Center(child: Text("No data available"));
                }
                RowColumnMainModel mainItem = value.mapRowMainList[selectedFloorIndex];
                Color floorColor = Colors.primaries[selectedFloorIndex % Colors.primaries.length];
                return Container(
                  color: floorColor.withOpacity(0.2),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'FLOOR ${mainItem?.floorName ?? 'Unknown'}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                        itemCount: mainItem.rowCountList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        itemBuilder: (context, index) {
                          RowColumnCountModel countItem = mainItem.rowCountList[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: height / 10,
                                      width: width / 1.11,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics: ScrollPhysics(),
                                        itemCount: countItem.fieldsList.length,
                                        itemBuilder: (context, fieldIndex) {
                                          RowColumnFieldModel fieldModel = countItem.fieldsList[fieldIndex];
                                          return Padding(
                                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                                            child: GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) => AlertDialog(
                                                    backgroundColor: AppColors.btnColor,
                                                    elevation: 20,
                                                    content: Text("Do you want to select ?",
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
                                                              // print("ndjdfjdfjfj"+);
                                                              print("hiij"+widget.storeId);
                                                              print("hello"+fieldModel.columnName);
                                                              print("vsssm"+fieldModel.fieldName);

                                                              value.ticketSlot(fieldModel.mapId,widget.userId, widget.registerphoneNumber, fieldModel.fieldName,mainItem.floorName);

                                                              // value.updateMap(fieldModel.mapId, widget.storeId, fieldModel.rowName,fieldModel.fieldName,"FILLED",);
                                                              // value.updateMap(fieldModel.mapId,'Row',fieldModel.fieldName,countItem.name);
                                                              setState(() {
                                                                print("dsmhgfhs");


                                                                if (fieldModel.fieldStatus == 'VACANT') {
                                                                  fieldModel.fieldStatus = 'SELECTED';
                                                                } else if (fieldModel.fieldStatus == 'SELECTED') {
                                                                  fieldModel.fieldStatus = 'VACANT';
                                                                }

                                                              });
                                                              Navigator.pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) => ParkingSlip(storeId: widget.storeId,userId: widget.userId,registerphoneNumber: widget.registerphoneNumber,fieldName: fieldModel.fieldName,floorName: mainItem?.floorName ?? 'Unknown',),
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

                                                // value.updateMap(floorMapId, widget.storeId,
                                                //     fieldModel.rowcolumnName,fieldModel.fieldName,"FILLED");
                                              },
                                              child: mapListContainer(
                                                height,
                                                width,
                                                fieldModel.fieldName.toString(),
                                                fieldModel.fieldStatus == 'FILLED' ? AppColors.FilledcontainerColor : Colors.white,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: height / 1,
                        width: width,
                        child: ListView.builder(
                          itemCount: mainItem.columnCountList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: ScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          itemBuilder: (context, index) {
                            RowColumnCountModel countItem = mainItem.columnCountList[index];

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height / 1.05,
                                    width: width / 5,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: countItem.fieldsList.length,
                                      itemBuilder: (context, fieldIndex) {

                                        RowColumnFieldModel fieldModel = countItem.fieldsList[fieldIndex];
                                        return Padding(
                                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                                          child: GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) => AlertDialog(
                                                  backgroundColor: AppColors.btnColor,
                                                  elevation: 20,
                                                  content: Text("Do you want to select ?",
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
                                                            print("ndjdfjdfjfj"+fieldModel.mapId);
                                                            print("hiij"+widget.storeId);
                                                            print("hello"+fieldModel.columnName);
                                                            print("vsssm"+fieldModel.fieldName);

                                                            value.ticketSlot(fieldModel.mapId,widget.userId, widget.registerphoneNumber, fieldModel.fieldName,mainItem.floorName);
                                                            value.updateMap(fieldModel.mapId, widget.storeId, fieldModel.columnName,fieldModel.fieldName,"FILLED");

                                                            // value.updateMap(fieldModel.mapId,'COLUMN',fieldModel.fieldName,countItem.name);

                                                            setState(() {
                                                              print("dsmhgfhs");


                                                              if (fieldModel.fieldStatus == 'VACANT') {
                                                                fieldModel.fieldStatus = 'SELECTED';
                                                              } else if (fieldModel.fieldStatus == 'SELECTED') {
                                                                fieldModel.fieldStatus = 'VACANT';
                                                              }

                                                            });
                                                            Navigator.pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => ParkingSlip(storeId: widget.storeId,userId: widget.userId,registerphoneNumber: widget.registerphoneNumber,fieldName: fieldModel.fieldName,floorName: mainItem?.floorName ?? 'Unknown',),
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
                                            child: mapListContainer(
                                              height,
                                              width,
                                              fieldModel.fieldName.toString(),
                                              fieldModel.fieldStatus == 'FILLED' ? AppColors.FilledcontainerColor : Colors.white,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
