import 'dart:convert';
RegistrationResponseBody registrationResponseBodyFromJson(String str) => RegistrationResponseBody.fromJson(json.decode(str));
String registrationResponseBodyToJson(RegistrationResponseBody data) => json.encode(data.toJson());
class RegistrationResponseBody {
  RegistrationResponseBody({
      this.message, 
      this.user,});

  RegistrationResponseBody.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? message;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      this.fullName, 
      this.email, 
      this.phoneNumber, 
      this.password, 
      this.role, 
      this.isVerified, 
      this.favoriteProperties, 
      this.id, 
      this.otp, 
      this.otpExpiresAt, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  User.fromJson(dynamic json) {
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    role = json['role'];
    isVerified = json['isVerified'];
    if (json['favoriteProperties'] != null) {
      favoriteProperties = [];
      json['favoriteProperties'].forEach((v) {
        favoriteProperties?.add(v);
      });
    }
    id = json['_id'];
    otp = json['otp'];
    otpExpiresAt = json['otpExpiresAt'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    v = json['__v'];
  }
  String? fullName;
  String? email;
  String? phoneNumber;
  String? password;
  String? role;
  bool? isVerified;
  List<dynamic>? favoriteProperties;
  String? id;
  String? otp;
  String? otpExpiresAt;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = fullName;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    map['role'] = role;
    map['isVerified'] = isVerified;
    if (favoriteProperties != null) {
      map['favoriteProperties'] = favoriteProperties?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    map['otp'] = otp;
    map['otpExpiresAt'] = otpExpiresAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}