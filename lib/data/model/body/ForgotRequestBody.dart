import 'dart:convert';
ForgotRequestBody forgotRequestBodyFromJson(String str) => ForgotRequestBody.fromJson(json.decode(str));
String forgotRequestBodyToJson(ForgotRequestBody data) => json.encode(data.toJson());
class ForgotRequestBody {
  ForgotRequestBody({
      this.email,});

  ForgotRequestBody.fromJson(dynamic json) {
    email = json['email'];
  }
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }

}