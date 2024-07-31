import 'package:json_annotation/json_annotation.dart';

part 'coin_model.g.dart';

@JsonSerializable()
class CoinModel {
  String? name;
  String? symbol;
  String? image;
  @JsonKey(name: 'current_price')
  double? currentPrice;
  @JsonKey(name: 'price_change_24h')
  double? priceChange24H;
  @JsonKey(name: 'price_change_percentage_24h')
  double? priceChangePercentage24H;

  CoinModel({
    this.name,
    this.symbol,
    this.image,
    this.currentPrice,
    this.priceChange24H,
    this.priceChangePercentage24H,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoinModelToJson(this);
}
