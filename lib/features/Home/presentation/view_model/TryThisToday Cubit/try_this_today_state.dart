import 'package:wajba/features/Home/data/models/get_meals_response_model.dart';

import '../../../data/models/item_model/result.dart';

abstract class TryThisTodayState {}

final class TryThisTodayInitial extends TryThisTodayState {}

final class TryThisTodayLoading extends TryThisTodayState {}

final class TryThisTodaySuccess extends TryThisTodayState {
  final GetMealsResponseModel getMealsResponseModel;

  TryThisTodaySuccess({required this.getMealsResponseModel});
}


final class TryThisTodayFailure extends TryThisTodayState {
  String errMessage;

  TryThisTodayFailure({required this.errMessage});

  @override
  String toString() => 'TryThisTodayFailure { errMessage: $errMessage }';
}
