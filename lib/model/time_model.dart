class Time {
  int? id;
  String? startTime;
  String? endTime;
  bool? isBooking;

  Time({this.id, this.startTime, this.endTime, this.isBooking});

  Time.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    isBooking = json['is_booking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['is_booking'] = this.isBooking;
    return data;
  }
}
