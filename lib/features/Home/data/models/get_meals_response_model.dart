import 'package:wajba/features/Home/data/models/meal.dart';

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

  factory GetMealsResponseModel.fromJson(Map<String, dynamic> json) {
    return GetMealsResponseModel(
      statusCode: json['statusCode'],
      isSuccess: json['isSuccess'],
      errorMessages: json['errorMessages'],
      result: json['result'] == null
          ? []
          : List<Meal>.from(json['result'].map((x) => Meal.fromJson(x))),
    );
  }
}
