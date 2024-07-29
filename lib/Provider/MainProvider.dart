import 'dart:async';
import 'dart:collection';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import '../Model/ModelClass.dart';
import '../Model/ticket_model.dart';
import '../STAFF/userStatus.dart';
import '../USER/home_screen.dart';
import '../USER/profile_page.dart';

class MainProvider with ChangeNotifier{
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Reference ref = FirebaseStorage.instance.ref("IMAGEURL");



  File? homeScreenFileImg =null;
  String Image='';
  TextEditingController namecontroller= TextEditingController();
  bool homescreenLoader=false;
  Future<void> addcategory(String from, String oldid) async{
    homescreenLoader=true;
    notifyListeners();
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, dynamic>map = HashMap();

    map["CATEGORY_NAME"] = namecontroller.text;

    if(from=="NEW"){
      map["CATEGORY_ID"] = id;
    }

    if (homeScreenFileImg!= null) {
      print("dxdc");

      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(homeScreenFileImg! ).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['PHOTO'] = Image;
      // editMap['IMAGE_URL'] = imageUrl;
    }


    if(from == "EDIT"){
      db.collection("CATEGORY").doc(oldid).update(map);
    }else{
      db.collection("CATEGORY").doc(id).set(map);
    }
    homescreenLoader=false;
    notifyListeners();
    getCategory();
    notifyListeners();
  }

  Future getImggallery() async {
    print("cdc");

    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImgcamera() async {
    print("ffvjrvn");
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      homeScreenFileImg = File(croppedFile.path);
      print(homeScreenFileImg.toString() + "fofiifi");
      notifyListeners();
    }
  }
  void categoryclear() {
    namecontroller.clear();
    homeScreenFileImg = null;
    Image = "";
  }

  bool gethomescreenLoader=false;

  List<CategoryModel>CategoryList=[
  ];
  void getCategory(){
    gethomescreenLoader=true;
    notifyListeners();
    db.collection("CATEGORY").get().then((value){
      if(value.docs.isNotEmpty){
        gethomescreenLoader=false;
        notifyListeners();
        CategoryList.clear();
        for(var element in value.docs){
          CategoryList.add(CategoryModel(element.id, element.get("CATEGORY_NAME").toString(), element.get("PHOTO").toString()));
          notifyListeners();
        }
      }
     notifyListeners();
    });
  }
  File?  VehicleFileImg =null;
  String VehicleImage='';
  TextEditingController Vnamecontroller= TextEditingController();
  bool vehicleLoader=false;
  Future<void> AddVehicle(String from,String oldid) async{
    vehicleLoader=true;
    notifyListeners();
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, dynamic>map = HashMap();

    map["VEHICLE_NAME"] = Vnamecontroller.text;
    if(from=="NEW"){
      map["VEHICLE_ID"] = id;
    }

    if (VehicleFileImg!= null) {
      print("dxdc");

      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(VehicleFileImg! ).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["VEHICLE_PHOTO"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['VEHICLE_PHOTO'] = VehicleImage;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    if(from == "EDIT"){
      db.collection("VEHICLE").doc(oldid).update(map);
    }else{
      db.collection("VEHICLE").doc(id).set(map);
    }
    vehicleLoader=false;
    notifyListeners();
    getVehicle();
    notifyListeners();
  }
  Future getVehicleImggallery() async {
    print("cdc");

    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropVImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getVehicleImgcamera() async {
    print("ffvjrvn");
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropVImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropVImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      VehicleFileImg = File(croppedFile.path);
      print(VehicleFileImg.toString() + "fofiifi");
      notifyListeners();
    }
  }
  void Vehicleclear() {
    Vnamecontroller.clear();
    VehicleFileImg = null;
    VehicleImage = "";
  }
  bool getvehicleLoader=false;
  List<VehicleModel>VehicleList=[
  ];
  void getVehicle(){
    getvehicleLoader=true;
    notifyListeners();
    db.collection("VEHICLE").get().then((value){
      if(value.docs.isNotEmpty){
        getvehicleLoader=false;
        notifyListeners();
        VehicleList.clear();
        for(var element in value.docs){
          // HashMap<String, dynamic>map = HashMap();
          // VehicleList.add(VehicleModel(
          //   map["VEHICLE_ID"].toString(),
          //   map["VEHICLE_PHOTO"].toString(),
          //   map["VEHICLE_NAME"].toString()
          // ));
          VehicleList.add(VehicleModel(element.id, element.get("VEHICLE_NAME").toString(), element.get("VEHICLE_PHOTO").toString()));
          notifyListeners();
        }
      }
    });
    notifyListeners();
  }


  File?  staffFileImg =null;
  String staffImage='';

  TextEditingController staffregisternameController = TextEditingController();
  TextEditingController staffregisterphoneController = TextEditingController();
  TextEditingController storecategoryController = TextEditingController();

  String selectedstoreCategory='';
  bool staffLoader=false;

  Future<void> addStaff(String from, String oldid) async {
    staffLoader=true;
    notifyListeners();
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    Map<String, dynamic> staffmap = {
      "STAFF_NAME": staffregisternameController.text,
      "STAFF_PHONE": staffregisterphoneController.text,
      "STORE": storecategoryController.text,
      "STORE_ID": selectedstoreCategory
    };

    Map<String, dynamic> usermap = {
      "USER_NAME": staffregisternameController.text,
      "PHONE_NUMBER": "+91${staffregisterphoneController.text}",
      "TYPE": "STAFF"
    };

    if (from == "NEW") {
      staffmap["STAFF_ID"] = id;
      usermap["USER_ID"] = id;
    } else {
      id = oldid;
    }

    if (staffFileImg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(staffFileImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          staffmap["STAFF_PHOTO"] = value;
        });
      });
    } else {
      staffmap['STAFF_PHOTO'] = staffImage;
    }

