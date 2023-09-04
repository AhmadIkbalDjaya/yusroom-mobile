import 'package:flutter/material.dart';
import 'package:yusroom_mobile/api/room_service.dart';
import 'package:yusroom_mobile/components/my_drawer.dart';
import 'package:yusroom_mobile/components/room_box.dart';
import 'package:yusroom_mobile/model/room_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final roomService = RoomService();
  List<Room> rooms = [];

  Future<dynamic> fetchAllRoom() async {
    try {
      List<Room> roomData = await roomService.getAllRoom();
      setState(() {
        rooms = roomData;
      });
    } catch (e) {
      throw Exception("Failed to fetch data");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllRoom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          var room = rooms[index];
          return RoomBox(room: room);
        },
      ),
    );
  }
}
