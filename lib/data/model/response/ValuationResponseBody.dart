import 'dart:convert';
ValuationResponseBody valuationResponseBodyFromJson(String str) => ValuationResponseBody.fromJson(json.decode(str));
String valuationResponseBodyToJson(ValuationResponseBody data) => json.encode(data.toJson());
class ValuationResponseBody {
  ValuationResponseBody({
      this.requestValuation,});

  ValuationResponseBody.fromJson(dynamic json) {
    requestValuation = json['requestValuation'] != null ? RequestValuation.fromJson(json['requestValuation']) : null;
  }
  RequestValuation? requestValuation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (requestValuation != null) {
      map['requestValuation'] = requestValuation?.toJson();
    }
    return map;
  }

}

RequestValuation requestValuationFromJson(String str) => RequestValuation.fromJson(json.decode(str));
String requestValuationToJson(RequestValuation data) => json.encode(data.toJson());
class RequestValuation {
  RequestValuation({
      this.firstName, 
      this.lastName, 
      this.phone, 
      this.email, 
      this.address, 
      this.department, 
      this.description, 
      this.area, 
      this.receptionRoom, 
      this.type, 
      this.hasGarden, 
      this.parking, 
      this.postalCode, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  RequestValuation.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    department = json['department'];
    description = json['description'];
    area = json['area'];
    receptionRoom = json['receptionRoom'];
    type = json['type'];
    hasGarden = json['hasGarden'];
    parking = json['parking'];
    postalCode = json['postalCode'];
    id = json['_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    v = json['__v'];
  }
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? address;
  String? department;
  String? description;
  String? area;
  num? receptionRoom;
  String? type;
  bool? hasGarden;
  String? parking;
  String? postalCode;
  String? id;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['phone'] = phone;
    map['email'] = email;
    map['address'] = address;
    map['department'] = department;
    map['description'] = description;
    map['area'] = area;
    map['receptionRoom'] = receptionRoom;
    map['type'] = type;
    map['hasGarden'] = hasGarden;
    map['parking'] = parking;
    map['postalCode'] = postalCode;
    map['_id'] = id;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}