    try {
      if (from == "EDIT") {
        DocumentSnapshot staffDoc = await db.collection("STAFF").doc(oldid).get();
        DocumentSnapshot userDoc = await db.collection("USERS").doc(oldid).get();

        if (staffDoc.exists) {
          await db.collection("STAFF").doc(oldid).update(staffmap);
        } else {
          throw Exception("Staff document not found");
        }

        if (userDoc.exists) {
          await db.collection("USERS").doc(oldid).update(usermap);
        } else {
          throw Exception("User document not found");
        }
      } else {
        await db.collection("STAFF").doc(id).set(staffmap);
        await db.collection("USERS").doc(id).set(usermap);
      }
    } catch (e) {
      print("Error updating document: $e");
    }
    staffLoader=false;
    notifyListeners();
    getStaff();
    notifyListeners();
  }




  Future getStaffImggallery() async {
    print("cdc");

    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropStaffImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }
  Future getStaffImgcamera() async {
    print("ffvjrvn");
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropStaffImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }
  Future<void> cropStaffImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      staffFileImg = File(croppedFile.path);
      print(staffFileImg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  bool getstaffLoader=false;
  List<StaffModel>StaffList=[];

  Future<void> getStaff() async {
    try {
      getstaffLoader = true;
      notifyListeners();

      // Fetch the staff data
      QuerySnapshot snapshot = await db.collection("STAFF").get();

      if (snapshot.docs.isNotEmpty) {
        StaffList.clear();
        for (var element in snapshot.docs) {
          StaffList.add(StaffModel(
            element.id,
            element.get("STAFF_NAME").toString(),
            element.get("STAFF_PHONE").toString(),
            element.get("STORE").toString(),
            element.get("STORE_ID").toString(),
            element.get("STAFF_PHOTO").toString(),
          ));
        }
      }

      getstaffLoader = false;
    } catch (e) {
      print("Error fetching staff: $e");
    } finally {
      notifyListeners();
    }
  }

  Future<void> DeleteStaff(String id, BuildContext context) async {
    try {
      // Attempt to delete the document from the STAFF collection
      await db.collection("STAFF").doc(id).delete();
      print("Deleted from STAFF collection");

      // Attempt to delete the document from the USERS collection
      await db.collection("USERS").doc(id).delete();
      print("Deleted from USERS collection");

      // Show a success message
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Deleted Successfully"),
              backgroundColor: Colors.red,
            ),
          );
        }
      });

      // Fetch updated staff list
      await getStaff(); // Await here since getStaff() is now asynchronous
    } catch (e) {
      // Print the error and show a failure message
      print("Error deleting document: $e");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Failed to delete. Please try again."),
              backgroundColor: Colors.red,
            ),
          );
        }
      });
    } finally {
      notifyListeners();
    }
  }





  void clearStaff(){
    staffregisternameController.clear();
    staffregisterphoneController.clear();
    storecategoryController.clear();
    staffFileImg=null;
    staffImage='';
  }
  // void EditStaff(String id){
  //   db.collection("STAFF").doc(id).get().then((value){
  //     if(value.exists){
  //       Map<dynamic,dynamic>map = value.data() as Map;
  //       staffregisternameController.text = map["STAFF_NAME"].toString();
  //       staffregisterphoneController.text = map["STAFF_PHONE"].toString();
  //       storecategoryController.text = map["STORE"].toString();
  //       staffImage=map["STAFF_PHOTO"];
  //       getStaff();
  //       notifyListeners();
  //     }
  //   });
  //   notifyListeners();
  // }

  Future<void> EditStaff(String id) async {
    try {
      var doc = await db.collection("STAFF").doc(id).get();
      if (doc.exists) {
        Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
        staffregisternameController.text = map["STAFF_NAME"] ?? "";
        staffregisterphoneController.text = map["STAFF_PHONE"] ?? "";
        storecategoryController.text = map["STORE"] ?? "";
        staffImage = map["STAFF_PHOTO"] ?? "";

        // Find the corresponding store in CategoryList and set selectedstoreCategory
        var matchingCategory = CategoryList.firstWhere(
              (category) => category.name == map["STORE"],
          orElse: () => CategoryModel("", "", ""), // Assuming the third parameter is for photo
        );
        selectedstoreCategory = matchingCategory.id;
      }
    } catch (e) {
      print("Error in EditStaff: $e");
    } finally {
      notifyListeners();
    }
  }


  File? SignUpFileImg =null;
  String SignUpImg='';

  TextEditingController RegistorNamecontroller = TextEditingController();
  TextEditingController RegistorPhonecontroller = TextEditingController();

Future<void>AddRegistration(String from,String oldid,BuildContext context , String storeWithFieald) async{

  String id = DateTime.now().microsecondsSinceEpoch.toString();
  HashMap<String, dynamic> registermap = HashMap();


  registermap["REGISTER_NAME"]=RegistorNamecontroller.text;
  registermap["REGISTER_PHONE"]=RegistorPhonecontroller.text;


  if(from=="NEW"){
    registermap["REGISTER_ID"]=id;
    registermap["STATUS"]="REQUEST";
    print(id+"bgfdfkjgd");
  }
String pp = '';
  if (SignUpFileImg!= null) {
    print("dxdc");
    String photoId = DateTime.now().millisecondsSinceEpoch.toString();
    ref = FirebaseStorage.instance.ref().child(photoId);
    await ref.putFile(SignUpFileImg! ).whenComplete(() async {
      await ref.getDownloadURL().then((value) {
        registermap["SIGNUP_PHOTO"] = value;
        pp = value;
        notifyListeners();
      });
      notifyListeners();
    });
    notifyListeners();
  } else {
    registermap['SIGNUP_PHOTO'] = SignUpImg;
    pp = SignUpImg;
    // editMap['IMAGE_URL'] = imageUrl;
  }
  if(from == "EDIT"){
    db.collection("REGISTRATION").doc(oldid).set(registermap,SetOptions(merge: true));
    db.collection("USERS").doc(oldid).set(registermap,SetOptions(merge: true));

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(userId:oldid,photo: pp, profileName: RegistorNamecontroller.text, profilePhone: RegistorPhonecontroller.text, storeWithFieald: storeWithFieald,)));

    notifyListeners();
  }else{
    db.collection("REGISTRATION").doc(id).set(registermap);
    notifyListeners();
  }
  notifyListeners();
}

  Future getSignUpImggallery() async {
    print("cdc");

    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropSImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }
  Future getSignUpImgcamera() async {
    print("ffvjrvn");
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropSImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }
  Future<void> cropSImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      SignUpFileImg = File(croppedFile.path);
      print(SignUpFileImg.toString() + "fofiifi");
      notifyListeners();
    }
  }
  void EditRegistration(String id){
    db.collection("REGISTRATION").doc(id).get().then((value){
      if(value.exists){
        Map<dynamic,dynamic>map = value.data() as Map;
        RegistorNamecontroller.text = map["REGISTER_NAME"].toString();
        RegistorPhonecontroller.text = map["REGISTER_PHONE"].toString();
        SignUpImg=map["SIGNUP_PHOTO"].toString();
        notifyListeners();
      }
    });
    notifyListeners();
  }
  void SignUpclear() {
    RegistorNamecontroller.clear();
    RegistorPhonecontroller.clear();
    SignUpFileImg = null;
    SignUpImg = "";
    print("vgchvcxzh");
  }
