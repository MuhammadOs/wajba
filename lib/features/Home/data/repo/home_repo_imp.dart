import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/faliures.dart';
import '../../../../core/utils/api_service.dart';
import '../models/item_model/result.dart';
import 'home_repo.dart';

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
  Future<Either<Failure, List<Result>>> fetchTryThisTodayItems() async {
    try {
      var response = await apiservice.get(endpoint: 'MenuItemAPI');
      print("home repo response: ${response['result']}]");
      List<dynamic> resultJson = response['result'];
      List<Result> meals = resultJson.map((e) => Result.fromJson(e)).toList();
      return right(meals);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaliure.fromDioError(e));
      } else {
        return left(ServerFaliure(e.toString()));
      }
    }
  }
}
