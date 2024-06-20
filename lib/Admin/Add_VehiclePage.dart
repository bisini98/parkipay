import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Admin_Page.dart';
import 'package:parkipay/Admin/Admin_VehiclePage.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:provider/provider.dart';

import '../Provider/MainProvider.dart';
import '../constant/refactoring.dart';

class AddVehiclePage extends StatelessWidget {
  String from;
  String oldid;
  AddVehiclePage({super.key,required this.from,required this.oldid});

    final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(from=="EDIT"?"Edit Vehicle":"Add Vehicles :",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                ],
              ),
            ),
            Center(child: Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(
                  onTap: () {
                    showBottomSheet(context);
                  },
                    child: value.VehicleFileImg!=null?Container(
                        height: height/4,
                        width: width/2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Image.file(value.VehicleFileImg!,)
                    ):value.VehicleImage!=""?Container(
                        height: height/4,
                        width: width/2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Image.network(value.VehicleImage)
                    ):addImgcontainer(height/1.22,width/1.22));
              }
            )),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return admintxtfrm(height, width/1.22, "Type Name",value.Vnamecontroller);
              }
            ),


            Consumer<MainProvider>(
              builder: (context,value,child) {
                return GestureDetector(
                  onTap: () {
                    final FormState? form = formKey.currentState;
                    if(form!.validate()) {
                      if(value.VehicleFileImg!= null || value.VehicleImage!="") {
                        if (from == "NEW") {
                          value.AddVehicle(from, "");
                        } else {
                          value.AddVehicle(from, oldid);
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => AdminVehiclePage(storeId: '',),));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("* Image Provided",style: TextStyle(color: Colors.red,fontSize: 20),),
                          duration: Duration(milliseconds: 3000),
                        ));
                      }
                    }
                  },
                    child: value.vehicleLoader?Center(child: CircularProgressIndicator(color: Colors.blue,)):fillbtn(width/3, height/15, AppColors.AdminbtnColor, from=="EDIT"?"EDIT":"Save", Colors.white));
              }
            )
          ],
        ),
      ),
    );
  }
  void showBottomSheet(BuildContext context) {
    MainProvider mainprovider=Provider.of<MainProvider>(context, listen: false);

    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading:  Icon(
                    Icons.camera_enhance_sharp,
                    color: AppColors.bgColor,
                  ),
                  title: const Text('Camera',),
                  onTap: () => {
                    mainprovider.getVehicleImgcamera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: AppColors.bgColor),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.getVehicleImggallery(),Navigator.pop(context)
                  }),
            ],
          );
        });
    // ImageSource
  }
}
