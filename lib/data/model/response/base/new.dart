import 'dart:convert';
New newFromJson(String str) => New.fromJson(json.decode(str));
String newToJson(New data) => json.encode(data.toJson());
class New {
  New({
      String? orderId, 
      String? pickupAddress, 
      String? pickupLatitude, 
      String? pickupLangitude, 
      String? totalPrice, 
      String? totalPackagePrice, 
      String? totalRiderTip, 
      String? tax, 
      String? totalDistance, 
      String? pickupDate, 
      String? courierNote, 
      int? paymentmethodId, 
      dynamic craditcardId, 
      String? totalDistancePrice, 
      List<Deleteditem>? deleteditem, 
      List<Dropoff>? dropoff,}){
    _orderId = orderId;
    _pickupAddress = pickupAddress;
    _pickupLatitude = pickupLatitude;
    _pickupLangitude = pickupLangitude;
    _totalPrice = totalPrice;
    _totalPackagePrice = totalPackagePrice;
    _totalRiderTip = totalRiderTip;
    _tax = tax;
    _totalDistance = totalDistance;
    _pickupDate = pickupDate;
    _courierNote = courierNote;
    _paymentmethodId = paymentmethodId;
    _craditcardId = craditcardId;
    _totalDistancePrice = totalDistancePrice;
    _deleteditem = deleteditem;
    _dropoff = dropoff;
}

