import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajba/features/Home/data/repo/home_repo.dart';
import 'package:wajba/features/Home/presentation/view_model/TryThisToday%20Cubit/try_this_today_state.dart';

class TryThisTodayCubit extends Cubit<TryThisTodayState> {
  final HomeRepo homeRepo;
  final String token; // Store the token

  TryThisTodayCubit({required this.homeRepo, required this.token})
      : super(TryThisTodayInitial());

  Future<void> getMeals() async {
    emit(TryThisTodayLoading());
    final response = await homeRepo.getMeals(token);
    response.fold(
      (failure) => emit(TryThisTodayFailure(errMessage: failure.toString())),
      (getMenuItemsMeals) =>
          emit(TryThisTodaySuccess(getMenuItemsMeals: getMenuItemsMeals)),
    );
  }
}
