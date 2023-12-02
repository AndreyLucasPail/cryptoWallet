class CryptoTracker{
  CryptoTracker({this.id, this.symbol, this.currentPrice, required this.image, this.name, 
    this.priceChangePercentage24h});

  String? id;
  String? symbol;
  String image;
  String? name;
  double? currentPrice;
  double? priceChangePercentage24h = 0.0;

  factory CryptoTracker.fromJson(Map<String, dynamic> json){
    return CryptoTracker(
      id: json["id"],
      symbol: json["symbol"],
      name: json["name"],
      currentPrice: json["current_price"] * 1.0,
      image: json["image"],
      priceChangePercentage24h: json["price_change_percentage_24h"] * 1.0,
    );
  }

}