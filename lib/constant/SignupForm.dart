import 'package:flutter/material.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/constant/LoginForm.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:parkipay/constant/refactoring.dart';
import 'package:provider/provider.dart';
import 'AuthScreen.dart';
import '../Provider/LoginProvider.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
   SignUpForm({super.key,required this.formKey});



  @override
  Widget build(BuildContext context) {
    // final formKey = context.findAncestorStateOfType<AuthScreenState>()?.getFormKey();
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    // return Scaffold(
    //   backgroundColor: AppColors.bgColor,
    //   body: Center(
    //     child: SingleChildScrollView(
    //       physics: NeverScrollableScrollPhysics(),
    //       child: Column(
    //         children: [
    //           SizedBox(height: height/10,),
    //           InkWell(
    //             onTap: () {
    //               showBottomSheet(context);
    //             },
    //             child: Consumer<MainProvider>(
    //               builder: (context,value,child) {
    //                 return  value.SignUpFileImg!=null?CircleAvatar(
    //                   backgroundColor: Colors.white,
    //                   radius: 60,
    //                   backgroundImage: FileImage(value.SignUpFileImg!)
    //                 ): CircleAvatar(
    //                   backgroundColor: Colors.white,
    //                   radius: 60,
    //                   child: Icon(Icons.person_4_rounded,color: Colors.grey,size: 30,),
    //                 );
    //               }
    //             ),
    //           ),
    //           SizedBox(height: 20,),
    //           Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
    //           SizedBox(height: height/40,),
    //           Text("Create a new account",style: TextStyle(color: Colors.white),),
    //           SizedBox(height: height/7,),
    //           Consumer<MainProvider>(
    //             builder: (context,value,child) {
    //               return personbutton(width/1.22, height/15, AppColors.btn1Color, "Name", Icons.person_outline_outlined,value.RegistorNamecontroller);
    //             }
    //           ),
    //           SizedBox(height: height/25,),
    //           Consumer<MainProvider>(
    //             builder: (context,value,child) {
    //               return button(width/1.22, height/15, AppColors.btn1Color, "Phone", Icons.phone_outlined,value.RegistorPhonecontroller);
    //             }
    //           ),
    //           SizedBox(height: height/12,),
    //           Consumer<MainProvider>(
    //             builder: (context,value,child) {
    //
    //               return InkWell(
    //                 onTap: () {
    //
    //                   value.AddRegistration();
    //                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
    //                 },
    //                   child: fillbtn(width/1.22, height/15, AppColors.btnColor, "Create Account",Colors.black));
    //             }
    //           ),
    //           SizedBox(height: height/12,),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text("Already have an Account?",style: TextStyle(color: Colors.white),),
    //               SizedBox(width: 2,),
    //               InkWell(
    //                   onTap: () {
    //                     Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
    //                   },
    //                   child: Text("Login",style: TextStyle(color: AppColors.btnColor,fontWeight: FontWeight.w500),
    //                   ))
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Spacer(),

            // Container(
            //   width: wth,
            //   height: ht,
            //   decoration: BoxDecoration(
            //       color: AppColors.btnColor,
            //       borderRadius: BorderRadius.circular(10)
            //   ),
            //   child: Icon(icon),
            //
            // ),
              InkWell(
                    onTap: () {
                      showBottomSheet(context);
                    },
                    child: Consumer<MainProvider>(
                      builder: (context,value,child) {

                        // return  value.SignUpFileImg!=null?Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                        //   child: CircleAvatar(
                        //     backgroundColor: Colors.white,
                        //     radius: 50,
                        //     backgroundImage: FileImage(value.SignUpFileImg!)
                        //   ),
                        // ): Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                        //   child: CircleAvatar(
                        //     backgroundColor: Colors.white,
                        //     radius: 50,
                        //     child: Icon(Icons.person_4_rounded,color: Colors.grey,size: 30,),
                        //   ),
                        // );
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 50,
                            backgroundImage: value.SignUpFileImg != null
                                ? FileImage(value.SignUpFileImg!)
                                : null,
                            child: value.SignUpFileImg == null
                                ? Icon(Icons.person_4_rounded, color: Colors.grey, size: 30)
                                : null,
                          ),
                        );
                      }
                    ),
                  ),
            Text("Create a new account",style: TextStyle(color: Colors.white),),
            // SizedBox(height: _size.height/20,),
            Consumer<MainProvider>(
                builder: (context,value,child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: TextFormField(
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
                    ),
                  );
                }
            ),
            // SizedBox(height: _size.height/15,),
            Consumer<MainProvider>(
                builder: (context,value,child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: TextFormField(
                      controller: value.RegistorPhonecontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone"
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        if (!RegExp(r'^\+?\d{10,15}$').hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                  );

                }
            ),
            // SizedBox(height: _size.height/10,),
            // Container(
            //   height: _size.height/13,
            //   width: _size.width,
            //   decoration: BoxDecoration(
            //     color: AppColors.spotColor,
            //   ),
            //   child: Center(child: Text("SIGN UP",style: TextStyle(fontWeight: FontWeight.w800,color: AppColors.bgColor),)),
            // ),

            Spacer(flex: 2,),
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
