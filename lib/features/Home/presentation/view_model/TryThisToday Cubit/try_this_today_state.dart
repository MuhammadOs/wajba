part of 'try_this_today_cubit.dart';

sealed class TryThisTodayState extends Equatable {
  const TryThisTodayState();

  @override
  List<Object> get props => [];
}

final class TryThisTodayInitial extends TryThisTodayState {}

final class TryThisTodayLoading extends TryThisTodayState {}

final class TryThisTodaySuccess extends TryThisTodayState {
  final List<MealModel> meals;

  TryThisTodaySuccess(this.meals);
}

final class TryThisTodayFaliure extends TryThisTodayState {
  final String errMessage;

  TryThisTodayFaliure(this.errMessage);
}
