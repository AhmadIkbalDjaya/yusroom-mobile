class Booking {
  int? id;
  String? userName;
  String? roomName;
  String? roomImage;
  String? bookingDate;
  String? startTime;
  String? endTime;
  String? isApproved;
  String? description;
  String? createdAt;
  String? updatedAt;

  Booking(
      {this.id,
      this.userName,
      this.roomName,
      this.roomImage,
      this.bookingDate,
      this.startTime,
      this.endTime,
      this.isApproved,
      this.description,
      this.createdAt,
      this.updatedAt});

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    roomName = json['room_name'];
    roomImage = json['room_image'];
    bookingDate = json['booking_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    isApproved = json['is_approved'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['room_name'] = this.roomName;
    data['room_image'] = this.roomImage;
    data['booking_date'] = this.bookingDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['is_approved'] = this.isApproved;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
