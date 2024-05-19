import 'package:dartz/dartz.dart';
import 'package:wajba/core/errors/faliures.dart';
import 'package:wajba/features/Home/data/models/item_model/get_meals_response_model.dart';

abstract class HomeRepo {
  Future<Either<Exception, GetMealsResponseModel>> getMeals();
}
