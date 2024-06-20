import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Admin_Home.dart';
import 'package:parkipay/Admin/Admin_VehiclePage.dart';
import 'package:parkipay/Admin/Admin_map.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/refactoring.dart';
import 'package:provider/provider.dart';

import '../Provider/MainProvider.dart';

class AddHomeScreen extends StatelessWidget {
  String from;
  String oldid;
   AddHomeScreen({super.key,required this.from,required this.oldid});
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
            //SizedBox(height: height/5,),
            Center(child:
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(onTap: () {
                  showBottomSheet(context);
                },
                    child: value.homeScreenFileImg!=null?Container(
                      height: height/4,
                      width: width/2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.file(value.homeScreenFileImg!)
                    ):value.Image!=""?Container(
                    height: height/4,
                    width: width/2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.network(value.Image)
                ):addImgcontainer(height,width));
              }
            )),
            //SizedBox(height: height/10,),
            //fillbtn(width/1.22, height/15, AppColors.btnColor, "Type Name", Colors.white),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return admintxtfrm(height, width/1.22, "Type Name",value.namecontroller);
              }
            ),
            //SizedBox(height: height/10,),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(
                  onTap: () {
                    final FormState? form = formKey.currentState;
                    if(form!.validate()) {
                      if(value.homeScreenFileImg!= null || value.Image!="")  {
                        print("jhbjhgh" + oldid);
                        if (from == "NEW") {
                          value.addcategory(from, "");
                        } else {
                          value.addcategory(from, oldid);
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => AdminHome(),));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("* Image Provided",style: TextStyle(color: Colors.red,fontSize: 20),),
                          duration: Duration(milliseconds: 3000),
                        ));
                      }
                    }
                  },
                    child: value.homescreenLoader?CircularProgressIndicator(color: Colors.blue,):fillbtn(width/3, height/15, AppColors.AdminbtnColor, from=="EDIT"?"EDIT":"SAVE", Colors.white));
              }
            ),
            from=="EDIT"
            ?Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(
                  onTap: () {
                    value.getVehicle();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminVehiclePage(storeId: oldid,),));
                  },
                    child: fillbtn(width/2, height/15, AppColors.btnColor, "ADD VEHICLE", Colors.white));
              }
            ):const SizedBox()
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
                    mainprovider.getImgcamera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: AppColors.bgColor),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.getImggallery(),Navigator.pop(context)
                  }),
            ],
          );
        });
    // ImageSource
  }
}
