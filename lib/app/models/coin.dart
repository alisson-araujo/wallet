import 'dart:convert';

class CoinModel {
  final String? code;
  final String? codein;
  final String? name;
  final String? high;
  final String? low;
  final String? varBid;
  final String? pctChange;
  final String? bid;
  final String? ask;
  final String? timestamp;
  final String? createDate;

  CoinModel({
    this.code,
    this.codein,
    this.name,
    this.high,
    this.low,
    this.varBid,
    this.pctChange,
    this.bid,
    this.ask,
    this.timestamp,
    this.createDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'codein': codein,
      'name': name,
      'high': high,
      'low': low,
      'varBid': varBid,
      'pctChange': pctChange,
      'bid': bid,
      'ask': ask,
      'timestamp': timestamp,
      'createDate': createDate,
    };
  }

  factory CoinModel.fromMap(Map<String, dynamic> map) {
    return CoinModel(
      code: map['code'] ?? '',
      codein: map['codein'] ?? '',
      name: map['name'] ?? '',
      high: map['hight'] ?? '',
      low: map['low'] ?? '',
      varBid: map['varBid'] ?? '',
      pctChange: map['pctChange'] ?? '',
      bid: map['bid'] ?? '',
      ask: map['ask'] ?? '',
      timestamp: map['timestamp'] ?? '',
      createDate: map['create_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinModel.fromJson(String source) =>
      CoinModel.fromMap(json.decode(source));
}
