import 'dart:convert';

/// Converts JSON string to `FavoritePropertiesResponse` object
FavoritePropertiesResponse favoritePropertiesResponseFromJson(String str) =>
    FavoritePropertiesResponse.fromJson(json.decode(str));

/// Converts `FavoritePropertiesResponse` object to JSON string
String favoritePropertiesResponseToJson(FavoritePropertiesResponse data) =>
    json.encode(data.toJson());

class FavoritePropertiesResponse {
  FavoritePropertiesResponse({
    this.favoriteProperties,
  });

  List<FavoriteProperty>? favoriteProperties;

  factory FavoritePropertiesResponse.fromJson(Map<String, dynamic> json) =>
      FavoritePropertiesResponse(
        favoriteProperties: json["favoriteProperties"] == null
            ? null
            : List<FavoriteProperty>.from(
            json["favoriteProperties"].map((x) => FavoriteProperty.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "favoriteProperties": favoriteProperties == null
        ? null
        : List<dynamic>.from(favoriteProperties!.map((x) => x.toJson())),
  };
}

class FavoriteProperty {
  FavoriteProperty({
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
    this.furnishedFlag,
  });

  Orientation? orientation;
  String? id;
  String? name;
  String? address;
  String? city;
  String? department;
  String? description;
  List<Photo>? photos;
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

  factory FavoriteProperty.fromJson(Map<String, dynamic> json) => FavoriteProperty(
    orientation: json["orientation"] == null
        ? null
        : Orientation.fromJson(json["orientation"]),
    id: json["_id"],
    name: json["name"],
    address: json["address"],
    city: json["city"],
    department: json["department"],
    description: json["description"],
    photos: json["photos"] == null
        ? null
        : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    type: json["type"],
    marketingFlag: json["marketingFlag"],
    price: json["price"],
    postalCode: json["postalCode"],
    availability: json["availability"],
    receptions: json["receptions"],
    availableDate: json["availableDate"],
    location: json["location"] == null
        ? null
        : Location.fromJson(json["location"]),
    propertyFeatures: json["propertyFeatures"] == null
        ? []
        : List<String>.from(json["propertyFeatures"]),
    floorPlan: json["floorPlan"],
    epc: json["epc"],
    isEnabled: json["isEnabled"],
    isFavorite: json["isFavorite"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    v: json["__v"],
    furnishedFlag: json["furnishedFlag"],
  );

  Map<String, dynamic> toJson() => {
    "orientation": orientation?.toJson(),
    "_id": id,
    "name": name,
    "address": address,
    "city": city,
    "department": department,
    "description": description,
    "photos": photos == null
        ? null
        : List<dynamic>.from(photos!.map((x) => x.toJson())),
    "type": type,
    "marketingFlag": marketingFlag,
    "price": price,
    "postalCode": postalCode,
    "availability": availability,
    "receptions": receptions,
    "availableDate": availableDate,
    "location": location?.toJson(),
    "propertyFeatures": propertyFeatures,
    "floorPlan": floorPlan,
    "epc": epc,
    "isEnabled": isEnabled,
    "isFavorite": isFavorite,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "__v": v,
    "furnishedFlag": furnishedFlag,
  };
}

class Orientation {
  Orientation({
    this.beds,
    this.bathrooms,
  });

  num? beds;
  num? bathrooms;

  factory Orientation.fromJson(Map<String, dynamic> json) => Orientation(
    beds: json["beds"],
    bathrooms: json["bathrooms"],
  );

  Map<String, dynamic> toJson() => {
    "beds": beds,
    "bathrooms": bathrooms,
  };
}

class Photo {
  Photo({
    this.url,
    this.id,
  });

  String? url;
  String? id;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    url: json["url"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "_id": id,
  };
}

class Location {
  Location({
    this.name,
    this.latitude,
    this.longitude,
    this.id,
  });

  String? name;
  num? latitude;
  num? longitude;
  String? id;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "_id": id,
  };
}
