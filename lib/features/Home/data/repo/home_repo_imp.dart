import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wajba/core/errors/faliures.dart';
import 'package:wajba/features/Home/data/models/item_model/get_meals_response_model.dart';
import 'package:wajba/features/Home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  Dio dio;

  HomeRepoImpl(this.dio);

  @override
  Future<Either<Exception, GetMealsResponseModel>> getMeals() async {
    try {
      final response = await dio.get("MenuItemAPI");
      final responseData = response.data;
      return Right(GetMealsResponseModel.fromJson(responseData));
    } catch (exception) {
      return left(Exception(exception.toString()));
    }
  }

}
