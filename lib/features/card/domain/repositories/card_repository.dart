import 'package:dartz/dartz.dart';
import 'package:sample/core/resources/failures/main_failure.dart';
import 'package:sample/features/card/domain/entities/card_entity.dart';

abstract interface class CardRepository {}

abstract class FetchCardRepository extends CardRepository {
  Future<Either<MainFailure, CardEntity>> fecthCards(String page);
}

abstract class SearchCardRepository extends CardRepository {
  Future<Either<MainFailure, CardEntity>> searchCards(String query,String page);
}
