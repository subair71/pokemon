import 'package:dartz/dartz.dart';
import 'package:sample/core/resources/failures/main_failure.dart';
import 'package:sample/features/card/domain/entities/card_entity.dart';
import 'package:sample/features/card/domain/repositories/card_repository.dart';

import '../../../../core/usecases/usecase.dart';

class FetchCardUseCase
    implements UseCase<Either<MainFailure, CardEntity>, String> {
  final FetchCardRepository _fetchCardRepository;

  FetchCardUseCase(this._fetchCardRepository);
  
  @override
  Future<Either<MainFailure, CardEntity>> call({String? params}) {
    return _fetchCardRepository.fecthCards(params??"1");
  }

}

