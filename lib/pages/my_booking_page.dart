import 'package:flutter/material.dart';
import 'package:yusroom_mobile/components/booking_box.dart';
import 'package:yusroom_mobile/components/my_drawer.dart';

class MyBookingPage extends StatelessWidget {
  const MyBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          BookingBox(),
        ],
      ),
    );
  }
}
