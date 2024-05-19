import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajba/core/errors/handle_errors.dart';
import 'package:wajba/features/Authentication/data/models/login_model.dart';
import 'package:wajba/features/Authentication/data/models/register_model.dart';
import 'package:wajba/features/Authentication/data/repo/auth_repo_impl.dart';
import 'package:wajba/features/Authentication/presentations/view_model/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepoImpl authRepoImpl;

  AuthCubit({required this.authRepoImpl}) : super(InitialAuthState());

  Future<void> register(RegisterModel registerModel) async {
    emit(RegisteringAuthState());
    final Either<Exception, String> response = await authRepoImpl.register(registerModel);
    emit(
      response.fold(
            (exception) {
          ErrorHandler.handle(exception);
          return AuthErrorState(errorModel: ErrorHandler.errorModel);
        },
            (token) => RegisterSuccessfullyState(token: token),
      ),
    );
  }

  Future<void> login(LoginModel loginModel) async {
    emit(LoginAuthState());
    final Either<Exception, String> response = await authRepoImpl.login(loginModel);
    emit(
      response.fold(
            (exception) {
          ErrorHandler.handle(exception);
          return AuthErrorState(errorModel: ErrorHandler.errorModel);
        },
            (token) => LoginSuccessfullyState(token: token),
      ),
    );
  }

  Future<void> logOut() async {
    emit(LoggingOutState());
    final Either<Exception, void> response = await authRepoImpl.logOut();
    emit(
      response.fold(
            (exception) {
          ErrorHandler.handle(exception);
          return AuthErrorState(errorModel: ErrorHandler.errorModel);
        },
            (_) => LoggedOutState(),
      ),
    );
  }
}

AuthCubit getAuthCubit(BuildContext context, {bool listen = false}) =>
    BlocProvider.of<AuthCubit>(context, listen: listen);
