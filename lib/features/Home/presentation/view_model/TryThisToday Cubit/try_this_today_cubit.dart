import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wajba/features/Home/data/models/item_model/meal_model.dart';
import 'package:wajba/features/Home/data/repo/home_repo.dart';

part 'try_this_today_state.dart';

class TryThisTodayCubit extends Cubit<TryThisTodayState> {
  TryThisTodayCubit(this.homeRepo) : super(TryThisTodayInitial());

  final HomeRepo homeRepo;

  Future<void> fetchTryThisItems() async {
    emit(TryThisTodayLoading());
    var result = await homeRepo.fetchTryThisTodayItems();

    result.fold((faliure) => {emit(TryThisTodayFaliure(faliure.errMessage))},
        (meals) => {emit(TryThisTodaySuccess(meals))});
  }
}
