import 'package:wajba/features/Home/data/models/item_model/meal.dart';

class GetMealsResponseModel {
  GetMealsResponseModel({
    this.statusCode,
    this.isSuccess,
    this.errorMessages,
    this.result,
  });

  int? statusCode;
  bool? isSuccess;
  dynamic errorMessages;
  List<Meal>? result;

  /*factory GetMealsResponseModel.fromJson(Map<String, dynamic> json) {
    return GetMealsResponseModel(
      statusCode: json['statusCode'],
      isSuccess: json['isSuccess'],
      errorMessages: json['errorMessages'],
      result: json['result'] == null
          ? []
          : List<Meal>.from(json['result'].map((x) => Meal.fromJson(x))),
    );
  }*/

  GetMealsResponseModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    errorMessages = json['errorMessages'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Meal.fromJson(v));
      });
    }
  }

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
