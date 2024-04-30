import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:wajba/features/Home/data/models/item_model/result.dart';

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

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      statusCode: json['statusCode'] as int?,
      isSuccess: json['isSuccess'] as bool?,
      errorMessages: json['errorMessages'] as dynamic,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'isSuccess': isSuccess,
      'errorMessages': errorMessages,
      'result': result?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
    statusCode,
    isSuccess,
    errorMessages,
    result,
  ];
}