import 'package:flutter/material.dart';

import '../Model/ModelClass.dart';
import '../constant/refactoring.dart';


class FloorDetails extends StatelessWidget {
  final RowColumnMainModel mainItem;
  final Color floorColor;

  const FloorDetails({Key? key, required this.mainItem, required this.floorColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: floorColor.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FLOOR ${mainItem.floorName}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ListView.builder(
              itemCount: mainItem.rowCountList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemBuilder: (context, rowIndex) {
                RowColumnCountModel countItem = mainItem.rowCountList[rowIndex];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 1.11,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: ScrollPhysics(),
                              itemCount: countItem.fieldsList.length,
                              itemBuilder: (context, fieldIndex) {
                                RowColumnFieldModel fieldModel = countItem.fieldsList[fieldIndex];
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                                  child: mapListContainer(
                                    MediaQuery.of(context).size.height,
                                    MediaQuery.of(context).size.width,
                                    fieldModel.fieldName.toString(),
                                    Colors.white,
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
              }
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: mainItem.columnCountList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: ScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemBuilder: (context, columnIndex) {
                RowColumnCountModel countItem = mainItem.columnCountList[columnIndex];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.05,
                        width: MediaQuery.of(context).size.width / 5,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: ScrollPhysics(),
                          itemCount: countItem.fieldsList.length,
                          itemBuilder: (context, fieldIndex) {
                            RowColumnFieldModel fieldModel = countItem.fieldsList[fieldIndex];
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                              child: mapListContainer(
                                MediaQuery.of(context).size.height,
                                MediaQuery.of(context).size.width,
                                fieldModel.fieldName.toString(),
                                Colors.white,
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
  }
}