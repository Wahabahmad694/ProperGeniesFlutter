import 'dart:convert';
ContactUsRequestBody contactUsRequestBodyFromJson(String str) => ContactUsRequestBody.fromJson(json.decode(str));
String contactUsRequestBodyToJson(ContactUsRequestBody data) => json.encode(data.toJson());
class ContactUsRequestBody {
  ContactUsRequestBody({
      this.name, 
      this.email, 
      this.phoneNumber, 
      this.message, 
      this.property,});

  ContactUsRequestBody.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    message = json['message'];
    property = json['property'];
  }
  String? name;
  String? email;
  String? phoneNumber;
  String? message;
  String? property;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['message'] = message;
    map['property'] = property;
    return map;
  }

}