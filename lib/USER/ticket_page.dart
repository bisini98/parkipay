import 'package:flutter/material.dart';
import 'package:parkipay/Provider/MainProvider.dart';
import 'package:parkipay/USER/payments.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:provider/provider.dart';
import '../constant/refactoring.dart';
import 'package:intl/intl.dart';



// class Tickets extends StatelessWidget {
//   const Tickets({super.key});
//
//   // Helper function to extract lane and position
//   Map<String, String> getLaneAndPosition(String fieldName) {
//     String lane = fieldName.replaceAll(RegExp(r'\d'), ''); // Removes all digits
//     String position = fieldName.replaceAll(RegExp(r'\D'), ''); // Removes all non-digits
//     return {
//       'lane': lane,
//       'position': position,
//     };
//   }
//
//   // Helper function to format the date
//   String getDate(DateTime date) {
//     return DateFormat('h.mm a').format(date);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: AppColors.btn1Color,
//       body: SingleChildScrollView(
//         physics: NeverScrollableScrollPhysics(),
//         child: Column(
//           children: [
//             quarterContainer(height / 1, width, "Tickets"),
//             SizedBox(
//               height: height / 1.22,
//               child: Consumer<MainProvider>(
//                 builder: (context, value, child) {
//                   return ListView.builder(
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                     physics: ScrollPhysics(),
//                     itemCount: value.ticketslotList.length,
//                     shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//                     itemBuilder: (context, index) {
//                       var ticket = value.ticketslotList[index];
//                       var laneAndPosition = getLaneAndPosition(ticket.fieldName);
//                       var formattedDate = getDate(ticket.date);
//
//                       return Container(
//                         margin: EdgeInsets.only(bottom: 15),
//                         height: height / 2.60,
//                         width: width / 1.20,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Container(
//                               height: height / 10,
//                               width: height / 10,
//                               decoration: BoxDecoration(
//                                 color: AppColors.spotColor,
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   ticket.fieldName,
//                                   style: TextStyle(
//                                     color: AppColors.bgColor,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 25,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             IntrinsicHeight(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Icon(
//                                         Icons.alarm,
//                                         color: AppColors.bgColor,
//                                       ),
//                                       SizedBox(height: 5),
//                                       Text(
//                                         formattedDate,
//                                         style: TextStyle(color: AppColors.bgColor),
//                                       ),
//                                     ],
//                                   ),
//                                   VerticalDivider(
//                                     color: AppColors.bgColor,
//                                     width: 20,
//                                     thickness: 1,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Parking Details:",
//                                         style: TextStyle(color: AppColors.bgColor),
//                                       ),
//                                       SizedBox(height: 5),
//                                       IntrinsicHeight(
//                                         child: Row(
//                                           children: [
//                                             Text(
//                                               'Floor ${ticket.floorName}',
//                                               style: TextStyle(
//                                                 color: AppColors.bgColor,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             VerticalDivider(
//                                               color: AppColors.bgColor,
//                                               width: 20,
//                                               thickness: 2,
//                                             ),
//                                             Text(
//                                               'Lane ${laneAndPosition['lane']}',
//                                               style: TextStyle(
//                                                 color: AppColors.bgColor,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             VerticalDivider(
//                                               color: AppColors.bgColor,
//                                               width: 20,
//                                               thickness: 2,
//                                             ),
//                                             Text(
//                                               'Pos. ${laneAndPosition['position']}',
//                                               style: TextStyle(
//                                                 color: AppColors.bgColor,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "Free parking for first 30 mins, afterwards ₹8/hr",
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: AppColors.bgColor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Consumer<MainProvider>(
//                               builder: (context, value, child) {
//                                 return InkWell(
//                                   onTap: () {
//                                     print("cmm");
//                                     value.getUserTicketSlots();
//                                     Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSlip(checkinDate: ticket.date,checkoutDate: ticket.checkoutDate, fieldName: ticket.fieldName,),
//                                       ),
//                                     );
//                                   },
//                                   child: Text(
//                                     "Pay at exit",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       color: AppColors.bgColor,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//              SizedBox(height: 20),
//             fillbtn(width / 1.22, height / 15, AppColors.btnColor, "View All", Colors.white),
//           ],
//         ),
//       ),
//     );
//   }
// }


class Tickets extends StatelessWidget {
  const Tickets({super.key});

  // Helper function to extract lane and position
  Map<String, String> getLaneAndPosition(String fieldName) {
    String lane = fieldName.replaceAll(RegExp(r'\d'), ''); // Removes all digits
    String position = fieldName.replaceAll(RegExp(r'\D'), ''); // Removes all non-digits
    return {
      'lane': lane,
      'position': position,
    };
  }

  // Helper function to format the date
  String getDate(DateTime date) {
    return DateFormat('h.mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            quarterContainer(height / 1, width, "Tickets"),
            SizedBox(
              height: height / 1.22,
              child: Consumer<MainProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    physics: ScrollPhysics(),
                    itemCount: value.ticketslotList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      var ticket = value.ticketslotList[index];
                      var laneAndPosition = getLaneAndPosition(ticket.fieldName);
                      var formattedDate = getDate(ticket.date);

                      return Container(
                        margin: EdgeInsets.only(bottom: 15),
                        height: height / 2.60,
                        width: width / 1.20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: height / 10,
                              width: height / 10,
                              decoration: BoxDecoration(
                                color: AppColors.spotColor,
                              ),
                              child: Center(
                                child: Text(
                                  ticket.fieldName,
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
                                      Icon(
                                        Icons.alarm,
                                        color: AppColors.bgColor,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        formattedDate,
                                        style: TextStyle(color: AppColors.bgColor),
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(
                                    color: AppColors.bgColor,
                                    width: 20,
                                    thickness: 1,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Parking Details:",
                                        style: TextStyle(color: AppColors.bgColor),
                                      ),
                                      SizedBox(height: 5),
                                      IntrinsicHeight(
                                        child: Row(
                                          children: [
                                            Text(
                                              'Floor ${ticket.floorName}',
                                              style: TextStyle(
                                                color: AppColors.bgColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            VerticalDivider(
                                              color: AppColors.bgColor,
                                              width: 20,
                                              thickness: 2,
                                            ),
                                            Text(
                                              'Lane ${laneAndPosition['lane']}',
                                              style: TextStyle(
                                                color: AppColors.bgColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            VerticalDivider(
                                              color: AppColors.bgColor,
                                              width: 20,
                                              thickness: 2,
                                            ),
                                            Text(
                                              'Pos. ${laneAndPosition['position']}',
                                              style: TextStyle(
                                                color: AppColors.bgColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Free parking for first 30 mins, afterwards ₹8/hr",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.bgColor,
                                  ),
                                ),
                              ],
                            ),
                            Consumer<MainProvider>(
                              builder: (context, value, child) {
                                if (ticket.status == "CHECK IN") {
                                  return ElevatedButton(
                                    onPressed: () {
                                      value.requestPayment(ticket.id);
                                      print("object"+ticket.status);
                                    },
                                    child: Text(
                                      "Request Payment",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.bgColor,
                                      ),
                                    ),
                                  );
                                } else if (ticket.status == "REQUEST_PAYMENT") {
                                  return Text(
                                    "Waiting for staff approval",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.bgColor,
                                    ),
                                  );
                                } else {
                                  return InkWell(
                                    onTap: () {
                                      print("cmm");
                                      value.getUserTicketSlots();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PaymentSlip(
                                            checkinDate: ticket.date,
                                            checkoutDate: ticket.checkoutDate,
                                            fieldName: ticket.fieldName,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Pay at exit",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.bgColor,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            fillbtn(width / 1.22, height / 15, AppColors.btnColor, "View All", Colors.white),
          ],
        ),
      ),
    );
  }
}


