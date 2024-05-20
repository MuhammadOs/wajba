import 'meal.dart';

class GetMenuItemsMeals {
  GetMenuItemsMeals({
    this.statusCode,
    this.isSuccess,
    this.errorMessages,
    this.result,
  });

  GetMenuItemsMeals.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    errorMessages = json['errorMessages'];
    if (json['result'] != null) {
      result = (json['result'] as List).map((v) => Meal.fromJson(v)).toList();
    }
  }

  int? statusCode;
  bool? isSuccess;
  String? errorMessages;
  List<Meal>? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['isSuccess'] = isSuccess;
    map['errorMessages'] = errorMessages;
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}