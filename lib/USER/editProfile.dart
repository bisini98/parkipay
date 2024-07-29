import 'package:flutter/material.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/USER/profile_page.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/refactoring.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  String from;
  String oldid;
  String userId;
  String Signupphoto;
  String Profilename;
  String Profilephone;
  String storeWithFieald;

  EditProfile({super.key,required this.from,required this.oldid,required this.userId,required this.Signupphoto,required this.Profilename,required this.Profilephone,required this.storeWithFieald,});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height/10,),
            Center(
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return InkWell(
                    onTap: () {
                      showBottomSheet(context);
                    },
                    child:value.SignUpFileImg!=null?CircleAvatar(
                      backgroundColor: AppColors.btnColor,
                      radius: 50,
                      backgroundImage: FileImage(value.SignUpFileImg!)
                    ):CircleAvatar(
                        backgroundColor: AppColors.btnColor,
                        radius: 50,
                        backgroundImage: NetworkImage(Signupphoto.toString())
                    )
                  );
                }
              ),
            ),
        SizedBox(height: height/10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return TextFormField(
                controller: value.RegistorNamecontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Name"
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Name';
                  }
                  // Add more validation logic if needed
                  return null;
                },
              );
            }
          ),
        ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return TextFormField(enabled: false,
                      controller: value.RegistorPhonecontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "PHONE"
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Name';
                        }
                        // Add more validation logic if needed
                        return null;
                      },
                    );
                  }
              ),
            ),
           SizedBox(height: height/15,),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(
                  onTap: (){
        
                        value.AddRegistration(from, oldid,context,storeWithFieald);
        

                  },
                    child: fillbtn(width/3, height/15, AppColors.btnColor, "Save", Colors.white));
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
                    mainprovider.getSignUpImgcamera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: AppColors.bgColor),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.getSignUpImggallery(),Navigator.pop(context)
                  }),
            ],
          );
        });
    // ImageSource
  }
}