List<RegistrationModel>RegistrationList=[];

void getRegistration(){
  db.collection("REGISTRATION").where("STATUS",isEqualTo: "REQUEST").get().then((value){
    if(value.docs.isNotEmpty){
      RegistrationList.clear();
      for(var element in value.docs){
        RegistrationList.add(RegistrationModel(element.id,element.get("REGISTER_NAME").toString(), element.get("REGISTER_PHONE").toString(), element.get("STATUS").toString(),element.get("SIGNUP_PHOTO").toString()));
        notifyListeners();
      }
    }
  });
  notifyListeners();
}
// void getProfile(String id){
//   db.collection("REGISTRATION").where("USER_ID",isEqualTo: id).get().then((value) {
//     if(value.docs.isNotEmpty){
//       RegistrationList.clear();
//       for(var element in value.docs){
//         RegistrationList.add(RegistrationModel(element.id,element.get("REGISTER_NAME").toString(), element.get("REGISTER_PHONE").toString(), element.get("STATUS").toString(),element.get("SIGNUP_PHOTO").toString()));
//         notifyListeners();
//       }
//     }
//   });
// }

void statutsapv(String id,String name,String phone,BuildContext context){
  HashMap<String, dynamic> cusdata = HashMap();
  HashMap<String, dynamic> usermap = HashMap();
  cusdata["STATUS"]="APPROVED";
  db.collection("REGISTRATION").doc(id).set(cusdata,SetOptions(merge: true));
     usermap["USER_ID"]=id;
     usermap["USER_NAME"]=name;
     usermap["PHONE_NUMBER"]="+91$phone";
     usermap["TYPE"]="USER";
     db.collection("USERS").doc(id).set(usermap);

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Approved Successfully"),
    backgroundColor: Colors.green,
  ));
  getRegistration();
  notifyListeners();
   }


   void statusreject(String id,BuildContext context){
     HashMap<String, dynamic> rejectmap = HashMap();
     rejectmap["STATUS"]="REJECTED";
     db.collection("REGISTRATION").doc(id).set(rejectmap,SetOptions(merge: true));
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Rejected Successfully"),
       backgroundColor: Colors.red,
     ));
     getRegistration();
     notifyListeners();

   }
  void getcustomer(){
    db.collection("REGISTRATION").where("STATUS",isEqualTo: "APPROVED").get().then((value){
      if(value.docs.isNotEmpty){
        RegistrationList.clear();
        for(var element in value.docs){
          RegistrationList.add(RegistrationModel(element.id,element.get("REGISTER_NAME").toString(), element.get("REGISTER_PHONE").toString(), element.get("STATUS").toString(),element.get("SIGNUP_PHOTO").toString()));
          notifyListeners();
        }
      }
    });
    notifyListeners();
  }
