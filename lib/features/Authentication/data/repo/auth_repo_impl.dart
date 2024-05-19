import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wajba/core/errors/error_types.dart';
import 'package:wajba/features/Authentication/data/auth_remote_resource.dart';
import 'package:wajba/features/Authentication/data/models/login/Login_response_model.dart';
import 'package:wajba/features/Authentication/data/models/login_model.dart';
import 'package:wajba/features/Authentication/data/models/register_model.dart';

class AuthRepoImpl {
  final AuthRemoteResource authRemoteResource;

  AuthRepoImpl({required this.authRemoteResource});

  Future<Either<Exception, String>> register(
      RegisterModel registerModel) async {
    try {
      final Response response =
          await authRemoteResource.register(registerModel);
      String token = response.data['token'];
      return Right(token);
    } catch (exception) {
      if (exception is DioException) {
        return Left(exception);
      } else {
        return Left(CashError());
      }
    }
  }

  Future<Either<Exception, String>> login(LoginModel loginModel) async {
    try {
      final Response response = await authRemoteResource.login(loginModel);
      final loginResponse = LoginResponseModel.fromJson(response.data);

      if (loginResponse.isSuccess == true) {
        return Right(loginResponse.result?.token ?? '');
      } else {
        return Left(ResponseError(
          statusCode: loginResponse.statusCode ?? 500,
          message: loginResponse.errorMessages?.join(', ') ?? 'Unknown error',
        ));
      }
    } catch (exception) {
      if (exception is DioException) {
        return Left(exception);
      } else {
        return Left(CashError());
      }
    }
  }

  Future<Either<Exception, void>> logOut() async {
    try {
      await authRemoteResource.logOut();
      return const Right(null);
    } catch (exception) {
      if (exception is DioException) {
        return Left(exception);
      } else {
        return Left(CashError());
      }
    }
  }
}