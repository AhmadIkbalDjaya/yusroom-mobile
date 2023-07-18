import 'package:flutter/material.dart';
import 'package:yusroom_mobile/api/booking_service.dart';
import 'package:yusroom_mobile/components/time_box.dart';
import 'package:yusroom_mobile/model/room_model.dart';
import 'package:yusroom_mobile/model/time_model.dart';
import 'package:yusroom_mobile/pages/my_booking_page.dart';

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
  // late String startTime;
  // late String endTime;
  Time selectTime = Time();
  final descriptionController = TextEditingController();

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

  Future<dynamic> booking() async {
    String roomIdData = widget.roomId;
    String startTimeData = selectTime.startTime.toString();
    String endTimeData = selectTime.endTime.toString();
    String descriptionData = descriptionController.text;

    try {
      var result = await bookingService.booking(
          roomIdData, startTimeData, endTimeData, descriptionData);
      return true;
    } catch (e) {
      throw Exception("Failed Fetch Data");
      // return false;
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
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (time.isBooking != true) {
                                  setState(() {
                                    selectTime = time;
                                  });
                                }
                              },
                              child: TimeBox(time: time),
                            ),
                            selectTime.id == time.id
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    width: 90,
                                    height: 100,
                                    color: Colors.yellow.withOpacity(.3),
                                  )
                                : const SizedBox(),
                            time.isBooking == true
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    width: 90,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.7),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        );
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
                const Text(
                  "Deskripsi Booking",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 35,
                  child: TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    var result = booking();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyBookingPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 35),
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