void EditCategory(String id){
db.collection("CATEGORY").doc(id).get().then((value){
  if(value.exists){
    Map<dynamic,dynamic>map = value.data() as Map;
    namecontroller.text = map["CATEGORY_NAME"].toString();
    Image=map["PHOTO"];
    getCategory();
    notifyListeners();
  }
});
notifyListeners();
}
void DeleteCategory(id,BuildContext context){
  db.collection("CATEGORY").doc(id).delete();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delete Successfully"),
    backgroundColor: AppColors.spotColor,
      ));
  notifyListeners();
  getCategory();
}
void EditVehicle(String id){
  db.collection("VEHICLE").doc(id).get().then((value){
    if(value.exists){
      Map<dynamic,dynamic>map = value.data() as Map;
      Vnamecontroller.text = map["VEHICLE_NAME"].toString();
      VehicleImage=map["VEHICLE_PHOTO"];
      getVehicle();
      notifyListeners();
    }
  });
  notifyListeners();
}
void DeleteVehicle(id,BuildContext context) {
  db.collection("VEHICLE").doc(id).delete();
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Delete Successfully"),
        backgroundColor: AppColors.spotColor,
      ));
  notifyListeners();
  getVehicle();
}

  TextEditingController RowCountcontroller = TextEditingController();
  TextEditingController RowFieldcontroller = TextEditingController();
  TextEditingController ColumnCountcontroller = TextEditingController();
  TextEditingController ColumnFieldcontroller = TextEditingController();




  // Future<void> addMap(String storeId) async {
  //
  //   db.collection("CATEGORY").doc(storeId).get().then((storeValue) async {
  //     if(storeValue.exists){
  //       Map<dynamic,dynamic>map = storeValue.data() as Map;
  //       int current = map["CURRENT"]??65;
  //
  //       // int newCharCode = current.codeUnitAt(0) + 1;
  //
  //       String newString = String.fromCharCode(current+1);
  //
  //
  //
  //       int rowCount = int.parse(RowCountcontroller.text.trim());
  //       int rowFieldCount = int.parse(RowFieldcontroller.text.trim());
  //       int columnFieldCount = int.parse(ColumnFieldcontroller.text.trim());
  //       int columnCount = int.parse(ColumnCountcontroller.text.trim());
  //
  //       String id = DateTime.now().microsecondsSinceEpoch.toString();
  //
  //       Map<String, dynamic> rowData = {};
  //
  //       int fieldIndex = 1;
  //       for (int i = 1; i <= rowCount; i++) {
  //         Map<String, dynamic> rowFields = {};
  //         for (int j = 1; j <= rowFieldCount; j++) {
  //           rowFields['${newString}R${fieldIndex++}'] = 'VACANT';
  //         }
  //         rowData['R$i'] = rowFields;
  //       }
  //
  //       // Reset fieldIndex for column fields
  //       fieldIndex = 1;
  //       Map<String, dynamic> columnData = {};
  //       for (int i = 1; i <= columnCount; i++) {
  //         Map<String, dynamic> columnFields = {};
  //         for (int j = 1; j <= columnFieldCount; j++) {
  //           columnFields['${newString}C${fieldIndex++}'] = 'VACANT'; // Prefix with 'AC'
  //         }
  //         columnData['C$i'] = columnFields;
  //       }
  //
  //       await db.collection("MAP").doc(id).set({
  //         'FLOOR_NAME': dropdownValue,
  //         'ROW_FIELDS': rowData,
  //         'COLUMN_FIELDS': columnData,
  //         'STORE_ID': storeId,
  //       });
  //       await db.collection("CATEGORY").doc(storeId).set({
  //         'CURRENT': current+1,
  //       },SetOptions(merge: true));
  //
  //
  //     }
  //   });
  // }
  // Future<void> addMap(String storeId) async {
  //   try {
  //     // Fetch the CATEGORY document for the given storeId
  //     var storeValue = await db.collection("CATEGORY").doc(storeId).get();
  //
  //     if (storeValue.exists) {
  //       // Ensure CURRENT is correctly retrieved and set, default to 65 if not present
  //       int current = (storeValue.data() as Map<String, dynamic>)["CURRENT"] ?? 65;
  //
  //       // Log the current value
  //       print("Retrieved CURRENT value: $current");
  //
  //       // Ensure current is within the ASCII range for uppercase letters
  //       if (current < 65 || current > 90) {
  //         current = 65; // Reset to 'A' if out of bounds
  //       }
  //
  //       // Generate the new character from the current value
  //       String newString = String.fromCharCode(current);
  //
  //       // Log the newString value
  //       print("Generated newString: $newString");
  //
  //       // Retrieve the count values from the text controllers
  //       int rowCount = int.parse(RowCountcontroller.text.trim());
  //       int rowFieldCount = int.parse(RowFieldcontroller.text.trim());
  //       int columnFieldCount = int.parse(ColumnFieldcontroller.text.trim());
  //       int columnCount = int.parse(ColumnCountcontroller.text.trim());
  //
  //       // Generate a unique ID based on the current timestamp
  //       String id = DateTime.now().microsecondsSinceEpoch.toString();
  //
  //       // Create the row fields
  //       Map<String, dynamic> rowData = {};
  //       int fieldIndex = 1;
  //       for (int i = 1; i <= rowCount; i++) {
  //         Map<String, dynamic> rowFields = {};
  //         for (int j = 1; j <= rowFieldCount; j++) {
  //           rowFields['${newString}R${fieldIndex++}'] = 'VACANT';
  //         }
  //         rowData['R$i'] = rowFields;
  //       }
  //
  //       // Create the column fields
  //       fieldIndex = 1;
  //       Map<String, dynamic> columnData = {};
  //       for (int i = 1; i <= columnCount; i++) {
  //         Map<String, dynamic> columnFields = {};
  //         for (int j = 1; j <= columnFieldCount; j++) {
  //           columnFields['${newString}C${fieldIndex++}'] = 'VACANT';
  //         }
  //         columnData['C$i'] = columnFields;
  //       }
  //
  //       // Add the new map document to the MAP collection
  //       await db.collection("MAP").doc(id).set({
  //         'FLOOR_NAME': dropdownValue,
  //         'ROW_FIELDS': rowData,
  //         'COLUMN_FIELDS': columnData,
  //         'STORE_ID': storeId,
  //       });
  //
  //       // Update the CURRENT field in the CATEGORY document
  //       await db.collection("CATEGORY").doc(storeId).set({
  //         'CURRENT': current + 1,
  //       }, SetOptions(merge: true));
  //
  //       // Log the update
  //       print("Successfully added map with ID: $id and updated CURRENT to ${current + 1}");
  //     } else {
  //       // Initialize CATEGORY document if it doesn't exist
  //       await db.collection("CATEGORY").doc(storeId).set({
  //         'CURRENT': 65,
  //       }, SetOptions(merge: true));
  //
  //       // Log initialization
  //       print("CATEGORY document initialized with CURRENT set to 65");
  //     }
  //   } catch (e) {
  //     print("An error occurred: $e");
  //   }
  // }
  /// old addMap
    Future<void> addMap(String storeId) async {
      try {
        // Fetch the CATEGORY document for the given storeId
        var storeValue = await db.collection("CATEGORY").doc(storeId).get();

        if (storeValue.exists) {
          // Ensure CURRENT is correctly retrieved and set, default to 65 if not present
          int current = (storeValue.data() as Map<String, dynamic>)["CURRENT"] ?? 65;

          // Log the current value
          print("Retrieved CURRENT value: $current");

          // Ensure current is within the ASCII range for uppercase letters
          if (current < 65 || current > 90) {
            current = 65; // Reset to 'A' if out of bounds
          }

          // Generate the new character from the current value
          String newString = String.fromCharCode(current);

          // Log the newString value
          print("Generated newString: $newString");

          // Retrieve the count values from the text controllers
          int rowCount = int.parse(RowCountcontroller.text.trim());
          int rowFieldCount = int.parse(RowFieldcontroller.text.trim());
          int columnFieldCount = int.parse(ColumnFieldcontroller.text.trim());
          int columnCount = int.parse(ColumnCountcontroller.text.trim());

          // Generate a unique ID based on the current timestamp
          String id = DateTime.now().microsecondsSinceEpoch.toString();

          // Create the row fields
          Map<String, dynamic> rowData = {};
          int fieldIndex = 1;
          for (int i = 1; i <= rowCount; i++) {
            Map<String, dynamic> rowFields = {};
            for (int j = 1; j <= rowFieldCount; j++) {
              rowFields['${newString}R${fieldIndex++}'] = 'VACANT';
            }
            rowData['R$i'] = rowFields;
          }

          // Create the column fields
          fieldIndex = 1;
          Map<String, dynamic> columnData = {};
          for (int i = 1; i <= columnCount; i++) {
            Map<String, dynamic> columnFields = {};
            for (int j = 1; j <= columnFieldCount; j++) {
              columnFields['${newString}C${fieldIndex++}'] = 'VACANT';
            }
            columnData['C$i'] = columnFields;
          }

          // Add the new map document to the MAP collection
          await db.collection("MAP").doc(id).set({
            'FLOOR_NAME': dropdownValue,
            'ROW_FIELDS': rowData,
            'COLUMN_FIELDS': columnData,
            'STORE_ID': storeId,
          });

          // Update the CURRENT field in the CATEGORY document
          await db.collection("CATEGORY").doc(storeId).set({
            'CURRENT': current + 1,
          }, SetOptions(merge: true));

          // Log the update
          print("Successfully added map with ID: $id and updated CURRENT to ${current + 1}");
        } else {
          // Initialize CATEGORY document if it doesn't exist
          await db.collection("CATEGORY").doc(storeId).set({
            'CURRENT': 65,
          }, SetOptions(merge: true));

          // Log initialization
          print("CATEGORY document initialized with CURRENT set to 65");
        }
      } catch (e) {
        print("An error occurred: $e");
      }
    }



  Future<void> updateMapField(String mapId, String fieldPath, dynamic newValue) async {
    try {
      // Fetch the map document from Firestore
      var mapDoc = await db.collection("MAP").doc(mapId).get();

      if (mapDoc.exists) {
        // Get the map data
        Map<String, dynamic> mapData = mapDoc.data() as Map<String, dynamic>;

        Map<String, dynamic> updatedMapData = mapData;
        await db.collection("MAP").doc(mapId).update(updatedMapData);
        print("codde is worki");
      } else {
        print("Map document does not exist!");
      }
    } catch (e) {
      print("An error occurred: $e");
    }
  }

  void _updateFieldValue(Map<String, dynamic> mapData, List<String> fieldPath, dynamic newValue) {
    // Traverse the map using the fieldPath to reach the target field
    for (var i = 0; i < fieldPath.length - 1; i++) {
      mapData = mapData[fieldPath[i]] as Map<String, dynamic>;
    }

    // Update the value of the target field
    mapData[fieldPath.last] = newValue;
  }

  ///old function
  void updateMap(String mapId, String storeId, String fieldToUpdate, String nestedKeyToUpdate, dynamic newValue) {
    if (mapId == null || mapId.isEmpty) {
      print("Error: mapId is null or empty!");
      return;
    }

    print("mapId: $mapId");
    print("storeId: $storeId");
    print("column name: $fieldToUpdate");
    print("row name: $fieldToUpdate");
    print("field name: $nestedKeyToUpdate");

    // Reference to the specific document
    DocumentReference docRef = db.collection("MAP").doc(mapId);

    // Fetch the document
    docRef.get().then((doc) {
      if (doc.exists) {
        // Get the data from the document
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // Check if the storeId matches
        if (data['STORE_ID'] == storeId) {
          // Get the ROW_FIELDS or COLUMN_FIELDS map
          Map<String, dynamic> rowFields = data['ROW_FIELDS'] as Map<String, dynamic>;
          Map<String, dynamic> columnFields = data['COLUMN_FIELDS'] as Map<String, dynamic>;

          // Update the specific nested key inside the map based on fieldToUpdate
          if (rowFields.containsKey(fieldToUpdate)) {
            Map<String, dynamic> nestedMap = rowFields[fieldToUpdate] as Map<String, dynamic>;
            if (nestedMap.containsKey(nestedKeyToUpdate)) {
              nestedMap[nestedKeyToUpdate] = newValue;
            } else {
              print('Nested key not found!');
              return;
            }
          } else if (columnFields.containsKey(fieldToUpdate)) {
            Map<String, dynamic> nestedMap = columnFields[fieldToUpdate] as Map<String, dynamic>;
            if (nestedMap.containsKey(nestedKeyToUpdate)) {
              nestedMap[nestedKeyToUpdate] = newValue;
            } else {
              print('Nested key not found!');
              return;
            }
          } else {
            print('Field not found!');
            return;
          }
          notifyListeners();

          // Update the document with the modified data
          docRef.update({
            'ROW_FIELDS': rowFields,
            'COLUMN_FIELDS': columnFields,
          }).then((_) {
            print('Document updated successfully!');
          }).catchError((error) {
            print('Failed to update document: $error');
          });
        } else {
          print('Store ID does not match!');
        }
      } else {
        print('Document does not exist!');
      }
    }).catchError((error) {
      print('Error getting document: $error');
    });

    notifyListeners();
  }


  List<RowColumnCountModel> mapRowList = [];
 List<RowColumnMainModel> mapRowMainList = [];


  void getMap(String storeId) {
    db.collection("MAP").where("STORE_ID", isEqualTo: storeId).get().then((value) {
      mapRowMainList.clear();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<String, dynamic> data = element.data() as Map<String, dynamic>;

          // Processing row fields
          Map<String, dynamic> rowFieldsMap = data['ROW_FIELDS'] as Map<String, dynamic>;
          List<RowColumnCountModel> rowCountList = [];

          rowFieldsMap.forEach((rowKey, rowValue) {
            List<RowColumnFieldModel> rowFieldList = [];
            int rawNumber = int.parse(rowKey.substring(1));

            (rowValue as Map<String, dynamic>).forEach((fieldKey, fieldValue) {
              int rawFieldNumber = int.parse(fieldKey.substring(2));
              String rowName = 'R$rawFieldNumber'; // Get corresponding column name
              rowFieldList.add(RowColumnFieldModel(fieldKey, fieldValue, rawFieldNumber, rowKey, rowName,element.id));
            });

            rowCountList.add(RowColumnCountModel(rowKey, rowFieldList, rawNumber, rowKey));
          });

          // Processing column fields
          Map<String, dynamic> columnFieldsMap = data['COLUMN_FIELDS'] as Map<String, dynamic>;
          List<RowColumnCountModel> columnCountList = [];

          columnFieldsMap.forEach((columnKey, columnValue) {
            int columnNumber = int.parse(columnKey.substring(1));
            List<RowColumnFieldModel> columnFieldList = [];

            (columnValue as Map<String, dynamic>).forEach((fieldKey, fieldValue) {
              int columnFieldNumber = int.parse(fieldKey.substring(2));
              String columnName = 'C$columnFieldNumber'; // Get corresponding row name
              columnFieldList.add(RowColumnFieldModel(fieldKey, fieldValue, columnFieldNumber, columnKey, columnName,element.id));
            });

            columnCountList.add(RowColumnCountModel(columnKey, columnFieldList, columnNumber, columnKey));
          });

          String floorName = data["FLOOR_NAME"].toString();
          int floorNumber = int.parse(floorName.replaceAll(RegExp(r'\D'), '')); // Extract floor number
          mapRowMainList.add(RowColumnMainModel(element.id, floorName, rowCountList, columnCountList, floorNumber,'')); // Include floorNumber
        }

        // Sort mapRowMainList by floorNumber
        mapRowMainList.sort((a, b) => a.floorNumber.compareTo(b.floorNumber));

        // Debugging output
        print("mapRowMainList: ${mapRowMainList.toString()}");

        // Notify listeners once after sorting
        notifyListeners();
      }
    });
  }

  int selectedFloorIndex = 0;
  void indexChange(int index) {
    selectedFloorIndex = index;
    notifyListeners();
  }

  List<TicketModel> userTicketList=[];



