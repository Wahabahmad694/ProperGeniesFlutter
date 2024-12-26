import 'dart:convert';

LoginResponseBody loginResponseBodyFromJson(String str) =>
    LoginResponseBody.fromJson(json.decode(str));

String loginResponseBodyToJson(LoginResponseBody data) =>
    json.encode(data.toJson());

class LoginResponseBody {
  LoginResponseBody({
    this.user,
    this.token,
  });

  LoginResponseBody.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.role,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  User.fromJson(dynamic json) {
    id = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    role = json['role'];
    isVerified = json['isVerified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    v = json['__v'];
  }

  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? role;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['fullName'] = fullName;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['role'] = role;
    map['isVerified'] = isVerified;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
