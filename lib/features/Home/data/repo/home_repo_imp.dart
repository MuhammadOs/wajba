import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wajba/core/errors/faliures.dart';
import 'package:wajba/core/utils/api_service.dart';
import 'package:wajba/features/Home/data/models/item_model/meal_model.dart';
import 'package:wajba/features/Home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiservice;

  HomeRepoImpl(this.apiservice);
  @override
  fetchKitchensNearby() {
    // TODO: implement fetchKitchensNearby
    throw UnimplementedError();
  }

  @override
  fetchShinningKitchens() {
    // TODO: implement fetchShinningKitchens
    throw UnimplementedError();
  }

  @override
  Future<Either<Faliure, List<MealModel>>> fetchTryThisTodayItems() async {
    try {
      var data = await apiservice.get(endpoint: 'MenuItemAPI');

      List<MealModel> Meals = [];

      for (var item in data['result']) {
        Meals.add(MealModel.fromJson(item));
      }
      print(Meals);
      return right(Meals);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.fromDioError(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }
}
