import 'package:dartz/dartz.dart';
import 'package:wajba/core/errors/faliures.dart';
import 'package:wajba/features/Authentication/data/models/login/Login_model.dart';
import 'package:wajba/features/Authentication/data/models/Register_model.dart';

abstract class AuthRepository {
  Future<Either<Exception,String>> register(RegisterModel registerModel);
  Future<Either<Exception,String>> login (LoginModel loginModel);
  Future<Either<Exception,void>> logOut ();
  String? getToken ();
}