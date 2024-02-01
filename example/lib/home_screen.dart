import 'package:booking_card_layout/tv_theme.dart';
import 'package:example/bus_layouts.dart';
import 'package:example/hotel_layouts.dart';
import 'package:example/taxi_layouts.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens =[const TaxiCardLayouts(),const HotelCardLayout(), const BusLayouts()];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: TVTheme.secondColor,
        currentIndex: index,
        selectedItemColor: Colors.white,
        onTap: (i){
          setState(() {
            index=i;
          });
        },
        items: const[
           BottomNavigationBarItem(
              icon:Icon( Icons.local_taxi),
            label: "Taxi",
          ),
           BottomNavigationBarItem(
              icon:Icon( Icons.hotel),
            label: "Hotel",
          ),
           BottomNavigationBarItem(
              icon:Icon( Icons.bus_alert_outlined),
            label: "Bus",
          ),
        ],
      ),
      body: IndexedStack(
        index: index,
        children: screens,
      ),
    );
  }
}
