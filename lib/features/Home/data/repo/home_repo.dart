import 'package:dartz/dartz.dart';
import 'package:wajba/core/errors/faliures.dart';
import 'package:wajba/features/Home/data/models/item_model/meal_model.dart';

abstract class HomeRepo {
  Future<Either<Faliure, List<MealModel>>> fetchTryThisTodayItems();
  fetchShinningKitchens();
  fetchKitchensNearby();
}
