import 'dart:convert';
PropertyListingResponseBody propertyListingResponseBodyFromJson(String str) => PropertyListingResponseBody.fromJson(json.decode(str));
String propertyListingResponseBodyToJson(PropertyListingResponseBody data) => json.encode(data.toJson());
class PropertyListingResponseBody {
  PropertyListingResponseBody({
      this.listing,});

  PropertyListingResponseBody.fromJson(dynamic json) {
    listing = json['listing'] != null ? Listing.fromJson(json['listing']) : null;
  }
  Listing? listing;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (listing != null) {
      map['listing'] = listing?.toJson();
    }
    return map;
  }

}

Listing listingFromJson(String str) => Listing.fromJson(json.decode(str));
String listingToJson(Listing data) => json.encode(data.toJson());
class Listing {
  Listing({
      this.properties, 
      this.paginationInfo, 
      this.totalRows,});

  Listing.fromJson(dynamic json) {
    if (json['properties'] != null) {
      properties = [];
      json['properties'].forEach((v) {
        properties?.add(Properties.fromJson(v));
      });
    }
    paginationInfo = json['pagination_info'] != null ? PaginationInfo.fromJson(json['pagination_info']) : null;
    totalRows = json['total_rows'];
  }
  List<Properties>? properties;
  PaginationInfo? paginationInfo;
  num? totalRows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (properties != null) {
      map['properties'] = properties?.map((v) => v.toJson()).toList();
    }
    if (paginationInfo != null) {
      map['pagination_info'] = paginationInfo?.toJson();
    }
    map['total_rows'] = totalRows;
    return map;
  }

}

PaginationInfo paginationInfoFromJson(String str) => PaginationInfo.fromJson(json.decode(str));
String paginationInfoToJson(PaginationInfo data) => json.encode(data.toJson());
class PaginationInfo {
  PaginationInfo({
      this.pageNo, 
      this.totalPages, 
      this.startRecord, 
      this.endRecord, 
      this.totalRows,});

  PaginationInfo.fromJson(dynamic json) {
    pageNo = json['page_no'];
    totalPages = json['total_Pages'];
    startRecord = json['start_record'];
    endRecord = json['end_record'];
    totalRows = json['total_rows'];
  }
  num? pageNo;
  num? totalPages;
  num? startRecord;
  num? endRecord;
  num? totalRows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page_no'] = pageNo;
    map['total_Pages'] = totalPages;
    map['start_record'] = startRecord;
    map['end_record'] = endRecord;
    map['total_rows'] = totalRows;
    return map;
  }

}

Properties propertiesFromJson(String str) => Properties.fromJson(json.decode(str));
String propertiesToJson(Properties data) => json.encode(data.toJson());
class Properties {
  Properties({
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
      this.v, 
      this.furnishedFlag,});

  Properties.fromJson(dynamic json) {
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
    furnishedFlag = json['furnishedFlag'];
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
  bool? furnishedFlag;

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
    map['furnishedFlag'] = furnishedFlag;
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