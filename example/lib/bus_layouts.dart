import 'package:booking_card_layout/bus_booking_layout.dart';
import 'package:booking_card_layout/tv_theme.dart';
import 'package:flutter/material.dart';

class BusLayouts extends StatefulWidget {
  const BusLayouts({super.key});

  @override
  State<BusLayouts> createState() => _BusLayoutsState();
}

class _BusLayoutsState extends State<BusLayouts> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Bus Card Layout Examples",style: TextStyle(color: Colors.white,fontSize: 18),),backgroundColor: TVTheme.secondColor,),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5,bottom: 5),
            color: TVTheme.secondColor.withOpacity(0.5),
            alignment: Alignment.center,
            height: 45,
            child: const Text(
              "Normal Bus Card Example",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),
            ),
          ),
          BusCardLayout(context: context, referenceNo: '123', assessmentCode: 'TVTEST56564', pickupDatetime: '2024-10-10 12:10:00', pickupLocation: 'Supreme Headquarters', dropLocation: '18 Highstreet, Baner-Pashan Link Road', statusCompany: 'Approved', statusTv: 'Accepted', people: [], spocName: 'Pavan Patil',).normal(),
          Container(
            margin: const EdgeInsets.only(top: 5,bottom: 5),
            color: TVTheme.secondColor.withOpacity(0.5),
            alignment: Alignment.center,
            height: 45,
            child: const Text(
              "Agent Card / Accept-Reject",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18
              ),
            ),
          ),
          BusCardLayout(context: context, referenceNo: '123', assessmentCode: 'TVTEST56564', pickupDatetime: '2024-10-10 12:10:00', pickupLocation: 'Supreme Headquarters', dropLocation: '18 Highstreet, Baner-Pashan Link Road', statusCompany: 'Approved', statusTv: 'Pending', people: [], spocName: 'Pavan Patil',onAcceptTap: (){},onRejectTap: (){}).newBookingAgent(),
          Container(
            margin: const EdgeInsets.only(top: 5,bottom: 5),
            color: TVTheme.secondColor.withOpacity(0.5),
            alignment: Alignment.center,
            height: 45,
            child:  const Text(
              "Agent Card / Assign",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18
              ),
            ),
          ),
          BusCardLayout(context: context, referenceNo: '123', assessmentCode: 'TVTEST56564', pickupDatetime: '2024-10-10 12:10:00', pickupLocation: 'Supreme Headquarters', dropLocation: '18 Highstreet, Baner-Pashan Link Road', statusCompany: 'Approved', statusTv: 'Accepted', people: [], spocName: 'Pavan Patil',onAssignTap: (){}).newBookingAgent(),
          Container(
            margin: const EdgeInsets.only(top: 5,bottom: 5),
            color: TVTheme.secondColor.withOpacity(0.5),
            alignment: Alignment.center,
            height: 45,
            child: const Text(
              "Approver Card / Approve-Reject",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18
              ),
            ),
          ),
          BusCardLayout(context: context, referenceNo: '123', assessmentCode: 'TVTEST56564', pickupDatetime: '2024-10-10 12:10:00', pickupLocation: 'Supreme Headquarters', dropLocation: '18 Highstreet, Baner-Pashan Link Road', statusCompany: 'Approved', statusTv: 'Accepted', people: [], spocName: 'Pavan Patil',onApproveTap: (){},onRejectTap: (){}).newBookingApprover(),
        ],
      ),
    );
  }
}
