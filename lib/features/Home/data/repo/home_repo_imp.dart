import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wajba/features/Home/data/models/item_model/get_menu_items_meals.dart';
import 'package:wajba/features/Home/data/models/shining_kitchens_models/get_shining_kitchens_request.dart';
import 'package:wajba/features/Home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final Dio dio;

  HomeRepoImpl({required this.dio});

  @override
  Future<Either<Exception, GetMenuItemsMeals>> getMeals(String token) async {
    try {
      final response = await dio.get(
        "MenuItemAPI",
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      final responseData = response.data;
      return Right(GetMenuItemsMeals.fromJson(responseData));
    } catch (exception) {
      return Left(Exception(exception.toString()));
    }
  }

  @override
  Future<Either<Exception, GetShiningKitchensRequest>> getShiningKitchens(
      String token) async {
    try {
      final response = await dio.get(
        "Chef",
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      final responseData = response.data;
      return Right(GetShiningKitchensRequest.fromJson(responseData));
    } catch (exception) {
      return Left(Exception(exception.toString()));
    }
  }
}
