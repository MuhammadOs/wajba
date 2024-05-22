import 'package:dartz/dartz.dart';
import 'package:wajba/features/Home/data/models/item_model/get_menu_items_meals.dart';
import 'package:wajba/features/Home/data/models/shining_kitchens_models/get_shining_kitchens_request.dart';

abstract class HomeRepo {
  Future<Either<Exception, GetMenuItemsMeals>> getMeals(String token);
  Future<Either<Exception, GetShiningKitchensRequest>> getShiningKitchens(String token);
}
