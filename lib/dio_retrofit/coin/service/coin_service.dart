import 'package:learn_flutter/dio_retrofit/coin/models/coin_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'coin_service.g.dart';

@RestApi(
    baseUrl:
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false')
abstract class CoinService {
  factory CoinService(Dio dio,{String baseUrl}) = _CoinService;

  @GET('/coins')
  Future<List<CoinModel>> getCoins();
}
