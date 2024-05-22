import 'package:wajba/features/Home/data/models/shining_kitchens_models/get_shining_kitchens_request.dart';

abstract class ShiningKitchenState {}

final class ShiningKitchensInitial extends ShiningKitchenState {}

final class ShiningKitchensLoading extends ShiningKitchenState {}

final class ShiningKitchensSuccess extends ShiningKitchenState {
  final GetShiningKitchensRequest getShiningKitchensRequest;

  ShiningKitchensSuccess({required this.getShiningKitchensRequest});
}

final class ShiningKitchensFailure extends ShiningKitchenState {
  String errMessage;

  ShiningKitchensFailure({required this.errMessage});

  @override
  String toString() => 'Shining kitchens { errMessage: $errMessage }';
}
