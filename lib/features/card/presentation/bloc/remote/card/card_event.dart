part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object?> get props => [];
}

class FetchCardEvent extends CardEvent {
  final String page;

  const FetchCardEvent(this.page);

  @override
  List<Object?> get props => [page];
}

class SearchCardEvent extends CardEvent {
  final String query;
  final String page;

  const SearchCardEvent(this.query,this.page);

  @override
  List<Object?> get props => [query,page];
}
