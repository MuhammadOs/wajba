import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajba/features/Home/data/repo/home_repo.dart';
import 'package:wajba/features/Home/presentation/view_model/shining_kitchens_cubit/shinining_kitchen_state.dart';

class ShiningKitchenCubit extends Cubit<ShiningKitchenState> {
  final HomeRepo homeRepo;
  final String token; // Store the token

  ShiningKitchenCubit({required this.homeRepo, required this.token})
      : super(ShiningKitchensInitial());

  Future<void> getShiningKitchens() async {
    emit(ShiningKitchensLoading());
    final response = await homeRepo.getShiningKitchens(token);
    response.fold(
      (failure) => emit(ShiningKitchensFailure(errMessage: failure.toString())),
      (getShiningKitchensRequest) => emit(ShiningKitchensSuccess(
          getShiningKitchensRequest: getShiningKitchensRequest)),
    );
  }
}
