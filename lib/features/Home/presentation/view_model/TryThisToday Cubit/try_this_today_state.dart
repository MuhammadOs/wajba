import '../../../data/models/item_model/result.dart';

abstract class TryThisTodayState {}

final class TryThisTodayInitial extends TryThisTodayState {}

final class TryThisTodayLoading extends TryThisTodayState {}

final class TryThisTodaySuccess extends TryThisTodayState {
  List<Result> meals;

  TryThisTodaySuccess({required this.meals});
}

final class TryThisTodayFailure extends TryThisTodayState {
  final String errMessage;

  TryThisTodayFailure(this.errMessage);

  @override
  String toString() => 'TryThisTodayFailure { errMessage: $errMessage }';
}
