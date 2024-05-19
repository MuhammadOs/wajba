import 'package:dio/dio.dart';
import 'package:wajba/core/util/constants.dart';
import 'package:wajba/features/Authentication/data/models/login_model.dart';
import 'package:wajba/features/Authentication/data/models/register_model.dart';

class AuthRemoteResource {
  final Dio dio;

  AuthRemoteResource({required this.dio});

  Future<Response> register(RegisterModel registerModel) async {
    return await dio.post(
      AppConstants.registerUrl,
      data: registerModel.toJson(),
    );
  }

  Future<Response> login(LoginModel loginModel) async {
    final Response response = await dio.post(
      AppConstants.loginUrl,
      data: loginModel.toJson(),
    );
    return response;
  }

  Future<void> logOut() async {
    await dio.post(AppConstants.logOutUrl);
  }
}
