import 'dart:convert';
AddFavouritePropertyResponse addFavouritePropertyResponseFromJson(String str) => AddFavouritePropertyResponse.fromJson(json.decode(str));
String addFavouritePropertyResponseToJson(AddFavouritePropertyResponse data) => json.encode(data.toJson());
class AddFavouritePropertyResponse {
  AddFavouritePropertyResponse({
      this.message, 
      this.property,});

  AddFavouritePropertyResponse.fromJson(dynamic json) {
    message = json['message'];
    property = json['property'] != null ? Property.fromJson(json['property']) : null;
  }
  String? message;
  Property? property;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (property != null) {
      map['property'] = property?.toJson();
    }
    return map;
  }

}

Property propertyFromJson(String str) => Property.fromJson(json.decode(str));
String propertyToJson(Property data) => json.encode(data.toJson());
class Property {
  Property({
      this.orientation, 
      this.id, 
      this.name, 
      this.address, 
      this.city, 
      this.department, 
      this.description, 
      this.photos, 
      this.type, 
      this.marketingFlag, 
      this.price, 
      this.priceUnit, 
      this.postalCode, 
      this.availability, 
      this.receptions, 
      this.availableDate, 
      this.location, 
      this.propertyFeatures, 
      this.floorPlan, 
      this.epc, 
      this.isEnabled, 
      this.isFavorite, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  Property.fromJson(dynamic json) {
    orientation = json['orientation'] != null ? Orientation.fromJson(json['orientation']) : null;
    id = json['_id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    department = json['department'];
    description = json['description'];
    if (json['photos'] != null) {
      photos = [];
      json['photos'].forEach((v) {
        photos?.add(Photos.fromJson(v));
      });
    }
    type = json['type'];
    marketingFlag = json['marketingFlag'];
    price = json['price'];
    priceUnit = json['priceUnit'];
    postalCode = json['postalCode'];
    availability = json['availability'];
    receptions = json['receptions'];
    availableDate = json['availableDate'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    propertyFeatures = json['propertyFeatures'] != null ? json['propertyFeatures'].cast<String>() : [];
    floorPlan = json['floorPlan'];
    epc = json['epc'];
    isEnabled = json['isEnabled'];
    isFavorite = json['isFavorite'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    v = json['__v'];
  }
  Orientation? orientation;
  String? id;
  String? name;
  String? address;
  String? city;
  String? department;
  String? description;
  List<Photos>? photos;
  String? type;
  bool? marketingFlag;
  num? price;
  String? priceUnit;
  String? postalCode;
  String? availability;
  num? receptions;
  String? availableDate;
  Location? location;
  List<String>? propertyFeatures;
  dynamic floorPlan;
  dynamic epc;
  bool? isEnabled;
  bool? isFavorite;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orientation != null) {
      map['orientation'] = orientation?.toJson();
    }
    map['_id'] = id;
    map['name'] = name;
    map['address'] = address;
    map['city'] = city;
    map['department'] = department;
    map['description'] = description;
    if (photos != null) {
      map['photos'] = photos?.map((v) => v.toJson()).toList();
    }
    map['type'] = type;
    map['marketingFlag'] = marketingFlag;
    map['price'] = price;
    map['priceUnit'] = priceUnit;
    map['postalCode'] = postalCode;
    map['availability'] = availability;
    map['receptions'] = receptions;
    map['availableDate'] = availableDate;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['propertyFeatures'] = propertyFeatures;
    map['floorPlan'] = floorPlan;
    map['epc'] = epc;
    map['isEnabled'] = isEnabled;
    map['isFavorite'] = isFavorite;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
      this.name, 
      this.latitude, 
      this.longitude, 
      this.id,});

  Location.fromJson(dynamic json) {
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    id = json['_id'];
  }
  String? name;
  num? latitude;
  num? longitude;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['_id'] = id;
    return map;
  }

}

Photos photosFromJson(String str) => Photos.fromJson(json.decode(str));
String photosToJson(Photos data) => json.encode(data.toJson());
class Photos {
  Photos({
      this.url, 
      this.id,});

  Photos.fromJson(dynamic json) {
    url = json['url'];
    id = json['_id'];
  }
  String? url;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['_id'] = id;
    return map;
  }

}

Orientation orientationFromJson(String str) => Orientation.fromJson(json.decode(str));
String orientationToJson(Orientation data) => json.encode(data.toJson());
class Orientation {
  Orientation({
      this.beds, 
      this.bathrooms,});

  Orientation.fromJson(dynamic json) {
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