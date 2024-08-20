import 'package:dio/dio.dart';
import 'package:trading_app/core/model/tranding_model.dart';
import 'package:trading_app/core/model/tranding_model2.dart';
import 'package:trading_app/core/utils/check_status_code.dart';

class TradingAppRepository {
  static final TradingAppRepository instance = TradingAppRepository.init();

  TradingAppRepository.init();

  Future<List<TrandingModel>> getMarketTrends() async {
    try {
      final response = await Dio().get(
        'https://real-time-finance-data.p.rapidapi.com/market-trends?trend_type=MARKET_INDEXES&country=us&language=en',
        options: Options(
          headers: {
            'X-RapidAPI-Host': 'real-time-finance-data.p.rapidapi.com',
            'X-RapidAPI-Key':
                'be7be72f49mshaa7a70057fe1e77p19a2a4jsn27f52ca9e9b2',
          },
        ),
      );

      if (response.isSuccess()) {
        print('Status Code ${response.statusCode}');
        final data = response.data['data'];
        final trendsList = data['trends'] as List;
        return trendsList.map((json) => TrandingModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to fetch market trends: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Failed to fetch market trends: $e');
    }
  }

  Future<TrandingModelSearch> searchCompanies(String query) async {
    try {
      final response = await Dio().get(
        'https://real-time-finance-data.p.rapidapi.com/search-stock',
        queryParameters: {
          'query': query,
          'country': 'us',
          'language': 'en',
        },
        options: Options(
          headers: {
            'X-RapidAPI-Host': 'real-time-finance-data.p.rapidapi.com',
            'X-RapidAPI-Key':
                'be7be72f49mshaa7a70057fe1e77p19a2a4jsn27f52ca9e9b2',
          },
        ),
      );

      if (response.isSuccess()) {
        print(response.data);
        print('Status Code ${response.statusCode}');
        final data = response.data;
        return TrandingModelSearch.fromJson(data);
      } else {
        throw Exception(
            'Failed to search companies: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Failed to search companies: $e');
    }
  }
}
