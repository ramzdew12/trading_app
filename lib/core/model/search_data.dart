import 'package:trading_app/core/model/tranding_model2.dart';

final TrandingModelSearch searchData = TrandingModelSearch(
  status: "success",
  requestId: "req-12345",
  data: Data(
    stock: [
      Stock(
        symbol: "AAPL",
        name: "Apple Inc.",
        type: "Stock",
        price: 150.50,
        change: -0.5,
        changePercent: -0.33,
        previousClose: 151.00,
        lastUpdateUtc: DateTime.now(),
        countryCode: "US",
        exchange: "NASDAQ",
        exchangeOpen: DateTime.now(),
        exchangeClose: DateTime.now().add(Duration(hours: 8)),
        timezone: "America/New_York",
        utcOffsetSec: -14400,
        currency: "USD",
        googleMid: "apple-google",
      ),
      Stock(
        symbol: "GOOGL",
        name: "Alphabet Inc.",
        type: "Stock",
        price: 2800.50,
        change: 20.0,
        changePercent: 0.72,
        previousClose: 2780.50,
        lastUpdateUtc: DateTime.now(),
        countryCode: "US",
        exchange: "NASDAQ",
        exchangeOpen: DateTime.now(),
        exchangeClose: DateTime.now().add(Duration(hours: 8)),
        timezone: "America/New_York",
        utcOffsetSec: -14400,
        currency: "USD",
        googleMid: "alphabet-google",
      ),
      Stock(
        symbol: "AMZN",
        name: "Amazon.com Inc.",
        type: "Stock",
        price: 3400.25,
        change: 15.0,
        changePercent: 0.44,
        previousClose: 3385.25,
        lastUpdateUtc: DateTime.now(),
        countryCode: "US",
        exchange: "NASDAQ",
        exchangeOpen: DateTime.now(),
        exchangeClose: DateTime.now().add(Duration(hours: 8)),
        timezone: "America/New_York",
        utcOffsetSec: -14400,
        currency: "USD",
        googleMid: "amazon-google",
      ),
      Stock(
        symbol: "MSFT",
        name: "Microsoft Corporation",
        type: "Stock",
        price: 295.30,
        change: 5.0,
        changePercent: 1.72,
        previousClose: 290.30,
        lastUpdateUtc: DateTime.now(),
        countryCode: "US",
        exchange: "NASDAQ",
        exchangeOpen: DateTime.now(),
        exchangeClose: DateTime.now().add(Duration(hours: 8)),
        timezone: "America/New_York",
        utcOffsetSec: -14400,
        currency: "USD",
        googleMid: "microsoft-google",
      ),
      Stock(
        symbol: "TSLA",
        name: "Tesla Inc.",
        type: "Stock",
        price: 720.75,
        change: -10.0,
        changePercent: -1.37,
        previousClose: 730.75,
        lastUpdateUtc: DateTime.now(),
        countryCode: "US",
        exchange: "NASDAQ",
        exchangeOpen: DateTime.now(),
        exchangeClose: DateTime.now().add(Duration(hours: 8)),
        timezone: "America/New_York",
        utcOffsetSec: -14400,
        currency: "USD",
        googleMid: "tesla-google",
      ),
      Stock(
        symbol: "FB",
        name: "Meta Platforms Inc.",
        type: "Stock",
        price: 325.10,
        change: 12.0,
        changePercent: 3.83,
        previousClose: 313.10,
        lastUpdateUtc: DateTime.now(),
        countryCode: "US",
        exchange: "NASDAQ",
        exchangeOpen: DateTime.now(),
        exchangeClose: DateTime.now().add(Duration(hours: 8)),
        timezone: "America/New_York",
        utcOffsetSec: -14400,
        currency: "USD",
        googleMid: "meta-google",
      ),
      Stock(
        symbol: "NFLX",
        name: "Netflix Inc.",
        type: "Stock",
        price: 485.20,
        change: -8.0,
        changePercent: -1.62,
        previousClose: 493.20,
        lastUpdateUtc: DateTime.now(),
        countryCode: "US",
        exchange: "NASDAQ",
        exchangeOpen: DateTime.now(),
        exchangeClose: DateTime.now().add(Duration(hours: 8)),
        timezone: "America/New_York",
        utcOffsetSec: -14400,
        currency: "USD",
        googleMid: "netflix-google",
      ),
    ],
    etf: [],
    index: [],
    mutualFund: [],
    currency: [],
    futures: [],
  ),
);