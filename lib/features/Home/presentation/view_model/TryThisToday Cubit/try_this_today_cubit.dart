import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/home_repo.dart';
import 'try_this_today_state.dart';

class TryThisTodayCubit extends Cubit<TryThisTodayState> {
  TryThisTodayCubit({required this.homeRepo}) : super(TryThisTodayInitial());

  final HomeRepo homeRepo;

  Future<void> getMeals() async {
    emit(TryThisTodayLoading());
    final response = await homeRepo.getMeals();
    response.fold(
          (failure) => emit(TryThisTodayFailure(errMessage: failure.errMessage)),
          (getMealsResponseModel) => emit(TryThisTodaySuccess(getMealsResponseModel: getMealsResponseModel)),
    );
  }

}



/*Future<void> fetchTryThisItems() async {
    emit(TryThisTodayLoading());
    final response = await homeRepo.fetchTryThisTodayItems();
    //var result = await homeRepo.fetchTryThisTodayItems();
    emit(
      response.fold((failure) {
        return TryThisTodayFailure(failure.errMessage);
      }, (meals) => TryThisTodaySuccess(meals: meals)),
    );
  }*/

TryThisTodayCubit getTryThisTodayCubit(BuildContext context,
        {bool listen = false}) =>
    BlocProvider.of(context, listen: listen);
