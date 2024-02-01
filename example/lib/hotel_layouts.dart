import 'package:booking_card_layout/hotel_card_layout.dart';
import 'package:booking_card_layout/tv_theme.dart';
import 'package:flutter/material.dart';

class HotelCardLayout extends StatefulWidget {
  const HotelCardLayout({super.key});

  @override
  State<HotelCardLayout> createState() => _HotelCardLayoutState();
}

class _HotelCardLayoutState extends State<HotelCardLayout> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Hotel Card Layout Examples",style: TextStyle(color: Colors.white,fontSize: 18),),backgroundColor: TVTheme.secondColor,),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5,bottom: 5),
            color: TVTheme.secondColor.withOpacity(0.5),
            alignment: Alignment.center,
            height: 45,
            child: const Text(
              "Normal Taxi Card Example",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),
            ),
          ),
          HotelBookingLayout(
              context: context,
              referenceNo: "123",
              city: "Pune",
              assCode: "TVTEST56564",
              arrivalDatetime: "2024-02-10 12:23",
              depDatetime: "2024-02-12 12:23",
              statusCompany: "Approved",
              people: [],
              statusTv: "Accepted",
              userName: "Demo Spoc",
              onRejectTap: (){},
              onAcceptTap: (){},
              onAssignTap: (){}).normal(),
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
          HotelBookingLayout(
              context: context,
              referenceNo: "123",
              city: "Pune",
              assCode: "TVTEST56564",
              arrivalDatetime: "2024-02-10 12:23",
              depDatetime: "2024-02-12 12:23",
              statusCompany: "Approved",
              people: [],
              statusTv: "Pending",
              userName: "Demo Spoc",
              onRejectTap: (){},
              onAcceptTap: (){},
              onAssignTap: (){}).newBookingAgent(),
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
          HotelBookingLayout(
              context: context,
              referenceNo: "123",
              city: "Pune",
              assCode: "TVTEST56564",
              arrivalDatetime: "2024-02-10 12:23",
              depDatetime: "2024-02-12 12:23",
              statusCompany: "Approved",
              people: [],
              statusTv: "Accepted",
              userName: "Demo Spoc",
              onRejectTap: (){},
              onAcceptTap: (){},
              onAssignTap: (){}).newBookingAgent(),
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
          HotelBookingLayout(
              context: context,
              referenceNo: "123",
              city: "Pune",
              assCode: "TVTEST56564",
              arrivalDatetime: "2024-02-10 12:23",
              depDatetime: "2024-02-12 12:23",
              statusCompany: "Approved",
              people: [],
              statusTv: "Accepted",
              userName: "Demo Spoc",
              onRejectTap: (){},
              onApproveTap: (){}
          ).newBookingApprover(),
        ],
      ),
    );
  }
}
