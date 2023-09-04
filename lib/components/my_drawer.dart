import 'package:flutter/material.dart';
import 'package:yusroom_mobile/pages/home_page.dart';
import 'package:yusroom_mobile/pages/my_booking_page.dart';
import 'package:yusroom_mobile/pages/profile_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            height: 200,
            color: Colors.blue,
            child: Column(
              children: [
                Expanded(child: Container()),
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ahmad Ikbal Djaya",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Mahasiswa",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.home_rounded,
                        size: 28,
                      ),
                      SizedBox(width: 15),
                      Text("Home"),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyBookingPage(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.meeting_room,
                        size: 28,
                      ),
                      SizedBox(width: 15),
                      Text("My Booking"),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.logout,
                        size: 28,
                      ),
                      SizedBox(width: 15),
                      Text("Logout"),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
