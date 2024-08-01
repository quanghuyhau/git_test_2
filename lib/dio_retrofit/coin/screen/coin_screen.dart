import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:learn_flutter/dio_retrofit/coin/models/coin_model.dart';
import 'package:learn_flutter/dio_retrofit/coin/service/coin_service.dart';

class CoinListScreen extends StatefulWidget {
  @override
  _CoinListScreenState createState() => _CoinListScreenState();
}

class _CoinListScreenState extends State<CoinListScreen> {
   CoinService? _coinService;

  @override
  void initState() {
    super.initState();
    _coinService = CoinService(Dio());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio-Retrofit'),
      ),
      body: FutureBuilder<List<CoinModel>>(
        future: _coinService?.getCoins(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<CoinModel> coins  = snapshot.data ?? <CoinModel>[];
            return _buildCoin(context, coins);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
  _buildCoin(BuildContext context, List<CoinModel> coins){
    return ListView.builder(
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final coin = coins[index];
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            height: 150,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.tealAccent,
                  offset: Offset(4, 4),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: [
               _image(coin),
                _nameAndSymbol(coin),
                _price(coin),
              ],
            ),
          ),
        );
      },
    );
  }

   _image(coin){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 60,
        width: 60,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.network(coin.image ?? ''),
        ),
      ),
    );
   }
   _nameAndSymbol(coin){
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                coin.name ?? '',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                coin.symbol ?? '',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
   }
   _price(coin){
    return Padding(padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "\$ ${coin.currentPrice?.toString() ?? ''}",
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            coin.priceChange24H != null &&
                coin.priceChange24H! < 0
                ? '${coin.priceChange24H?.toStringAsFixed(2)} \$'
                : '+${coin.priceChange24H?.toStringAsFixed(2) ?? ''} \$',
            style: TextStyle(
              color: coin.priceChange24H != null &&
                  coin.priceChange24H! < 0
                  ? Colors.red
                  : Colors.blue,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            coin.priceChangePercentage24H != null &&
                coin.priceChangePercentage24H! < 0
                ? '${coin.priceChangePercentage24H?.toStringAsFixed(2)}%'
                : '+${coin.priceChangePercentage24H?.toStringAsFixed(2) ?? ''}%',
            style: TextStyle(
              color: coin.priceChangePercentage24H != null &&
                  coin.priceChangePercentage24H! < 0
                  ? Colors.red
                  : Colors.blue,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
   }
}
