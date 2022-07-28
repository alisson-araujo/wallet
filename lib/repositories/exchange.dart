import 'package:dio/dio.dart';
import 'package:finances_control/app/models/coin.dart';

class ExchangeRepository {
  Future price(String param) async {
    String url = 'https://economia.awesomeapi.com.br/last/$param';
    final response = await Dio().get(url);
    var model = CoinModel(
      code: response.data['USDBRL']['code'],
      codein: response.data['USDBRL']['codein'],
      name: response.data['USDBRL']['name'],
      high: response.data['USDBRL']['high'],
      low: response.data['USDBRL']['low'],
      varBid: response.data['USDBRL']['varBid'],
      pctChange: response.data['USDBRL']['pctChange'],
      bid: response.data['USDBRL']['bid'],
      ask: response.data['USDBRL']['ask'],
      timestamp: response.data['USDBRL']['timestamp'],
      createDate: response.data['USDBRL']['create_date'],
    );
    return model;
  }
}
