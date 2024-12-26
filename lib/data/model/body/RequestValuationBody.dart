import 'dart:convert';
RequestValuationBody requestValuationBodyFromJson(String str) => RequestValuationBody.fromJson(json.decode(str));
String requestValuationBodyToJson(RequestValuationBody data) => json.encode(data.toJson());
class RequestValuationBody {
  RequestValuationBody({
      this.firstName, 
      this.lastName, 
      this.phone, 
      this.address, 
      this.department, 
      this.email, 
      this.receptionRoom, 
      this.area, 
      this.orentation, 
      this.type, 
      this.hasGarden, 
      this.parking, 
      this.postalCode, 
      this.description,});

  RequestValuationBody.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    address = json['address'];
    department = json['department'];
    email = json['email'];
    receptionRoom = json['receptionRoom'];
    area = json['area'];
    orentation = json['orentation'] != null ? Orentation.fromJson(json['orentation']) : null;
    type = json['type'];
    hasGarden = json['hasGarden'];
    parking = json['parking'];
    postalCode = json['postalCode'];
    description = json['description'];
  }
  String? firstName;
  String? lastName;
  String? phone;
  String? address;
  String? department;
  String? email;
  num? receptionRoom;
  String? area;
  Orentation? orentation;
  String? type;
  bool? hasGarden;
  String? parking;
  String? postalCode;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['phone'] = phone;
    map['address'] = address;
    map['department'] = department;
    map['email'] = email;
    map['receptionRoom'] = receptionRoom;
    map['area'] = area;
    if (orentation != null) {
      map['orentation'] = orentation?.toJson();
    }
    map['type'] = type;
    map['hasGarden'] = hasGarden;
    map['parking'] = parking;
    map['postalCode'] = postalCode;
    map['description'] = description;
    return map;
  }

}

Orentation orentationFromJson(String str) => Orentation.fromJson(json.decode(str));
String orentationToJson(Orentation data) => json.encode(data.toJson());
class Orentation {
  Orentation({
      this.beds, 
      this.bathrooms,});

  Orentation.fromJson(dynamic json) {
    beds = json['beds'];
    bathrooms = json['bathrooms'];
  }
  num? beds;
  num? bathrooms;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['beds'] = beds;
    map['bathrooms'] = bathrooms;
    return map;
  }

}