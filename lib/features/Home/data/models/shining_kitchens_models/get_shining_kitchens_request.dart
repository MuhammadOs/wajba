import 'kitchen_model.dart';

class GetShiningKitchensRequest {
  GetShiningKitchensRequest({
    this.statusCode,
    this.isSuccess,
    this.errorMessages,
    this.result,
  });

  GetShiningKitchensRequest.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    errorMessages = json['errorMessages'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Kitchen.fromJson(v));
      });
    }
  }

  int? statusCode;
  bool? isSuccess;
  String? errorMessages;
  List<Kitchen>? result;

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
