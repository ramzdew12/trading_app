import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/core/model/tranding_model2.dart';
import 'package:trading_app/features/search/state/serch_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final TrandingModelSearch searchData;
  late Map<int, Stock> result;

  SearchCubit(this.searchData) : super(SearchInitial()) {
    loadSearchData();
  }

  void loadSearchData() {
    try {
      result = {for (var stock in searchData.data.stock) stock.symbol.hashCode: stock};
      emit(SearchLoaded(searchResults: result.values.toList()));
    } catch (e) {
      emit(SearchError(message: 'Error occurred while loading data'));
    }
  }

  void searchCompanies(String query) {
    if (query.isEmpty) {
      emit(SearchLoaded(searchResults: result.values.toList()));
      return;
    }

    emit(SearchLoading());

    try {
      final results = result.values.where((stock) {
        return stock.symbol.toLowerCase().contains(query.toLowerCase()) ||
               stock.name.toLowerCase().contains(query.toLowerCase());
      }).toList();

      if (results.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchLoaded(searchResults: results));
      }
    } catch (e) {
      emit(SearchError(message: 'Error occurred while searching'));
    }
  }
}
