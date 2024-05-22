import 'package:wajba/features/Authentication/data/models/Customer.dart';

class Result {
  Result({
    this.customer,
    this.token,
  });

  Result.fromJson(Map<String, dynamic> json) {
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    token = json['token'];
  }

  Customer? customer;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    map['token'] = token;
    return map;
  }
}
