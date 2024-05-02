import 'package:dartz/dartz.dart';
import 'package:wajba/core/errors/faliures.dart';
import 'package:wajba/features/Home/data/models/get_meals_response_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, GetMealsResponseModel>> getMeals();

  fetchShinningKitchens();

  fetchKitchensNearby();
}
