import 'dart:convert';
import 'dart:io';

import 'package:yusroom_mobile/model/room_model.dart';
import 'package:yusroom_mobile/utils/constants.dart';
import 'package:http/http.dart' as http;

class RoomService {
  Future<List<Room>> getAllRoom() async {
    var url = Uri.parse("${Constants.apiUrl}/room");
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer 32|GiI34OwS0X4pYVC8DrQxaFkbes6b48QUlGQQX2SF"
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var roomList = jsonData["data"] as List<dynamic>;
      var rooms = roomList.map((e) => Room.fromJson(e)).toList();
      return rooms;
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}
