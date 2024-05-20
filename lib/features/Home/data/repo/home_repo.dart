import 'package:dartz/dartz.dart';
import 'package:wajba/features/Home/data/models/item_model/get_menu_items_meals.dart';

abstract class HomeRepo {
  Future<Either<Exception, GetMenuItemsMeals>> getMeals(String token);
}