//   void getUserTicket(String userId,BuildContext context12){
//
//     var height = MediaQuery.of(context12).size.height;
//     var width = MediaQuery.of(context12).size.width;
//
// db.collection('REGISTRATION').doc(userId).get().then((value) {
//   if(value.exists){
//     userTicketList.clear();
//     Map<dynamic,dynamic> map = value.data() as Map;
//     db.collection('SLOT').doc(map['SLOT_ID']).get().then((value2) {
//       if(value2.exists){
// Map<dynamic,dynamic> map22 = value2.data() as Map;
//
//
// String laneLetter =  map22['FIELD_NAME'].substring(0, 2);
//
// RegExp regExp = RegExp(r'\d+$');
// Match? match = regExp.firstMatch( map22['FIELD_NAME'].toString());
// String lastNumbers='';
// if (match != null) {
//   lastNumbers = match.group(0)!;
// }
// String dateStr = '';
// String timeStr = '';
// if( map22['DATE']!=null) {
//   dateStr = DateFormat('yyyy-MM-dd').format( map22['DATE'].toDate());
//   timeStr = DateFormat.jm().format( map22['DATE'].toDate());
// }
//
//         userTicketList.add(TicketModel(map['SLOT_ID'].toString(),
//             userId, map22['STORE_ID']??"",  map22['FLOOR_NAME']??"", map22['FIELD_NAME']??"", laneLetter, lastNumbers, dateStr, timeStr,  map22['STATUS']??"CHECK IN", map22['DATE'].toDate()??DateTime.now()));
// // notifyListeners();
//       }
//       showDialog(
//           context: context12,
//           builder: (context1) =>
//               AlertDialog(
//                 contentPadding: EdgeInsets.zero,
//                 backgroundColor: Colors.white,
//                 // elevation: 20,
//                 content:userTicketList.isEmpty? CircularProgressIndicator():Container(
//                   // margin: EdgeInsets.only(bottom: 15),
//                   height: height/2.60,
//                   width: width,
//                   decoration: BoxDecoration(
//                       color: Colors.white
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Container(
//                         //margin: EdgeInsets.only(top: 20),
//                         height: height/10,
//                         width: height/10,
//                         decoration: BoxDecoration(
//                             color: AppColors.spotColor
//                         ),
//                         child: Center(child: Text(userTicketList[0].fiealdName,style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.w600,fontSize: 25),)),
//                       ),
//                       IntrinsicHeight(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Column(
//                                 children: [
//                                   Icon(Icons.alarm,color: AppColors.bgColor,),
//                                   Text(userTicketList[0].time,style: TextStyle(color: AppColors.bgColor)),
//                                 ]),
//                             VerticalDivider(
//                               color: AppColors.bgColor,
//                               width: 5,
//                               thickness: 1,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Parking Details:",style: TextStyle(color: AppColors.bgColor),),
//                                 SizedBox(height: 5,),
//                                 IntrinsicHeight(
//                                   child: Row(
//                                     children: [
//                                       Text("Floor.${userTicketList[0].floor}",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
//                                       VerticalDivider(
//                                         color: AppColors.bgColor,
//                                         width: 10,
//                                         thickness: 2,
//                                       ),
//                                       Text("Lane.${userTicketList[0].lane}",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
//                                       VerticalDivider(
//                                         color: AppColors.bgColor,
//                                         width: 10,
//                                         thickness: 2,
//                                       ),
//                                       Text("Pos.${userTicketList[0].position}",style: TextStyle(color: AppColors.bgColor,fontWeight: FontWeight.bold),),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Center(
//                         child: Container(
//                           width: width*.5,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text("Free parking for first 30 mins, afterwards ₹8/hr",style: TextStyle(fontSize: 12,color: AppColors.bgColor),textAlign:TextAlign.center ,),
//                           ),
//                         ),
//                       ),
//                       userTicketList[0].status=='CHECK IN'?SizedBox():  InkWell(
//                           onTap: (){},
//                           child: Text("Pay at exit",style: TextStyle(fontWeight: FontWeight.w600,color: AppColors.bgColor),)
//                       )
//                     ],
//                   ),
//                 ),));
//     });
//     notifyListeners();
//   }
// });
//
//   }
  void getUserTicket(String userId, BuildContext context12) {
    // Extract the parent context
    final parentContext = context12;

    var height = MediaQuery.of(parentContext).size.height;
    var width = MediaQuery.of(parentContext).size.width;

    db.collection('REGISTRATION').doc(userId).get().then((value) {
      if (value.exists) {
        userTicketList.clear();
        Map<dynamic, dynamic> map = value.data() as Map;
        db.collection('SLOT').doc(map['SLOT_ID']).get().then((value2) {
          if (value2.exists) {
            Map<dynamic, dynamic> map22 = value2.data() as Map;

            String laneLetter = map22['FIELD_NAME'].substring(0, 2);

            RegExp regExp = RegExp(r'\d+$');
            Match? match = regExp.firstMatch(map22['FIELD_NAME'].toString());
            String lastNumbers = '';
            if (match != null) {
              lastNumbers = match.group(0)!;
            }
            String dateStr = '';
            String timeStr = '';
            if (map22['DATE'] != null) {
              dateStr = DateFormat('yyyy-MM-dd').format(map22['DATE'].toDate());
              timeStr = DateFormat.jm().format(map22['DATE'].toDate());
            }

            userTicketList.add(TicketModel(
              map['SLOT_ID'].toString(),
              userId,
              map22['STORE_ID'] ?? "",
              map22['FLOOR_NAME'] ?? "",
              map22['FIELD_NAME'] ?? "",
              laneLetter,
              lastNumbers,
              dateStr,
              timeStr,
              map22['STATUS'] ?? "CHECK IN",
              map22['DATE'].toDate() ?? DateTime.now(),
            ));
          }

          // Use the parent context here
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (parentContext.mounted) {
              showDialog(
                context: parentContext,
                builder: (context1) => AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  backgroundColor: Colors.white,
                  content: userTicketList.isEmpty
                      ? CircularProgressIndicator()
                      : Container(
                    height: height / 2.60,
                    width: width,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: height / 10,
                          width: height / 10,
                          decoration: BoxDecoration(color: AppColors.spotColor),
                          child: Center(
                            child: Text(
                              userTicketList[0].fiealdName,
                              style: TextStyle(
                                color: AppColors.bgColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.alarm, color: AppColors.bgColor),
                                  Text(userTicketList[0].time,
                                      style: TextStyle(color: AppColors.bgColor)),
                                ],
                              ),
                              VerticalDivider(
                                color: AppColors.bgColor,
                                width: 5,
                                thickness: 1,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Parking Details:",
                                      style: TextStyle(color: AppColors.bgColor)),
                                  SizedBox(height: 5),
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Text("Floor.${userTicketList[0].floor}",
                                            style: TextStyle(
                                                color: AppColors.bgColor,
                                                fontWeight: FontWeight.bold)),
                                        VerticalDivider(
                                          color: AppColors.bgColor,
                                          width: 10,
                                          thickness: 2,
                                        ),
                                        Text("Lane.${userTicketList[0].lane}",
                                            style: TextStyle(
                                                color: AppColors.bgColor,
                                                fontWeight: FontWeight.bold)),
                                        VerticalDivider(
                                          color: AppColors.bgColor,
                                          width: 10,
                                          thickness: 2,
                                        ),
                                        Text("Pos.${userTicketList[0].position}",
                                            style: TextStyle(
                                                color: AppColors.bgColor,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            width: width * .5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Free parking for first 30 mins, afterwards ₹8/hr",
                                style: TextStyle(
                                    fontSize: 12, color: AppColors.bgColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        userTicketList[0].status == 'CHECK IN'
                            ? SizedBox()
                            : InkWell(
                          onTap: () {},
                          child: Text(
                            "Pay at exit",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.bgColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          });
        });
        // setUserSelectedSlot(st);
        notifyListeners();
      }
    });
  }



  void clearMap(){
    RowCountcontroller.clear();
    ColumnCountcontroller.clear();
    RowFieldcontroller.clear();
    ColumnFieldcontroller.clear();
    dropdownValue="Choose any";

  }

  //  choose any dropdown button
  List<String> floor = [
    "Choose any",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",

  ];

  String dropdownValue = 'Choose any';

  void floorlength(var value) {
    dropdownValue = value;
    notifyListeners();
  }


  // / call
  void makingPhoneCall(String Phone) async {
    String url = "";
    url = 'tel:$Phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

//whatsapp
  void launchWhatsApp({required String phoneNumber, required String message}) async {
    String url = "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // checkbox
  bool whatsapp =false ;
  void checkboxvalue(bool) {
    whatsapp = bool;
    notifyListeners();
  }

  Future<void>ticketSlot(String mapId,String userid,String registerPhone,String fieldName,String floorname,String storeId,String mapType,BuildContext context) async{
    String id = DateTime.now().microsecondsSinceEpoch.toString();

    if (id.isEmpty) {
      print("Error: ID is empty");
      return;
    }

    HashMap<String, dynamic> slotmap = HashMap();
    slotmap["SLOT_ID"]=id;
    slotmap["MAP_ID"]=mapId;
    slotmap["USER_ID"]=userid;
    slotmap["REGISTER_PHONE"]=registerPhone;
    slotmap["FIELD_NAME"]= fieldName;
    slotmap["FLOOR_NAME"] = floorname ;
    slotmap["STORE_ID"] = storeId ;
    slotmap["STATUS"] = "CHECK IN" ;
    slotmap["MAP_TYPE"] = mapType;
    slotmap["DATE"]= DateTime.now();


    db.collection("SLOT").doc(id).set(slotmap);
    db.collection("REGISTRATION").doc(userid).set({"SLOT_ID":id,"MAP_ID":mapId,'FIELD_NAME':fieldName,'STORE_ID':storeId},SetOptions(merge: true));

    getticketslot(userid);
    getUserTicket(userid,context);
    notifyListeners();

  }

  List<ticketslotModel> ticketslotList = [];

  Future<void> getticketslot(String userid) async {
    var snapshot = await db.collection("SLOT").where("USER_ID", isEqualTo: userid).get();

    List<ticketslotModel> slots = snapshot.docs.map((doc) {
      var data = doc.data();
      DateTime? date;
      DateTime? checkoutDate;
      Timestamp? dateTimestamp = data["DATE"] as Timestamp?;
      Timestamp? checkoutTimestamp = data["CHECKOUT_TIME"] as Timestamp?;
      if (dateTimestamp != null) {
        date = dateTimestamp.toDate();
      }
      if (checkoutTimestamp != null) {
        checkoutDate = checkoutTimestamp.toDate();
      }
      return ticketslotModel(
        data["SLOT_ID"] ?? "",
        data["USER_ID"] ?? "",
        data["REGISTER_PHONE"] ?? "",
        data["FIELD_NAME"] ?? "",
        data["FLOOR_NAME"] ?? "",
        // data["DATE"] ?? "",
        // data["CHECKOUT_TIME"] ?? "",
        date ?? DateTime.now(), // Use the converted DateTime or a default value
        checkoutDate ?? DateTime.now(),
        data['STATUS']??'',// Use the converted DateTime or a default value
        // date ?? DateTime.now(),

      );
    }).toList();

    // Update your provider's state with the correct type
    ticketslotList = slots;
    notifyListeners();
  }

  void setUserSelectedSlot(String data){
print("fvhfv111111111111111111111111111111111"+data);
    for(var ele in mapRowMainList){
      ele.userBookName =data;
      print("${ele.userBookName} nnnnnnnnnnnnnnnnn");
    }
    print(mapRowMainList[0].userBookName);
    notifyListeners();
  }

  List<userticketslotModel> userTicketSlotList=[];

// void getUserTicketSlots(){
//
//   String username='';
//
//   db.collection("SLOT").get().then((value) async {
//     if(value.docs.isNotEmpty){
//       userTicketSlotList.clear();
//       for(var element in value.docs){
//         print("dcdcdc");
//         Map<dynamic,dynamic> getslotmap= element.data();
//         print("fvf");
//         await db.collection("USERS").doc(getslotmap["USER_ID"]).get().then((value1) {
//           if(value1.exists){
//             print("dddddddddddddddddd"+getslotmap["USER_ID"]);
//             Map<dynamic,dynamic> map= value1.data()as Map;
//
//
//             username=map["USER_NAME"].toString();
//             print("aaaaaaaaaaa"+username);
//             print("fvfvffvfv"+map.length.toString());
//             Timestamp timestamp = element.get("CHECKOUT_TIME");
//             DateTime checkoutDate = timestamp.toDate();
//
//             userTicketSlotList.add(userticketslotModel(
//               element.id,
//               element.get("USER_ID"),
//                 username,
//               element.get("REGISTER_PHONE"),
//               element.get("FIELD_NAME"),
//               element.get("MAP_ID"),
//               element.get("MAP_TYPE"),
//               element.get("STATUS"),
//                 checkoutDate,
//
//             ));
//             notifyListeners();
//
//
//
//           }
//         });
//         notifyListeners();
//       }
//     }
//   });
//   notifyListeners();
//
// }

  void getUserTicketSlots() async {
    try {
      String username = '';

      // Clear the list before fetching new data
      userTicketSlotList.clear();

      // Fetch documents from the SLOT collection
      var slotSnapshot = await db.collection("SLOT").get();

      if (slotSnapshot.docs.isNotEmpty) {
        // Loop through each document in the snapshot
        for (var element in slotSnapshot.docs) {
          print("Processing document...");

          // Extract data map from the document
          Map<dynamic, dynamic> getSlotMap = element.data();

          // Fetch user information based on USER_ID
          var userDoc = await db.collection("USERS").doc(getSlotMap["USER_ID"]).get();

          if (userDoc.exists) {
            // User document exists, retrieve user information
            Map<dynamic, dynamic> userData = userDoc.data() as Map;

            username = userData["USER_NAME"].toString();
            print("Username: $username");

            // Handling CHECKOUT_TIME field if it exists
            DateTime checkoutDate = DateTime.now(); // Default value
            if (getSlotMap.containsKey("CHECKOUT_TIME")) {
              Timestamp timestamp = getSlotMap["CHECKOUT_TIME"];
              checkoutDate = timestamp.toDate();
            }

            // Create userticketslotModel object and add to list
            userTicketSlotList.add(userticketslotModel(
              element.id,
              getSlotMap["USER_ID"],
              username,
              getSlotMap["REGISTER_PHONE"],
              getSlotMap["FIELD_NAME"],
              getSlotMap["MAP_ID"],
              getSlotMap["MAP_TYPE"],
              getSlotMap["STATUS"],
              checkoutDate,

            ));

            // Notify listeners after adding each item
            notifyListeners();
          }
        }
      }
    } catch (e) {
      print("Error fetching user ticket slots: $e");
      // Handle any errors here
    }
  }


  void checkOut(String id){
  HashMap<String, dynamic> checkdata = HashMap();
  checkdata["STATUS"]="CHECK OUT";
  checkdata["CHECKOUT_TIME"]=DateTime.now();
  db.collection("SLOT").doc(id).set(checkdata,SetOptions(merge: true));

}

  StaffModel? currentStaff;

  Future<void> fetchCurrentStaff() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('STAFF').doc(user.uid).get();
      // currentStaff = StaffModel.fromFirestore(doc);
      notifyListeners();
    }
  }


  int tabInitialIndex=0;

  void updateSlotTicket(String fieldName, String mapId, String mapType,BuildContext context) {
    String mapTypeName = mapType == "COLUMN" ? "COLUMN_FIELDS" : "ROW_FIELDS";

    db.collection("MAP").doc(mapId).get().then((value) {
      if (value.exists) {
        Map<String, dynamic> map = value.data() as Map<String, dynamic>;
        Map<String, dynamic> mapData = {};

        if (map.containsKey(mapTypeName)) {
          Map<String, dynamic> fields = Map<String, dynamic>.from(map[mapTypeName]);
          for (var entry in fields.entries) {
            if (entry.value is Map && entry.value.containsKey(fieldName)) {
              fields[entry.key][fieldName] = "VACANT";
              mapData[entry.key] =entry.value;
            }
          }
        }
        db.collection("MAP").doc(mapId).set({mapTypeName: mapData},SetOptions(merge: true));
        // userTicketSlotList.removeWhere((element) => element.mapId==mapId);
        notifyInitialIndex();
        getUserTicketSlots();

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserStatus(),));



        notifyListeners();
      }
    });
  }
notifyInitialIndex(){
  tabInitialIndex=1;
  notifyListeners();
}

  void razorpayGateway(String advance){

    int amountInPaise;
    try {
      amountInPaise = (double.parse(advance) * 100).round();
    } catch (e) {
      print('Invalid amount format: $advance');
      // Handle the error appropriately
      return;
    }

    Razorpay razorpay = Razorpay();
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': amountInPaise.toString(),
      'name': "ParkiPay",
      'description': "Pay the Advance Amount",
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '7907863998',
        // 'email': 'test@razorpay.com'
      },
      'external': {
        'wallets': ['paytm']
      },
      'theme': {
        'color': '#32435F', // Replace with your desired color (Hex code)
      },
      'image': 'https://i.ibb.co/QFMCBkp/IMG-20240705-WA0038.jpg',

    };
    razorpay.on(
        Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
        handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
        handleExternalWalletSelected);
    razorpay.open(options);

  }
  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
  * PaymentFailureResponse contains three values:
  * 1. Error Code
  * 2. Error Description
  * 3. Metadata
  * */

  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    // Log the success response
    log(response.data.toString() + "success");

  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {

  }

  void requestPayment(String ticketId) {
    var ticket = ticketslotList.firstWhere((element) => element.id == ticketId);
    ticket.status = "REQUEST_PAYMENT";
    notifyListeners();
  }

}