import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Model/ModelClass.dart';
import '../Provider/MainProvider.dart';
import '../constant/AppConstants.dart';
import '../constant/refactoring.dart';
import 'Add_mappage.dart';
import 'Floor_details.dart';

// class ShowMapAdmin extends StatelessWidget {
//   String storeId;
//   ShowMapAdmin({super.key, required this.storeId});
//
//   @override
//   Widget build(BuildContext context) {
//     print("fgfg" + storeId);
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     MainProvider mainprovider = Provider.of<MainProvider>(context, listen: false);
//
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       mainprovider.getMap(storeId);
//     });
//     return Scaffold(
//       backgroundColor: AppColors.btn1Color,
//       floatingActionButton:
//           Consumer<MainProvider>(builder: (context, value, child) {
//         return FloatingActionButton(
//           backgroundColor: AppColors.bgColor,
//           onPressed: () {
//             value.clearMap();
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => AddMapPage(
//                     storeId: storeId,
//                   ),
//                 ));
//           },
//           child: Icon(
//             Icons.add,
//             color: Colors.white,
//           ),
//         );
//       }),
//       appBar: AppBar(
//         toolbarHeight: 100,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(12),
//                 bottomRight: Radius.circular(12))),
//         backgroundColor: AppColors.bgColor,
//         leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(
//               Icons.arrow_back_ios_rounded,
//               color: Colors.white,
//               size: 20,
//             )),
//         centerTitle: true,
//         title: Text(
//           "Map",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             mapSpotContainer(height, width),
//             Container(
//               height: 50,
//               width: 100,
//               color: Colors.blue,
//             ),
//             Consumer<MainProvider>(
//               builder: (context, value, child) {
//                 return ListView.builder(
//                   itemCount: value.mapRowMainList.length,
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   physics: ScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     print("jjmm" + value.mapRowMainList.length.toString());
//                     RowColumnMainModel mainItem = value.mapRowMainList[index];
//                     Color floorColor =
//                         Colors.primaries[index % Colors.primaries.length];
//                     return Container(
//                       color: floorColor.withOpacity(0.2),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             'FLOOR ${mainItem.floorName}',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                           ListView.builder(
//                               itemCount: mainItem.rowCountList.length,
//                               shrinkWrap: true,
//                               scrollDirection: Axis.vertical,
//                               physics: ScrollPhysics(),
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 10),
//                               itemBuilder: (context, index) {
//                                 RowColumnCountModel countItem =
//                                     mainItem.rowCountList[index];
//                                 return Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           SizedBox(
//                                             height: height / 10,
//                                             width: width / 1.11,
//                                             child: ListView.builder(
//                                               shrinkWrap: true,
//                                               scrollDirection: Axis.horizontal,
//                                               physics: ScrollPhysics(),
//                                               itemCount:
//                                                   countItem.fieldsList.length,
//                                               itemBuilder:
//                                                   (context, fieldIndex) {
//                                                 print("hi" +
//                                                     countItem.fieldsList.length
//                                                         .toString());
//                                                 RowColumnFieldModel fieldModel =
//                                                     countItem
//                                                         .fieldsList[fieldIndex];
//                                                 return Padding(
//                                                   padding: EdgeInsets.symmetric(
//                                                       vertical: 8,
//                                                       horizontal: 2),
//                                                   child: mapListContainer(
//                                                       height,
//                                                       width,
//                                                       fieldModel.fieldName
//                                                           .toString(),
//                                                       Colors.white),
//                                                 );
//                                               },
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               }),
//                           SizedBox(
//                             height: height / 1,
//                             width: width,
//                             child: ListView.builder(
//                               itemCount: mainItem.columnCountList.length,
//                               shrinkWrap: true,
//                               scrollDirection: Axis
//                                   .horizontal, // Change scroll direction to horizontal
//                               physics: ScrollPhysics(),
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 10),
//                               itemBuilder: (context, index) {
//                                 RowColumnCountModel countItem =
//                                     mainItem.columnCountList[index];
//                                 return Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     // Change Row to Column
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       SizedBox(
//                                         height: height / 1.05, // Adjust height
//                                         width: width / 5, // Adjust width
//                                         child: ListView.builder(
//                                           shrinkWrap: true,
//                                           scrollDirection: Axis
//                                               .vertical, // Change scroll direction to vertical
//                                           physics: ScrollPhysics(),
//                                           itemCount:
//                                               countItem.fieldsList.length,
//                                           itemBuilder: (context, fieldIndex) {
//                                             RowColumnFieldModel fieldModel =
//                                                 countItem
//                                                     .fieldsList[fieldIndex];
//                                             return Padding(
//                                               padding: EdgeInsets.symmetric(
//                                                   vertical: 8, horizontal: 2),
//                                               child: mapListContainer(
//                                                   height,
//                                                   width,
//                                                   fieldModel.fieldName
//                                                       .toString(),
//                                                   Colors.white),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               },
//                             ),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }

class ShowMapAdmin extends StatefulWidget {
  final String storeId;
  const ShowMapAdmin({Key? key, required this.storeId}) : super(key: key);

  @override
  _ShowMapAdminState createState() => _ShowMapAdminState();
}

class _ShowMapAdminState extends State<ShowMapAdmin> {
  int selectedFloorIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MainProvider>(context, listen: false).getMap(widget.storeId);
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
      floatingActionButton: Consumer<MainProvider>(builder: (context, value, child) {
        return FloatingActionButton(
          backgroundColor: AppColors.bgColor,
          onPressed: () {
            value.clearMap();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddMapPage(
                  storeId: widget.storeId,
                ),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        );
      }),
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
                        'FLOOR ${mainItem.floorName}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                        itemCount: mainItem.rowCountList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
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
                                    Flexible(
                                      child: SizedBox(
                                        height: height / 10,
                                        width: width,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          physics: ScrollPhysics(),
                                          itemCount: countItem.fieldsList.length,
                                          itemBuilder: (context, fieldIndex) {
                                            RowColumnFieldModel fieldModel = countItem.fieldsList[fieldIndex];
                                            return Padding(
                                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                                              child: Container(
                                                height: height/15,
                                                width: width/7,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                      
                                                    borderRadius: BorderRadius.circular(5),
                                                    border: Border.all(color: AppColors.bgColor)
                                                ),
                                                child: Center(child: Text(fieldModel.fieldName.toString(),style: TextStyle(color: AppColors.bgColor,fontSize: 15,fontWeight: FontWeight.w600),)),
                                              )
                                            );
                                          },
                                        ),
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
                                  Flexible(
                                    child: SizedBox(
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
                                            child:Container(
                                              height: height/15,
                                              width: width/7,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                    
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: AppColors.bgColor)
                                              ),
                                              child: Center(child: Text(fieldModel.fieldName.toString(),style: TextStyle(color: AppColors.bgColor,fontSize: 15,fontWeight: FontWeight.w600),)),
                                            ),
                                          );
                                        },
                                      ),
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