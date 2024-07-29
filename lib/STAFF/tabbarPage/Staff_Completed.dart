import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:parkipay/constant/AppConstants.dart';
import 'package:provider/provider.dart';

import '../../Provider/MainProvider.dart';



class StaffCompleted extends StatelessWidget {
  const StaffCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.btn1Color,
      body: Consumer<MainProvider>(
        builder: (context, value, child) {
          var completedTickets = value.userTicketSlotList.where((ticket) => ticket.status == "CHECK OUT").toList();
          return ListView.builder(
            itemCount: completedTickets.length,
            itemBuilder: (context, index) {
              final ticketslotModel = completedTickets[index];

              return Container(
                height: height / 4.2, // Adjusted height to fit within ListView
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.navigationColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Date", style: TextStyle(color: Colors.yellow,fontSize: 15,fontWeight: FontWeight.w500)),
                          SizedBox(width: 5),
                          Text(":", style: TextStyle(color: Colors.yellow)),
                          SizedBox(width: 10),
                          Flexible(
                            child: Consumer<MainProvider>(
                              builder: (context,value,child) {
                                return Text(DateFormat('dd.MM.yyyy    hh:mm a').format(ticketslotModel.checkoutDate), style: TextStyle(color: Colors.yellow,fontSize: 15,fontWeight: FontWeight.w500));
                              }
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text("Name", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 5),
                          Text(":", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(ticketslotModel.userName, style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text("Phone", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 5),
                          Text(":", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(ticketslotModel.phone, style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text("Ticket No", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 5),
                          Text(":", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(ticketslotModel.id, style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      Spacer(),
                      Center(
                        child: InkWell(
                          onTap: () {
                            print("Checked out ID: ${ticketslotModel.id}");
                            value.checkOut(ticketslotModel.id);
                          },
                          child: Text(ticketslotModel.fieldName, style: TextStyle(color: Color(0xff0b833d), fontWeight: FontWeight.w800, fontSize: 25)),
                        ),
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





