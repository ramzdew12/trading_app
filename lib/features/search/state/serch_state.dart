import 'package:trading_app/core/model/tranding_model2.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Stock> searchResults;

  SearchLoaded({required this.searchResults});
}

class SearchEmpty extends SearchState {}

class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});
}
