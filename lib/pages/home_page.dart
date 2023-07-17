import 'package:flutter/material.dart';
import 'package:yusroom_mobile/components/my_drawer.dart';
import 'package:yusroom_mobile/components/room_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(),
      body: ListView(
        children: const [
          RoomBox(),
          RoomBox(),
          RoomBox(),
          RoomBox(),
          RoomBox(),
        ],
      ),
    );
  }
}
