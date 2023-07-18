import 'dart:convert';
import 'dart:io';

import 'package:yusroom_mobile/model/room_model.dart';
import 'package:yusroom_mobile/model/time_model.dart';
import 'package:yusroom_mobile/utils/constants.dart';
import 'package:http/http.dart' as http;

class BookingService {
  Future<Room> getRoom(String roomId) async {
    var url = Uri.parse("${Constants.apiUrl}/booking/room/$roomId");
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer 153|q8oADO0WBQNVnCLVHHnQwjmAYSFXq2H7KNXNLJsO"
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData['data']['room'];
      var room = Room.fromJson(data);
      return room;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  Future<List<Time>> getRoomTime(String roomId) async {
    var url = Uri.parse("${Constants.apiUrl}/booking/room/$roomId");
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer 153|q8oADO0WBQNVnCLVHHnQwjmAYSFXq2H7KNXNLJsO"
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData['data']['times'] as List<dynamic>;
      var times = data.map((e) => Time.fromJson(e)).toList();
      return times;
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}
