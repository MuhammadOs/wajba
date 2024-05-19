import 'package:wajba/features/Authentication/data/models/Result.dart';

class LoginResponseModel {
  LoginResponseModel({
    this.statusCode,
    this.isSuccess,
    this.errorMessages,
    this.result,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    if (json['errorMessages'] != null) {
      errorMessages = List<String>.from(json['errorMessages']);
    }
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  int? statusCode;
  bool? isSuccess;
  List<String>? errorMessages;
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['isSuccess'] = isSuccess;
    if (errorMessages != null) {
      map['errorMessages'] = errorMessages;
    }
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }
}