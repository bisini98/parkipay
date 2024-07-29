import 'package:flutter/material.dart';
import 'package:parkipay/Model/ModelClass.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:provider/provider.dart';

// class StaffInprocess extends StatelessWidget {
//   const StaffInprocess({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: AppColors.btn1Color,
//       body: Consumer<MainProvider>(
//         builder: (context22, value, child) {
//           var inProcessUsers = value.userTicketSlotList.where((slot) => slot.status == "CHECK IN").toList();
//           return ListView.builder(
//
//
//           padding: EdgeInsets.all(10),
//             itemCount: inProcessUsers.length,
//             itemBuilder: (context12, index) {
//               print("fvff" + value.userTicketSlotList.length.toString());
//               final ticketslotModel = inProcessUsers[index];
//
//               return Container(
//                 margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                 decoration: BoxDecoration(
//                   color: AppColors.navigationColor,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Text("Name", style: TextStyle(color: Colors.white)),
//                                 SizedBox(width: 5),
//                                 Text(":", style: TextStyle(color: Colors.white)),
//                                 SizedBox(width: 10),
//                                 Text(ticketslotModel.userName, style: TextStyle(color: Colors.white)),
//                               ],
//                             ),
//                             SizedBox(height: 5),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Phone", style: TextStyle(color: Colors.white)),
//                                 SizedBox(width: 5),
//                                 Text(":", style: TextStyle(color: Colors.white)),
//                                 SizedBox(width: 10),
//                                 Text(ticketslotModel.phone, style: TextStyle(color: Colors.white)),
//                               ],
//                             ),
//                             SizedBox(height: 20),
//                             Row(
//                               children: [
//                                 Text("Slot No", style: TextStyle(color: Colors.white)),
//                                 SizedBox(width: 5),
//                                 Text(":", style: TextStyle(color: Colors.white)),
//                                 SizedBox(width: 10),
//                                 Container(
//                                   height: height / 30,
//                                   width: width / 8,
//                                   decoration: BoxDecoration(
//                                     color: AppColors.bgColor,
//                                   ),
//                                   child: Center(
//                                     child: Text(ticketslotModel.fieldName, style: TextStyle(color: Colors.white)),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 15),
//                             InkWell(
//                               onTap: () {
//                                 print("dsgkklgh" + ticketslotModel.id);
//                                 value.checkOut(ticketslotModel.id);
//                                 value.updateSlotTicket(ticketslotModel.fieldName,ticketslotModel.mapId,ticketslotModel.mapType,context);
//
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 15),
//                                 child: Container(
//                                   height: height / 15,
//                                   width: width / 3.55,
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xffC62727),
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   child: Center(
//                                     child: Text("Check Out", style: TextStyle(color: Colors.white)),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             height: height / 20,
//                             width: width / 8,
//                             decoration: BoxDecoration(
//                               color: AppColors.spotColor,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Center(
//                               child: Consumer<MainProvider>(
//                                 builder: (context,value,child) {
//                                   return InkWell(
//                                     onTap: () {
//                                       value.makingPhoneCall(ticketslotModel.phone);
//                                     },
//                                       child: Image.asset("assets/phone.png"));
//                                 }
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Container(
//                             height: height / 20,
//                             width: width / 8,
//                             decoration: BoxDecoration(
//                               color: AppColors.spotColor,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Center(
//                               child: Consumer<MainProvider>(
//                                 builder: (context,value,child) {
//                                   return InkWell(
//                                     onTap: () {
//                                       value.launchWhatsApp(phoneNumber: ticketslotModel.phone, message: "How can I help You?");
//                                     },
//                                       child: Image.asset("assets/customerwhatsup.png"));
//                                 }
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }


class StaffInprocess extends StatelessWidget {
  const StaffInprocess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: Consumer<MainProvider>(
        builder: (context22, value, child) {
          var inProcessUsers = value.userTicketSlotList.where((slot) => slot.status == "CHECK IN").toList();
          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: inProcessUsers.length,
            itemBuilder: (context12, index) {
              print("fvff" + value.userTicketSlotList.length.toString());
              final ticketslotModel = inProcessUsers[index];

              return Container(
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
                                Text(ticketslotModel.userName, style: TextStyle(color: Colors.white)),
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
                                Text(ticketslotModel.phone, style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text("Slot No", style: TextStyle(color: Colors.white)),
                                SizedBox(width: 5),
                                Text(":", style: TextStyle(color: Colors.white)),
                                SizedBox(width: 10),
                                Container(
                                  height: height / 30,
                                  width: width / 8,
                                  decoration: BoxDecoration(
                                    color: AppColors.bgColor,
                                  ),
                                  child: Center(
                                    child: Text(ticketslotModel.fieldName, style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            InkWell(
                              onTap: () {
                                print("dsgkklgh" + ticketslotModel.id);
                                value.checkOut(ticketslotModel.id);
                                value.updateSlotTicket(ticketslotModel.fieldName,ticketslotModel.mapId,ticketslotModel.mapType,context);
                                ticketslotModel.checkoutDate = DateTime.now();
                                // update the status to CHECK OUT
                                ticketslotModel.status = "CHECK OUT";
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  height: height / 15,
                                  width: width / 3.55,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffC62727),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text("Check Out", style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                            ),
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
                                          value.makingPhoneCall(ticketslotModel.phone);
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
                                          value.launchWhatsApp(phoneNumber: ticketslotModel.phone, message: "How can I help You?");
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
              );
            },
          );
        },
      ),
    );
  }
}



