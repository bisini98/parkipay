import 'package:flutter/material.dart';
import 'package:parkipay/Admin/Admin_StaffDetails.dart';
import 'package:provider/provider.dart';

import '../Model/ModelClass.dart';
import '../Provider/MainProvider.dart';
import '../constant/AppConstants.dart';
import '../constant/refactoring.dart';
import 'Add_Staff.dart';

class AddStaff extends StatelessWidget {
  String from;
  String oldid;

   AddStaff({super.key,required this.from,required this.oldid});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: height/10,),
                    Text(from=="EDIT"?"Edit Staff":"Add Staff :",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),

                  ],
                ),
              ),

              Center(child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(
                        onTap: () {
                          showBottomSheet(context);
                        },
                        child: value.staffFileImg!=null?Container(
                            height: height/4,
                            width: width/2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Image.file(value.staffFileImg!,fit: BoxFit.cover,)
                        ):value.staffImage!=""?Container(
                            height: height/4,
                            width: width/2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Image.network(value.staffImage,fit: BoxFit.cover,)
                        ):addImgcontainer(height/1.22,width/1.22));
                  }
              )),
              SizedBox(height: height/10,),
              Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return admintxtfrm(height, width/1.22, "Type Name",value.staffregisternameController);
                  }
              ),
              SizedBox(height: height/25,),
              Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return adminnubfrm(height, width/1.22, "Phone Number", value.staffregisterphoneController);
                  }
              ),
              SizedBox(height: height/15,),
              Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(width: width/3),
                        SizedBox(
                          width: width / 1.5,
                          child: Consumer<MainProvider>(
                            builder: (context, value, child) {
                              return Autocomplete<CategoryModel>(
                                optionsBuilder: (TextEditingValue textEditingValue) {
                                  return value.CategoryList
                                      .where((CategoryModel item) => item.name
                                      .toLowerCase()
                                      .contains(textEditingValue.text.toLowerCase()))
                                      .toList();
                                },
                                displayStringForOption: (CategoryModel option) =>
                                option.name,
                                fieldViewBuilder: (BuildContext context,
                                    TextEditingController fieldTextEditingController,
                                    FocusNode fieldFocusNode,
                                    VoidCallback onFieldSubmitted) {
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    fieldTextEditingController.text =
                                        value.storecategoryController.text;
                                  });

                                  return ValueListenableBuilder<TextEditingValue>(
                                    valueListenable: fieldTextEditingController,
                                    builder: (context, textValue, child) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: SizedBox(
                                            width: MediaQuery.of(context).size.width / 1.1,
                                            child: TextFormField(
                                              keyboardType: TextInputType.none,
                                              cursorColor: AppColors.btnColor,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500
                                              ),
                                              decoration: InputDecoration(
                                                suffixIcon: textValue.text.isNotEmpty
                                                    ? IconButton(
                                                  icon: Icon(Icons.clear_rounded),
                                                  onPressed: () {
                                                    fieldTextEditingController.clear();
                                                    value.storecategoryController.clear();
                                                    // FocusScope.of(context).unfocus();
                                                  },
                                                )
                                                    : Icon(Icons.keyboard_arrow_down_sharp),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.white),
                                                    borderRadius: BorderRadius.circular(10),
                                                ),
                                                hintText: "Select a Store",
                                                hintStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                              ),
                                              controller: fieldTextEditingController,
                                              focusNode: fieldFocusNode,


                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                onSelected: (CategoryModel selection) {
                                  value.storecategoryController.text = selection.name;
                                  value.selectedstoreCategory = selection.id;
                                },

                                // Keep your existing optionsViewBuilder
                                optionsViewBuilder: (BuildContext context,
                                    AutocompleteOnSelected<CategoryModel> onSelected,
                                    Iterable<CategoryModel> options) {
                                  return Align(
                                    alignment: Alignment.topCenter,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.white,
                                                  spreadRadius: 1,
                                                  blurRadius: 1)
                                            ],
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(10)),
                                        width: 200,
                                        height: 160,
                                        child: ListView.builder(
                                          padding: const EdgeInsets.all(10.0),
                                          itemCount: options.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            final CategoryModel option =
                                            options.elementAt(index);

                                            return GestureDetector(
                                              onTap: () {
                                                onSelected(option);
                                              },
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.transparent
                                                      // border: Border(left: BorderSide(color: Colors.white,width: .6,
                                                      // ))
                                                    ),
                                                    height: 30,
                                                    width: 200,
                                                    child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          Center(
                                                            child: Text(option.name,
                                                                style: const TextStyle(
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.black,
                                                                )),
                                                          ),
                                                        ]),
                                                  ),
                                                  Divider(
                                                    thickness: 1,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          // Consumer<MainProvider>(
                          //     builder: (context, value, child) {
                          //       return Autocomplete<CategoryModel>(
                          //
                          //         optionsBuilder:
                          //             (TextEditingValue textEditingValue) {
                          //           print("fvfvfvfv"+value.CategoryList.length.toString());
                          //
                          //
                          //           return value.CategoryList
                          //               .where((CategoryModel item) => item.name
                          //               .toLowerCase()
                          //               .contains(
                          //               textEditingValue.text.toLowerCase()))
                          //               .toList();
                          //         },
                          //         displayStringForOption: (CategoryModel option) =>
                          //         option.name,
                          //
                          //
                          //
                          //
                          //         fieldViewBuilder: (BuildContext context,
                          //             TextEditingController
                          //             fieldTextEditingController,
                          //             FocusNode fieldFocusNode,
                          //             VoidCallback onFieldSubmitted) {
                          //           WidgetsBinding.instance.addPostFrameCallback((_) {
                          //             fieldTextEditingController.text =
                          //                 value.storecategoryController.text;
                          //           });
                          //
                          //           return SizedBox(
                          //             child: TextFormField(
                          //               maxLines: null,
                          //               decoration: InputDecoration(
                          //
                          //                 contentPadding: EdgeInsets.symmetric(
                          //                     vertical: 20, horizontal: 20),
                          //                 hintStyle: TextStyle(
                          //                     color:Colors.black.withOpacity(0.6),
                          //                     fontSize: 13,
                          //                     fontWeight: FontWeight.bold),
                          //                 border: OutlineInputBorder(
                          //                   borderRadius: BorderRadius.circular(30),
                          //                 ),
                          //                 focusedBorder: OutlineInputBorder(
                          //                   borderRadius: BorderRadius.circular(30.0),
                          //                   borderSide:  BorderSide(
                          //                     color: Colors.white,
                          //                   ),
                          //                 ),
                          //                 enabledBorder: OutlineInputBorder(
                          //                   borderRadius: BorderRadius.circular(30.0),
                          //                   borderSide:  BorderSide(
                          //                     color:Colors.white,
                          //                     width: 1,
                          //                   ),
                          //                 ),
                          //                 hintText: "Select a store",
                          //                 suffixIcon:  Icon(
                          //                   Icons.keyboard_arrow_down_sharp,
                          //                   size: 25,
                          //                   color: Colors.black,
                          //                 ),
                          //               ),
                          //               onChanged: (txt) {
                          //
                          //               },
                          //               controller: fieldTextEditingController,
                          //               focusNode: fieldFocusNode,
                          //               validator: (value) {
                          //                 if (value!.isEmpty) {
                          //                   return "This field is Required";
                          //                 } else {
                          //
                          //                 }
                          //               },
                          //             ),
                          //           );
                          //         },
                          //         onSelected: (CategoryModel selection) {
                          //           value.storecategoryController.text = selection.name;
                          //           value.selectedstoreCategory = selection.id;
                          //           print(selection.id + "asdfg");
                          //         },
                          //         optionsViewBuilder: (BuildContext context,
                          //             AutocompleteOnSelected<CategoryModel> onSelected,
                          //             Iterable<CategoryModel> options) {
                          //           return Align(
                          //             alignment: Alignment.topLeft,
                          //             child: Material(
                          //               child: Container(
                          //                 width: 200,
                          //                 height: 300,
                          //                 color:Colors.white,
                          //                 child: ListView.builder(
                          //                   padding: const EdgeInsets.all(10.0),
                          //                   itemCount: options.length,
                          //                   itemBuilder:
                          //                       (BuildContext context, int index) {
                          //                     final CategoryModel option =
                          //                     options.elementAt(index);
                          //
                          //                     return GestureDetector(
                          //                       onTap: () {
                          //                         onSelected(option);
                          //                       },
                          //                       child: Container(
                          //                         color: Colors.white,
                          //                         height: 50,
                          //                         width: 200,
                          //                         child: Column(
                          //                             crossAxisAlignment:
                          //                             CrossAxisAlignment.start,
                          //                             children: [
                          //                               Text(option.name,
                          //                                   style: const TextStyle(
                          //                                       fontWeight:
                          //                                       FontWeight.bold)),
                          //                               const SizedBox(height: 10)]),
                          //                       ),
                          //                     );
                          //                   },
                          //                 ),
                          //               ),
                          //             ),
                          //           );
                          //         },
                          //       );
                          //     }),
                        ),

                      ],
                    );
                  }
              ),

              SizedBox(height: height/10,),
              Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return GestureDetector(
                        onTap: () {
                          final FormState? form = formKey.currentState;
                          if(form!.validate()) {
                            if(value.staffFileImg!= null || value.staffImage!="") {
                              if (from == "NEW") {
                                value.addStaff(from, "");
                              } else {
                                value.addStaff(from, oldid);
                              }
                              Navigator.pop(context);
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("* Image Provided",style: TextStyle(color: Colors.red,fontSize: 20),),
                                duration: Duration(milliseconds: 3000),
                              ));
                            }
                          }


                        },
                        child: value.staffLoader?Center(child: CircularProgressIndicator(color: Colors.blue,)):fillbtn(width/3, height/15, AppColors.AdminbtnColor,from=="EDIT"?"EDIT":"Save", Colors.white));
                  }
              )
            ],
          ),
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
                    mainprovider.getStaffImgcamera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: AppColors.bgColor),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.getStaffImggallery(),Navigator.pop(context)
                  }),
            ],
          );
        });
    // ImageSource
  }
}