  New.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _pickupAddress = json['pickup_address'];
    _pickupLatitude = json['pickup_latitude'];
    _pickupLangitude = json['pickup_langitude'];
    _totalPrice = json['total_price'];
    _totalPackagePrice = json['total_package_price'];
    _totalRiderTip = json['total_rider_tip'];
    _tax = json['tax'];
    _totalDistance = json['total_distance'];
    _pickupDate = json['pickup_date'];
    _courierNote = json['courier_note'];
    _paymentmethodId = json['paymentmethod_id'];
    _craditcardId = json['craditcard_id'];
    _totalDistancePrice = json['total_distance_price'];
    if (json['deleteditem'] != null) {
      _deleteditem = [];
      json['deleteditem'].forEach((v) {
        _deleteditem?.add(Deleteditem.fromJson(v));
      });
    }
    if (json['dropoff'] != null) {
      _dropoff = [];
      json['dropoff'].forEach((v) {
        _dropoff?.add(Dropoff.fromJson(v));
      });
    }
  }
  String? _orderId;
  String? _pickupAddress;
  String? _pickupLatitude;
  String? _pickupLangitude;
  String? _totalPrice;
  String? _totalPackagePrice;
  String? _totalRiderTip;
  String? _tax;
  String? _totalDistance;
  String? _pickupDate;
  String? _courierNote;
  int? _paymentmethodId;
  dynamic _craditcardId;
  String? _totalDistancePrice;
  List<Deleteditem>? _deleteditem;
  List<Dropoff>? _dropoff;

  String? get orderId => _orderId;
  String? get pickupAddress => _pickupAddress;
  String? get pickupLatitude => _pickupLatitude;
  String? get pickupLangitude => _pickupLangitude;
  String? get totalPrice => _totalPrice;
  String? get totalPackagePrice => _totalPackagePrice;
  String? get totalRiderTip => _totalRiderTip;
  String? get tax => _tax;
  String? get totalDistance => _totalDistance;
  String? get pickupDate => _pickupDate;
  String? get courierNote => _courierNote;
  int? get paymentmethodId => _paymentmethodId;
  dynamic get craditcardId => _craditcardId;
  String? get totalDistancePrice => _totalDistancePrice;
  List<Deleteditem>? get deleteditem => _deleteditem;
  List<Dropoff>? get dropoff => _dropoff;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['pickup_address'] = _pickupAddress;
    map['pickup_latitude'] = _pickupLatitude;
    map['pickup_langitude'] = _pickupLangitude;
    map['total_price'] = _totalPrice;
    map['total_package_price'] = _totalPackagePrice;
    map['total_rider_tip'] = _totalRiderTip;
    map['tax'] = _tax;
    map['total_distance'] = _totalDistance;
    map['pickup_date'] = _pickupDate;
    map['courier_note'] = _courierNote;
    map['paymentmethod_id'] = _paymentmethodId;
    map['craditcard_id'] = _craditcardId;
    map['total_distance_price'] = _totalDistancePrice;
    if (_deleteditem != null) {
      map['deleteditem'] = _deleteditem?.map((v) => v.toJson()).toList();
    }
    if (_dropoff != null) {
      map['dropoff'] = _dropoff?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Dropoff dropoffFromJson(String str) => Dropoff.fromJson(json.decode(str));
String dropoffToJson(Dropoff data) => json.encode(data.toJson());
class Dropoff {
  Dropoff({
      String? itemId, 
      String? customerAddress, 
      String? customerEmail, 
      String? customerPhone, 
      String? customerName, 
      String? packageId, 
      String? customerLatitude, 
      String? customerLangitude, 
      String? packagePrice, 
      String? distancePrice, 
      String? distance, 
      String? price, 
      String? courierNote, 
      bool? isCashCollection, 
      String? cashCollectionAmount,}){
    _itemId = itemId;
    _customerAddress = customerAddress;
    _customerEmail = customerEmail;
    _customerPhone = customerPhone;
    _customerName = customerName;
    _packageId = packageId;
    _customerLatitude = customerLatitude;
    _customerLangitude = customerLangitude;
    _packagePrice = packagePrice;
    _distancePrice = distancePrice;
    _distance = distance;
    _price = price;
    _courierNote = courierNote;
    _isCashCollection = isCashCollection;
    _cashCollectionAmount = cashCollectionAmount;
}

  Dropoff.fromJson(dynamic json) {
    _itemId = json['item_id'];
    _customerAddress = json['customer_address'];
    _customerEmail = json['customer_email'];
    _customerPhone = json['customer_phone'];
    _customerName = json['customer_name'];
    _packageId = json['package_id'];
    _customerLatitude = json['customer_latitude'];
    _customerLangitude = json['customer_langitude'];
    _packagePrice = json['package_price'];
    _distancePrice = json['distance_price'];
    _distance = json['distance'];
    _price = json['price'];
    _courierNote = json['courier_note'];
    _isCashCollection = json['is_cash_collection'];
    _cashCollectionAmount = json['cash_collection_amount'];
  }
  String? _itemId;
  String? _customerAddress;
  String? _customerEmail;
  String? _customerPhone;
  String? _customerName;
  String? _packageId;
  String? _customerLatitude;
  String? _customerLangitude;
  String? _packagePrice;
  String? _distancePrice;
  String? _distance;
  String? _price;
  String? _courierNote;
  bool? _isCashCollection;
  String? _cashCollectionAmount;

  String? get itemId => _itemId;
  String? get customerAddress => _customerAddress;
  String? get customerEmail => _customerEmail;
  String? get customerPhone => _customerPhone;
  String? get customerName => _customerName;
  String? get packageId => _packageId;
  String? get customerLatitude => _customerLatitude;
  String? get customerLangitude => _customerLangitude;
  String? get packagePrice => _packagePrice;
  String? get distancePrice => _distancePrice;
  String? get distance => _distance;
  String? get price => _price;
  String? get courierNote => _courierNote;
  bool? get isCashCollection => _isCashCollection;
  String? get cashCollectionAmount => _cashCollectionAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = _itemId;
    map['customer_address'] = _customerAddress;
    map['customer_email'] = _customerEmail;
    map['customer_phone'] = _customerPhone;
    map['customer_name'] = _customerName;
    map['package_id'] = _packageId;
    map['customer_latitude'] = _customerLatitude;
    map['customer_langitude'] = _customerLangitude;
    map['package_price'] = _packagePrice;
    map['distance_price'] = _distancePrice;
    map['distance'] = _distance;
    map['price'] = _price;
    map['courier_note'] = _courierNote;
    map['is_cash_collection'] = _isCashCollection;
    map['cash_collection_amount'] = _cashCollectionAmount;
    return map;
  }

}

Deleteditem deleteditemFromJson(String str) => Deleteditem.fromJson(json.decode(str));
String deleteditemToJson(Deleteditem data) => json.encode(data.toJson());
class Deleteditem {
  Deleteditem({
      int? itemId,}){
    _itemId = itemId;
}

  Deleteditem.fromJson(dynamic json) {
    _itemId = json['item_id'];
  }
  int? _itemId;

  int? get itemId => _itemId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = _itemId;
    return map;
  }

}