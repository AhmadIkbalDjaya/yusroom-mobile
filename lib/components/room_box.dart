import 'package:flutter/material.dart';
import 'package:yusroom_mobile/model/room_model.dart';
import 'package:yusroom_mobile/pages/booking_page.dart';

class RoomBox extends StatelessWidget {
  const RoomBox({super.key, required this.room});
  final Room room;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookingPage(roomId: "${room.id}"),
          ),
        );
      },
      child: Container(
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
            Image.network(
              "${room.image}",
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${room.name}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${room.description}",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
