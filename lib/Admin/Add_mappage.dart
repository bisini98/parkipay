import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Admin_Page.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/refactoring.dart';
import 'package:provider/provider.dart';

class AddMapPage extends StatelessWidget {
  final String storeId;
  const AddMapPage({super.key,required this.storeId});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Consumer<MainProvider>(
              builder: (context,value,child) {
                return Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Floor",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                      SizedBox(width: width/3),
                      SizedBox(
                        width:width/2.2,
                        height: height/20,
                        child: Consumer<MainProvider>(
                            builder: (context1, value2, child) {
                              return DropdownButton<String>(
                                underline: const SizedBox(),
                                borderRadius: BorderRadius.circular(20),
                                value: value2.dropdownValue,
                                isExpanded: true,
                                icon: const Padding(
                                  padding: EdgeInsets.only(right: 18.0),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 30,
                                  ),
                                ),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                ),
                                onChanged: (changeValue) {
                                  value2.floorlength(changeValue);
                                  print("${value2.dropdownValue}vhrfgry");
                                },
                                items: value2.floor
                                    .map<DropdownMenuItem<String>>(
                                        (String values) {
                                      return DropdownMenuItem<String>(
                                        value: values,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0, right: 15),
                                          child: Text(values),
                                        ),
                                      );
                                    }).toList(),
                              );
                            }),
                      ),
                      // rownumbertxtfrm(height, width/5.5, "3",value.Floorcontroller),
                      //     InkWell(
                      //       onTap:(){
                      //         value.addMap();
                      // },
                      //         child: fillbtn(width/3, height/12, AppColors.btnColor, "Save", Colors.white))
                    ],
                  ),
                );
              }
          ),
          Consumer<MainProvider>(
            builder: (context,value,child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Rows",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                  rownumbertxtfrm(height, width/5.5, "2",value.RowCountcontroller),
              //     InkWell(
              //       onTap:(){
              //         value.addMap();
              // },
              //         child: fillbtn(width/3, height/12, AppColors.btnColor, "Save", Colors.white))
                ],
              );
            }
          ),
          Consumer<MainProvider>(
            builder: (context,value,child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Fields",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                  rownumbertxtfrm(height, width/5.5, "4",value.RowFieldcontroller),
                  // InkWell(
                  //   onTap:(){
                  //     // value.AddRowSection();
                  //     // value.addMap();
                  //   },
                  //     child: fillbtn(width/3, height/12, AppColors.btnColor, "Save", Colors.white))
                ],
              );
            }
          ),
          Consumer<MainProvider>(
            builder: (context,value,child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Columns",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                  rownumbertxtfrm(height, width/5.5, "4",value.ColumnCountcontroller),
                  // fillbtn(width/3, height/12, AppColors.btnColor, "Save", Colors.white)
                ],
              );
            }
          ),
          Consumer<MainProvider>(
            builder: (context,value,child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Fields",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
                  rownumbertxtfrm(height, width/5.5, "4",value.ColumnFieldcontroller),
                  // fillbtn(width/3, height/12, AppColors.btnColor, "Save", Colors.white)
                ],
              );
            }
          ),
        Consumer<MainProvider>(
          builder: (context,value,child) {
            return GestureDetector(
              onTap: () {
                value.addMap(storeId,);
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage(),));
              },
                child: fillbtn(width/3, height/15, AppColors.AdminbtnColor, "Done", Colors.white));
          }
        )
        ],
      ),
    );
  }
}
