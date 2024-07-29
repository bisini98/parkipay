import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../Model/ModelClass.dart';
import '../Provider/MainProvider.dart';
import '../constant/AppConstants.dart';
import '../constant/refactoring.dart';
import 'Add_Staff.dart'; // Update with the correct path

class StaffDetails extends StatelessWidget {
  const StaffDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      floatingActionButton: Consumer<MainProvider>(
        builder: (context, value, child) {
          return FloatingActionButton(
            backgroundColor: AppColors.bgColor,
            onPressed: () {
              value.getCategory();
              value.getStaff();
              value.clearStaff();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddStaff(from: "NEW", oldid: "")),
              );
            },
            child: const Icon(Icons.add, color: Colors.white),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            quarterContainerWithIcon(height, width, "Staff Details", context),
            SizedBox(
              height: height / 1.22,
              child: Consumer<MainProvider>(
                builder: (context, value, child) {
                  if (value.StaffList.isEmpty) {
                    return Center(
                      child: Text(
                        "No staff members available.",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }

                  return value.getstaffLoader?Center(child: CircularProgressIndicator(color: Colors.blue,)):ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemCount: value.StaffList.length,
                    itemBuilder: (context, index) {
                      final staff = value.StaffList[index];
                      return InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text(
                                  "Do you want to EDIT or DELETE?",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue)),
                              actions: <Widget>[
                                Center(
                                  child: Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          value.DeleteStaff(value.StaffList[index].id, context);
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 90,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x26000000),
                                                blurRadius: 2.0, // soften the shadow
                                                spreadRadius: 1.0, // extend the shadow
                                              ),
                                            ],
                                          ),
                                          child: Center(child: Text("Delete", style: TextStyle(color: AppColors.otpColor, fontSize: 17, fontWeight: FontWeight.w700))),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          print("hjjk" + value.StaffList[index].id);
                                          value.EditStaff(staff.id);
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => AddStaff(from: "EDIT", oldid: staff.id),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 90,
                                          decoration: BoxDecoration(
                                            color: AppColors.AdminpaymentcontainerColor,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x26000000),
                                                blurRadius: 2.0, // soften the shadow
                                                spreadRadius: 1.0, // extend the shadow
                                              ),
                                            ],
                                          ),
                                          child: Center(child: Text("Edit", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: StaffListItem(
                          height: height,
                          width: width,
                          staff: staff,
                          storeCategory: value.selectedstoreCategory,
                          onDeletePressed: () {
                            value.DeleteStaff(staff.id, context);
                          },
                          onCallPressed: (phoneNumber) {
                            value.makingPhoneCall(phoneNumber);
                          },
                          onWhatsAppPressed: ({required phoneNumber, required message}) {
                            value.launchWhatsApp(phoneNumber: phoneNumber, message: message);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class StaffListItem extends StatelessWidget {
  final double height;
  final double width;
  final StaffModel staff;
  final String storeCategory;
  final VoidCallback onDeletePressed; // Callback for delete action
  final Function(String) onCallPressed; // Callback for call action
  final Function({required String phoneNumber, required String message}) onWhatsAppPressed; // Callback for WhatsApp action

  const StaffListItem({
    required this.height,
    required this.width,
    required this.staff,
    required this.storeCategory,
    required this.onDeletePressed,
    required this.onCallPressed,
    required this.onWhatsAppPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.navigationColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Name", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 5),
                        Text(":", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 10),
                        Text(staff.name, style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 5),
                        Text(":", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 10),
                        Text(staff.phone, style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text("Store Name", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 5),
                        Text(":", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 10),
                        Center(
                          child: Text(staff.storename, style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),

                  ],
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: height / 20,
                    width: width / 8,
                    decoration: BoxDecoration(
                      color: AppColors.spotColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Consumer<MainProvider>(
                          builder: (context,value,child) {
                            return InkWell(
                                onTap: () {
                                  value.makingPhoneCall(staff.phone);
                                },
                                child: Image.asset("assets/phone.png"));
                          }
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: height / 20,
                    width: width / 8,
                    decoration: BoxDecoration(
                      color: AppColors.spotColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Consumer<MainProvider>(
                          builder: (context,value,child) {
                            return InkWell(
                                onTap: () {
                                  value.launchWhatsApp(phoneNumber: staff.phone, message: "How can I help You?");
                                },
                                child: Image.asset("assets/customerwhatsup.png"));
                          }
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StaffDetailRow extends StatelessWidget {
  final String title;
  final String value;

  const StaffDetailRow({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: const TextStyle(color: Colors.white)),
        const SizedBox(width: 5),
        const Text(":", style: TextStyle(color: Colors.white)),
        const SizedBox(width: 10),
        Text(value, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

class StaffActionButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;

  const StaffActionButton({
    required this.title,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width / 3.55,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}





