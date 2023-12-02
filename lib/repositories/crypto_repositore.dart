import 'dart:convert';
import 'package:crypto_teste/models/crypto_model.dart';
import 'package:http/http.dart' as http;

const request = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";



Future<List<CryptoTracker>> getData() async {
  final response = await http.get(Uri.parse(request));

  if(response.statusCode == 200){
    final body = jsonDecode(response.body);

    return List<CryptoTracker>.from(body.map((element){
      return CryptoTracker.fromJson(element);
    }));
  }else{
    throw Exception("Não foi possivel carregar os dados!");
  }
}

