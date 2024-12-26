import 'dart:convert';
RegistrationRequestBody registrationRequestBodyFromJson(String str) => RegistrationRequestBody.fromJson(json.decode(str));
String registrationRequestBodyToJson(RegistrationRequestBody data) => json.encode(data.toJson());
class RegistrationRequestBody {
  RegistrationRequestBody({
      this.fullName, 
      this.email, 
      this.phoneNumber, 
      this.password, 
      this.confirmPassword,});

  RegistrationRequestBody.fromJson(dynamic json) {
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }
  String? fullName;
  String? email;
  String? phoneNumber;
  String? password;
  String? confirmPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = fullName;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    return map;
  }

}