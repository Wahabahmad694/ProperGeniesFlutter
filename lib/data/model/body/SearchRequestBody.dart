import 'dart:convert';
SearchRequestBody searchRequestBodyFromJson(String str) => SearchRequestBody.fromJson(json.decode(str));
String searchRequestBodyToJson(SearchRequestBody data) => json.encode(data.toJson());
class SearchRequestBody {
  SearchRequestBody({
      this.search, 
      this.filters,});

  SearchRequestBody.fromJson(dynamic json) {
    search = json['search'];
    filters = json['filters'] != null ? Filters.fromJson(json['filters']) : null;
  }
  String? search;
  Filters? filters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['search'] = search;
    if (filters != null) {
      map['filters'] = filters?.toJson();
    }
    return map;
  }

}

Filters filtersFromJson(String str) => Filters.fromJson(json.decode(str));
String filtersToJson(Filters data) => json.encode(data.toJson());
class Filters {
  Filters({
    this.department,
    this.city,
    this.type,
    this.minPrice,
    this.maxPrice,
  });

  Filters.fromJson(dynamic json) {
    department = json['department'];
    city = json['city'];
    type = json['type'];
    minPrice = json['minPrice'];
    maxPrice = json['maxPrice'];
  }

  String? department;
  String? city;
  String? type;
  num? minPrice;
  num? maxPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (department != null && department!.isNotEmpty) {
      map['department'] = department;
    }
    if (city != null && city!.isNotEmpty) {
      map['city'] = city;
    }
    if (type != null && type!.isNotEmpty) {
      map['type'] = type;
    }
    if (minPrice != null) {
      map['minPrice'] = minPrice;
    }
    if (maxPrice != null) {
      map['maxPrice'] = maxPrice;
    }
    return map;
  }
}
