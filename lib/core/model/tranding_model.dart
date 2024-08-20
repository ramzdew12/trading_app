class TrandingModel {
  final String symbol;
  final String type;
  final String name;
  final double price;
  final double change;
  final double changePercent;
  final double previousClose;
  final DateTime lastUpdateUtc;
  final DateTime exchangeOpen;
  final DateTime exchangeClose;
  final String timezone;
  final int utcOffsetSec;
  final String googleMid;

  TrandingModel({
    required this.symbol,
    required this.type,
    required this.name,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.previousClose,
    required this.lastUpdateUtc,
    required this.exchangeOpen,
    required this.exchangeClose,
    required this.timezone,
    required this.utcOffsetSec,
    required this.googleMid,
  });

  factory TrandingModel.fromJson(Map<String, dynamic> json) {
    return TrandingModel(
      symbol: json['symbol'] ?? '',
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      change: (json['change'] ?? 0.0).toDouble(),
      changePercent: (json['change_percent'] ?? 0.0).toDouble(),
      previousClose: (json['previous_close'] ?? 0.0).toDouble(),
      lastUpdateUtc: DateTime.parse(json['last_update_utc'] ?? '1970-01-01 00:00:00'),
      exchangeOpen: DateTime.parse(json['exchange_open'] ?? '1970-01-01 00:00:00'),
      exchangeClose: DateTime.parse(json['exchange_close'] ?? '1970-01-01 00:00:00'),
      timezone: json['timezone'] ?? '',
      utcOffsetSec: json['utc_offset_sec'] ?? 0,
      googleMid: json['google_mid'] ?? '',
    );
  }
}
