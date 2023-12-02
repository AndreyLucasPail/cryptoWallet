import 'package:crypto_teste/models/crypto_model.dart';
import 'package:crypto_teste/repositories/crypto_repositore.dart';
import 'package:crypto_teste/widgets/card_coin.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatefulWidget {
  const WalletCard({super.key,});

  @override
  State<WalletCard> createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {

  Future<List<CryptoTracker>>? futureCrypto;

  @override
  void initState() {
    super.initState();

    futureCrypto = getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: futureCrypto, 
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if(snapshot.hasError){
          return const Center(
            child: Text("Erro!!"),
          );
        } else {
          final crypto = snapshot.data as List<CryptoTracker>;
          return CardCoin(cryptos: crypto,);
        }
      }
    );
  }
}