import 'dart:convert';
import 'dart:io';

import 'package:yusroom_mobile/model/booking_model.dart';
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
          "Bearer 32|GiI34OwS0X4pYVC8DrQxaFkbes6b48QUlGQQX2SF"
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
          "Bearer 32|GiI34OwS0X4pYVC8DrQxaFkbes6b48QUlGQQX2SF"
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

  Future<dynamic> booking(String roomId, String startTime, String endTime,
      String description) async {
    var url = Uri.parse("${Constants.apiUrl}/booking");
    var bodyPost = {
      "room_id": roomId,
      "start_time": startTime,
      "end_time": endTime,
      "description": description
    };
    var response = await http.post(url, body: bodyPost, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer 32|GiI34OwS0X4pYVC8DrQxaFkbes6b48QUlGQQX2SF"
    });
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> getUserBooking() async {
    var url = Uri.parse("${Constants.apiUrl}/myBooking");
    try {
      var response = await http.get(url, headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Bearer 32|GiI34OwS0X4pYVC8DrQxaFkbes6b48QUlGQQX2SF",
      });
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var bookingList = jsonData["data"] as List<dynamic>;
        var bookings = bookingList.map((e) => Booking.fromJson(e)).toList();
        return bookings;
      }
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> deleteBooking(bookingId) async {
    var url = Uri.parse("${Constants.apiUrl}/booking/$bookingId");
    try {
      var response = await http.delete(url, headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Bearer 32|GiI34OwS0X4pYVC8DrQxaFkbes6b48QUlGQQX2SF",
      });
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
