import 'package:flutter/material.dart';
import 'package:yusroom_mobile/api/booking_service.dart';
import 'package:yusroom_mobile/components/booking_box.dart';
import 'package:yusroom_mobile/components/my_drawer.dart';
import 'package:yusroom_mobile/model/booking_model.dart';

class MyBookingPage extends StatefulWidget {
  const MyBookingPage({super.key});

  @override
  State<MyBookingPage> createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage> {
  final bookingService = BookingService();
  List<Booking> bookings = [];

  Future<dynamic> getBooking() async {
    var response = await bookingService.getUserBooking();
    setState(() {
      bookings = response;
    });
  }

  @override
  void initState() {
    super.initState();
    getBooking();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          var booking = bookings[index];
          return BookingBox(
            booking: booking,
            fetchBooking: getBooking,
          );
        },
      ),
    );
  }
}
