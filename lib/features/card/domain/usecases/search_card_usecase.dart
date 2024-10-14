import 'package:dartz/dartz.dart';
import 'package:sample/core/resources/failures/main_failure.dart';
import 'package:sample/features/card/domain/entities/card_entity.dart';
import 'package:sample/features/card/domain/entities/query_entity.dart';
import 'package:sample/features/card/domain/repositories/card_repository.dart';

import '../../../../core/usecases/usecase.dart';

class SearchCardUseCase
    implements UseCase<Either<MainFailure, CardEntity>, QueryEntity> {
  final SearchCardRepository _searchCardRepository;

  SearchCardUseCase(this._searchCardRepository);
  
  @override
  Future<Either<MainFailure, CardEntity>> call({QueryEntity? params}) {
    return _searchCardRepository.searchCards(params?.query??"",params?.page??"");
  }

}

