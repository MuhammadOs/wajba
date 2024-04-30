import 'package:dartz/dartz.dart';
import 'package:wajba/core/errors/faliures.dart';
import 'package:wajba/features/Home/data/models/item_model/result.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Result>>> fetchTryThisTodayItems();

  fetchShinningKitchens();

  fetchKitchensNearby();
}
