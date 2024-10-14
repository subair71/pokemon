import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:sample/core/resources/failures/main_failure.dart';
import 'package:sample/features/card/data/data_sources/remote/card_api_service.dart';
import 'package:sample/features/card/data/models/card_model.dart';
import 'package:sample/features/card/domain/entities/card_entity.dart';
import 'package:sample/features/card/domain/repositories/card_repository.dart';

class FetchCardRepositoryImpl implements FetchCardRepository {
  final CardApiService _cardApiService;

  FetchCardRepositoryImpl(this._cardApiService);
  @override
  Future<Either<MainFailure, CardEntity>> fecthCards(String page) async {
    try {
      final httpResponse = await _cardApiService.fetchCards(page, "10");
      try {
        final Map<String, dynamic> data =
            jsonDecode(httpResponse.response.data);
           
        CardModel cardModel = CardModel.fromJson(data);
        return Right(cardModel);
      } on Exception {
        return const Left(MainFailure.clientFailure());
      }
    } on Exception {
      return const Left(MainFailure.serverFailure());
    }
  }
}

class SearchCardRepositoryImpl implements SearchCardRepository {
  final CardApiService _cardApiService;

  SearchCardRepositoryImpl(this._cardApiService);
  @override
  Future<Either<MainFailure, CardEntity>> searchCards(String query,String page) async {
    try {
      final httpResponse = await _cardApiService.searchCards(query,page, "10");
      try {
        final Map<String, dynamic> data =
            jsonDecode(httpResponse.response.data);
           
        CardModel cardModel = CardModel.fromJson(data);
        return Right(cardModel);
      } on Exception {
        return const Left(MainFailure.clientFailure());
      }
    } on Exception {
      return const Left(MainFailure.serverFailure());
    }
  }
}
