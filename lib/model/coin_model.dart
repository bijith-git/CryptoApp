// To parse this JSON data, do
//
//     final coinModel = coinModelFromJson(jsonString);

import 'dart:convert';

CoinModel coinModelFromJson(String str) => CoinModel.fromJson(json.decode(str));

String coinModelToJson(CoinModel data) => json.encode(data.toJson());

class CoinModel {
  CoinModel({
    required this.data,
  });

  Data data;

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.coins,
  });
  List<Coin> coins;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        coins: List<Coin>.from(json["coins"].map((x) => Coin.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "coins": List<dynamic>.from(coins.map((x) => x.toJson())),
      };
}

class Coin {
  Coin({
    required this.uuid,
    required this.symbol,
    required this.name,
    required this.color,
    required this.iconUrl,
    required this.marketCap,
    required this.price,
    required this.listedAt,
    required this.tier,
    required this.change,
    required this.rank,
    required this.sparkline,
    required this.lowVolume,
    required this.coinrankingUrl,
    required this.the24HVolume,
    required this.btcPrice,
  });

  String uuid;
  String symbol;
  String name;
  String color;
  String iconUrl;
  String marketCap;
  String price;
  int listedAt;
  int tier;
  String change;
  int rank;
  List<String> sparkline;
  bool lowVolume;
  String coinrankingUrl;
  String the24HVolume;
  String btcPrice;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        uuid: json["uuid"],
        symbol: json["symbol"],
        name: json["name"],
        color: json["color"] ,
        iconUrl: json["iconUrl"],
        marketCap: json["marketCap"],
        price: json["price"],
        listedAt: json["listedAt"],
        tier: json["tier"],
        change: json["change"],
        rank: json["rank"],
        sparkline: List<String>.from(json["sparkline"].map((x) => x)),
        lowVolume: json["lowVolume"],
        coinrankingUrl: json["coinrankingUrl"],
        the24HVolume: json["24hVolume"],
        btcPrice: json["btcPrice"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "symbol": symbol,
        "name": name,
        "color": color,
        "iconUrl": iconUrl,
        "marketCap": marketCap,
        "price": price,
        "listedAt": listedAt,
        "tier": tier,
        "change": change,
        "rank": rank,
        "sparkline": List<dynamic>.from(sparkline.map((x) => x)),
        "lowVolume": lowVolume,
        "coinrankingUrl": coinrankingUrl,
        "24hVolume": the24HVolume,
        "btcPrice": btcPrice,
      };
}

class Stats {
  Stats({
    required this.total,
    required this.totalCoins,
    required this.totalMarkets,
    required this.totalExchanges,
    required this.totalMarketCap,
    required this.total24HVolume,
  });

  int total;
  int totalCoins;
  int totalMarkets;
  int totalExchanges;
  String totalMarketCap;
  String total24HVolume;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        total: json["total"],
        totalCoins: json["totalCoins"],
        totalMarkets: json["totalMarkets"],
        totalExchanges: json["totalExchanges"],
        totalMarketCap: json["totalMarketCap"],
        total24HVolume: json["total24hVolume"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "totalCoins": totalCoins,
        "totalMarkets": totalMarkets,
        "totalExchanges": totalExchanges,
        "totalMarketCap": totalMarketCap,
        "total24hVolume": total24HVolume,
      };
}
