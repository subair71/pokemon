import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/features/card/domain/entities/card_entity.dart';
import 'package:sample/features/card/domain/usecases/fecth_card_usecase.dart';
import 'package:sample/features/card/domain/usecases/search_card_usecase.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final FetchCardUseCase _fetchCardUseCase;
   final SearchCardUseCase _searchCardUseCase;

  CardBloc(this._fetchCardUseCase,this._searchCardUseCase) : super(CardState.initial()) {
    on<FetchCardEvent>(_onFetchCardEvent);
    on<SearchCardEvent>(_onSearchCardEvent);
  }

  Future<void> _onFetchCardEvent(FetchCardEvent event, Emitter<CardState> emit) async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final result = await _fetchCardUseCase(params:event.page);
    result.fold((failure) {
      emit(state.copyWith(isLoading: false, isError: true));
    }, (cardEntity) {
      final newCards = [...state.cards, ...?cardEntity.data]; // Append new cards
      emit(state.copyWith(
        cards: newCards,
        filteredCards: newCards,
        currentPage: state.currentPage + 1,
        isLoading: false,
      ));
    });
  }

  Future<void> _onSearchCardEvent(SearchCardEvent event, Emitter<CardState> emit) async {
    final query = event.query.toLowerCase();
    final filtered = state.cards.where((card) {
      final cardName = card.name!.toLowerCase();
      return cardName.contains(query);
    }).toList();

    emit(state.copyWith(filteredCards: filtered));
    
    /* if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final result = await _searchCardUseCase(params:QueryEntity(page: event.page,query: event.query));
    result.fold((failure) {
      emit(state.copyWith(isLoading: false, isError: true));
    }, (cardEntity) {
      final newCards = [...state.cards, ...?cardEntity.data]; // Append new cards
      emit(state.copyWith(
        cards: newCards,
        filteredCards: newCards,
        currentPage: state.currentPage + 1,
        isLoading: false,
      ));
    });*/

  }
}
