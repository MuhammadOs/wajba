import 'package:equatable/equatable.dart';

import 'result.dart';

class MealModel extends Equatable {
  final int? statusCode;
  final bool? isSuccess;
  final dynamic errorMessages;
  final List<Result>? result;

  const MealModel({
    this.statusCode,
    this.isSuccess,
    this.errorMessages,
    this.result,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        statusCode: json['statusCode'] as int?,
        isSuccess: json['isSuccess'] as bool?,
        errorMessages: json['errorMessages'] as dynamic,
        result: (json['result'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'isSuccess': isSuccess,
        'errorMessages': errorMessages,
        'result': result?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      statusCode,
      isSuccess,
      errorMessages,
      result,
    ];
  }
}
