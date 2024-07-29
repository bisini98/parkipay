import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class CategoryModel{
  String id;
  String name;
  String photo;
  CategoryModel(this.id,this.name,this.photo);
}
class VehicleModel{
  String id;
  String name;
  String photo;
  VehicleModel(this.id,this.name,this.photo);
}
class RegistrationModel {
  String id;
  String photo;
  String name;
  String phone;
  String status;

  RegistrationModel(this.id, this.name, this.phone, this.status, this.photo);
}
  class userModel{
  String id;
  String photo;
  String name;
  String phone;
  String status;
  userModel(this.id,this.name,this.phone,this.status,this.photo);

}

class RowColumnMainModel {
  String id;
  List<RowColumnCountModel> rowCountList;
  List<RowColumnCountModel> columnCountList;
  String floorName;
  final int floorNumber;
  String userBookName;
  RowColumnMainModel(this.id,this.floorName,this.rowCountList,this.columnCountList,this.floorNumber,this.userBookName);

}
class RowColumnCountModel {
  String name;
  int rowNumber;
  List<RowColumnFieldModel> fieldsList;
  String rowName;
  @override
  String toString() {
    return 'RowColumnCountModel{rowKey: $name, fieldsList: $fieldsList, rowNumber: $rowNumber}';
  }
  RowColumnCountModel(this.name,this.fieldsList,this.rowNumber,this.rowName);
}
class RowColumnFieldModel {
  String fieldName;
  int fieldNumber;
  dynamic fieldStatus;
  String columnName;
  String rowName;
  String mapId;

  RowColumnFieldModel(this.fieldName, this.fieldStatus, this.fieldNumber, this.columnName, this.rowName, this.mapId);

  @override
  String toString() {
    return 'RowColumnFieldModel{fieldName: $fieldName, fieldNumber: $fieldNumber, fieldStatus: $fieldStatus, columnName: $columnName, rowName: $rowName, mapId: $mapId}';
  }
}

class ticketslotModel{
  String id;
  String userId;
  String phone;
  String fieldName;
  String floorName;
  DateTime date;
  DateTime checkoutDate;
  String status;

  ticketslotModel(this.id,this.userId,this.phone,this.fieldName,this.floorName,this.date,this.checkoutDate,this.status);

}
class userticketslotModel{
  String id;
  String userId;
  String userName;
  String phone;
  String fieldName;
  String mapId;
  String mapType;
  String status;
  DateTime checkoutDate;


  userticketslotModel(this.id,this.userId,this.userName,this.phone,this.fieldName,this.mapId,this.mapType,this.status,this.checkoutDate,);

}
// class StaffModel{
//   String id;
//   String name;
//   String phone;
//   String storename;
//   String storenameid;
//   String photo;
//   StaffModel(this.id,this.name,this.phone,this.storename,this.storenameid,this.photo);
// }

class StaffModel {
  String id;
  String name;
  String phone;
  String storename;
  String storenameid;
  String photo;

  StaffModel(
      this.id,
      this.name,
      this.phone,
      this.storename,
      this.storenameid,
      this.photo
      );

  factory StaffModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return StaffModel(
      doc.id,
      data['name'] ?? '',
      data['phone'] ?? '',
      data['storename'] ?? '',
      data['storenameid'] ?? '',
      data['photo'] ?? '',
    );
  }
}


