class UserData {
  Data? data;
  int? auth;
  bool? success;
  String? message;

  UserData({this.data, this.auth, this.success, this.message});

  UserData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    auth = json['auth'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['auth'] = auth;
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class Data {
  String? id;
  String? planId;
  String? image;
  String? name;
  String? email;
  String? phone;
  String? city;
  String? address;
  String? currentLat;
  String? currentLong;
  String? fcmToken;
  String? deviceType;
  String? referalCode;
  String? referalId;
  String? planTakenAt;
  String? expiryDate;
  String? planFuelCount;
  String? status;
  String? datetime;

  Data(
      {this.id,
        this.planId,
        this.image,
        this.name,
        this.email,
        this.phone,
        this.city,
        this.address,
        this.currentLat,
        this.currentLong,
        this.fcmToken,
        this.deviceType,
        this.referalCode,
        this.referalId,
        this.planTakenAt,
        this.expiryDate,
        this.planFuelCount,
        this.status,
        this.datetime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planId = json['plan_id'];
    image = json['image'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    city = json['city'];
    address = json['address'];
    currentLat = json['current_lat'];
    currentLong = json['current_long'];
    fcmToken = json['fcm_token'];
    deviceType = json['device_type'];
    referalCode = json['referal_code'];
    referalId = json['referal_id'];
    planTakenAt = json['plan_taken_at'];
    expiryDate = json['expiry_date'];
    planFuelCount = json['plan_fuel_count'];
    status = json['status'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['plan_id'] = planId;
    data['image'] = image;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['city'] = city;
    data['address'] = address;
    data['current_lat'] = currentLat;
    data['current_long'] = currentLong;
    data['fcm_token'] = fcmToken;
    data['device_type'] = deviceType;
    data['referal_code'] = referalCode;
    data['referal_id'] = referalId;
    data['plan_taken_at'] = planTakenAt;
    data['expiry_date'] = expiryDate;
    data['plan_fuel_count'] = planFuelCount;
    data['status'] = status;
    data['datetime'] = datetime;
    return data;
  }
}
