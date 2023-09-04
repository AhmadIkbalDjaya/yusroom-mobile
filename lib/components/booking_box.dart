import 'package:flutter/material.dart';
import 'package:yusroom_mobile/api/booking_service.dart';
import 'package:yusroom_mobile/model/booking_model.dart';

class BookingBox extends StatelessWidget {
  BookingBox({super.key, required this.booking, required this.fetchBooking});
  final Booking booking;
  final Function fetchBooking;
  final bookingService = BookingService();

  Future<dynamic> deleteBooking(String id) async {
    await bookingService.deleteBooking(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey,
            height: 200,
            child: Image.network(
              "${booking.roomImage}",
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${booking.roomName}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${booking.description}",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "${booking.startTime} - ${booking.endTime}",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: booking.isApproved == "1"
                                ? Colors.green
                                : (booking.isApproved == "0"
                                    ? Colors.red
                                    : Colors.amber),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            booking.isApproved == "1"
                                ? "Disetujui"
                                : (booking.isApproved == "0"
                                    ? "Ditolak"
                                    : "Pending"),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        booking.isApproved != "1"
                            ? IconButton(
                                onPressed: () {
                                  deleteBooking(booking.id.toString());
                                  fetchBooking();
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
