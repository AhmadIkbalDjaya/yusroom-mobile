import 'package:flutter/material.dart';
import 'package:yusroom_mobile/api/booking_service.dart';
import 'package:yusroom_mobile/components/time_box.dart';
import 'package:yusroom_mobile/model/room_model.dart';
import 'package:yusroom_mobile/model/time_model.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key, required this.roomId});
  final String roomId;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final bookingService = BookingService();
  Room room = Room();
  List<Time> times = [];
  

  Future<dynamic> fetchRoom() async {
    try {
      Room fetchRoom = await bookingService.getRoom(widget.roomId);
      setState(() {
        room = fetchRoom;
      });
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }

  Future<dynamic> fetchTime() async {
    try {
      List<Time> fetchTime = await bookingService.getRoomTime(widget.roomId);
      setState(() {
        times = fetchTime;
      });
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchRoom();
    fetchTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          room.image != null
              ? Stack(
                  children: [
                    Image.network(
                      "${room.image}",
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: const EdgeInsets.only(bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${room.name}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "${room.description}",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 5),
          const Text(
            "Pilih Jadwal",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Column(
            children: [
              const Divider(),
              SizedBox(
                height: 38,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: times.map(
                      (time) {
                        return TimeBox(time: time);
                      },
                    ).toList(),
                  ),
                ),
              ),
              const Divider(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deskripsi Booking",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 35,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 35),
                  ),
                  child: const Text("Booking"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
