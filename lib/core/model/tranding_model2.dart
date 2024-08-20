class TrandingModelSearch {
  final String status;
  final String requestId;
  final Data data;

  TrandingModelSearch({
    required this.status,
    required this.requestId,
    required this.data,
  });

  factory TrandingModelSearch.fromJson(Map<String, dynamic> json) {
    return TrandingModelSearch(
      status: json["status"],
      requestId: json["request_id"],
      data: Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "request_id": requestId,
      "data": data.toJson(),
    };
  }
}

class Data {
  final List<Stock> stock;
  final List<dynamic> etf;
  final List<dynamic> index;
  final List<MutualFund> mutualFund;
  final List<dynamic> currency;
  final List<dynamic> futures;

  Data({
    required this.stock,
    required this.etf,
    required this.index,
    required this.mutualFund,
    required this.currency,
    required this.futures,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      stock: List<Stock>.from(json["stock"].map((x) => Stock.fromJson(x))),
      etf: List<dynamic>.from(json["ETF"].map((x) => x)),
      index: List<dynamic>.from(json["index"].map((x) => x)),
      mutualFund: List<MutualFund>.from(
          json["mutual_fund"].map((x) => MutualFund.fromJson(x))),
      currency: List<dynamic>.from(json["currency"].map((x) => x)),
      futures: List<dynamic>.from(json["futures"].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "stock": List<dynamic>.from(stock.map((x) => x.toJson())),
      "ETF": List<dynamic>.from(etf.map((x) => x)),
      "index": List<dynamic>.from(index.map((x) => x)),
      "mutual_fund": List<dynamic>.from(mutualFund.map((x) => x.toJson())),
      "currency": List<dynamic>.from(currency.map((x) => x)),
      "futures": List<dynamic>.from(futures.map((x) => x)),
    };
  }
}

class MutualFund {
  final String symbol;
  final String name;
  final String type;
  final double price;
  final double change;
  final double changePercent;
  final double previousClose;
  final DateTime lastUpdateUtc;
  final String currency;
  final String googleMid;

  MutualFund({
    required this.symbol,
    required this.name,
    required this.type,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.previousClose,
    required this.lastUpdateUtc,
    required this.currency,
    required this.googleMid,
  });

  factory MutualFund.fromJson(Map<String, dynamic> json) {
    return MutualFund(
      symbol: json["symbol"],
      name: json["name"],
      type: json["type"],
      price: json["price"]?.toDouble(),
      change: json["change"]?.toDouble(),
      changePercent: json["change_percent"]?.toDouble(),
      previousClose: json["previous_close"]?.toDouble(),
      lastUpdateUtc: DateTime.parse(json["last_update_utc"]),
      currency: json["currency"],
      googleMid: json["google_mid"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "symbol": symbol,
      "name": name,
      "type": type,
      "price": price,
      "change": change,
      "change_percent": changePercent,
      "previous_close": previousClose,
      "last_update_utc": lastUpdateUtc.toIso8601String(),
      "currency": currency,
      "google_mid": googleMid,
    };
  }
}

class Stock {
  final String symbol;
  final String name;
  final String type;
  final double price;
  final double change;
  final double changePercent;
  final double previousClose;
  final DateTime lastUpdateUtc;
  final String countryCode;
  final String exchange;
  final DateTime exchangeOpen;
  final DateTime exchangeClose;
  final String timezone;
  final int utcOffsetSec;
  final String currency;
  final String googleMid;

  Stock({
    required this.symbol,
    required this.name,
    required this.type,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.previousClose,
    required this.lastUpdateUtc,
    required this.countryCode,
    required this.exchange,
    required this.exchangeOpen,
    required this.exchangeClose,
    required this.timezone,
    required this.utcOffsetSec,
    required this.currency,
    required this.googleMid,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      symbol: json["symbol"],
      name: json["name"],
      type: json["type"],
      price: json["price"]?.toDouble(),
      change: json["change"]?.toDouble(),
      changePercent: json["change_percent"]?.toDouble(),
      previousClose: json["previous_close"]?.toDouble(),
      lastUpdateUtc: DateTime.parse(json["last_update_utc"]),
      countryCode: json["country_code"],
      exchange: json["exchange"],
      exchangeOpen: DateTime.parse(json["exchange_open"]),
      exchangeClose: DateTime.parse(json["exchange_close"]),
      timezone: json["timezone"],
      utcOffsetSec: json["utc_offset_sec"],
      currency: json["currency"],
      googleMid: json["google_mid"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "symbol": symbol,
      "name": name,
      "type": type,
      "price": price,
      "change": change,
      "change_percent": changePercent,
      "previous_close": previousClose,
      "last_update_utc": lastUpdateUtc.toIso8601String(),
      "country_code": countryCode,
      "exchange": exchange,
      "exchange_open": exchangeOpen.toIso8601String(),
      "exchange_close": exchangeClose.toIso8601String(),
      "timezone": timezone,
      "utc_offset_sec": utcOffsetSec,
      "currency": currency,
      "google_mid": googleMid,
    };
  }
}
