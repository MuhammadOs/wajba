import 'package:wajba/features/Home/data/models/item_model/get_menu_items_meals.dart';
import 'package:wajba/features/Home/data/models/shining_kitchens_models/get_shining_kitchens_request.dart';

abstract class TryThisTodayState {}

final class TryThisTodayInitial extends TryThisTodayState {}

final class TryThisTodayLoading extends TryThisTodayState {}

final class TryThisTodaySuccess extends TryThisTodayState {
  final GetMenuItemsMeals getMenuItemsMeals;

  TryThisTodaySuccess({required this.getMenuItemsMeals});
}

final class TryThisTodayFailure extends TryThisTodayState {
  String errMessage;

  TryThisTodayFailure({required this.errMessage});

  @override
  String toString() => 'TryThisTodayFailure { errMessage: $errMessage }';
}
