part of 'card_bloc.dart';

class CardState extends Equatable {
  final List<CardResponseEntity> cards;
  final List<CardResponseEntity> filteredCards;
  final bool isLoading;
  final bool isError;
  final int currentPage;

  const CardState({
    required this.cards,
    required this.filteredCards,
    required this.isLoading,
    required this.isError,
    required this.currentPage,
  });

  factory CardState.initial() => const CardState(
        cards: [],
        filteredCards: [],
        isLoading: false,
        isError: false,
        currentPage: 1,
      );

  CardState copyWith({
    List<CardResponseEntity>? cards,
    List<CardResponseEntity>? filteredCards,
    bool? isLoading,
    bool? isError,
    int? currentPage,
  }) {
    return CardState(
      cards: cards ?? this.cards,
      filteredCards: filteredCards ?? this.filteredCards,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [cards, filteredCards, isLoading, isError, currentPage];
}
