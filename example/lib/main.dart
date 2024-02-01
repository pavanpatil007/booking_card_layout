import 'package:booking_card_layout/taxi_card_layout.dart';
import 'package:booking_card_layout/bus_booking_layout.dart';
import 'package:booking_card_layout/hotel_card_layout.dart';
import 'package:booking_card_layout/tv_theme.dart';
import 'package:example/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Layouts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TVTheme.primaryColor),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class AllCards extends StatelessWidget {
  const AllCards({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("All Card Layouts",style: TextStyle(color: Colors.black),),backgroundColor: TVTheme.secondColor,),
      body: ListView(
        children: [
          const Text("Taxi Card Layout",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
          TaxiCardLayout(
              context: context,
              referenceNo: '123',
              tourType: 'Local',
              assessmentCode: 'TVTEST56564',
              pickupDatetime: '2024-10-10 12:10:00',
              pickupLocation: 'Supreme Headquarters',
              dropLocation: '18 Highstreet, Baner-Pashan Link Road',
              statusCompany: 'Approved',
              passengerList: [],
              statusTv: 'Accepted',
              onAssignTap: (){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Clicked On Assign")));
                },
              onAcceptTap: (){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Clicked On Accept")));
                },
              onRejectTap: (){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Clicked On Reject")));
              }).approverNew(),
          const Text("Hotel Card Layout",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
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
          const Text("Bus Card Layout",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
          BusCardLayout(context: context, referenceNo: '123', assessmentCode: 'TVTEST56564', pickupDatetime: '2024-10-10 12:10:00', pickupLocation: 'Supreme Headquarters', dropLocation: '18 Highstreet, Baner-Pashan Link Road', statusCompany: 'Approved', statusTv: 'Accepted', people: [], spocName: 'Pavan Patil',).normal(),
        ],
      ),
    );
  }
}



