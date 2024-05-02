import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wajba/core/errors/faliures.dart';
import 'package:wajba/core/utils/api_service.dart';
import 'package:wajba/features/Home/data/models/get_meals_response_model.dart';
import 'package:wajba/features/Home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  Dio dio;

  HomeRepoImpl(this.dio);

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
  Future<Either<Failure, GetMealsResponseModel>> getMeals() async {
    try {
      final response = await dio.get("MenuItemAPI");
      final responseData = response.data;
      print(responseData); // Check the response data
      return Right(GetMealsResponseModel.fromJson(responseData));
    } catch (e) {
      print(e.toString()); // Print any error for debugging
      return left(ServerFaliure(e.toString()));
    }
  }


}
/*
  @override
  Future<Either<Failure, GetMealsResponseModel>> getMeals() async {
    try {
      final response = await dio.get("MenuItemAPI");
      print(response.data['result']); // Check if this prints the expected data
      return Right(GetMealsResponseModel.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        debugPrint("rooms repo impl / getRoomsList()");
        debugPrint("Error : ${e.toString()}");
        return left(ServerFaliure.fromDioError(e));
      } else {
        return left(ServerFaliure(e.toString()));
      }
    }
  }
  */
