import 'package:crypto_teste/models/crypto_model.dart';
import 'package:flutter/material.dart';

class CardCoin extends StatelessWidget {
  const CardCoin({super.key, required this.cryptos,});

  final List<CryptoTracker> cryptos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cryptos.length,
      itemBuilder: (context, index) {
        final crypto = cryptos[index];
        return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(16, 2, 16, 0),
          child: Card(
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  height: 60,
                  width: 60,
                  child: Image.network(crypto.image),
                ),
                Column(
                  children: [
                    Text(crypto.name!, style: const TextStyle(color: Colors.white, fontSize: 18),),
                    const SizedBox(height: 8,),
                    Text(crypto.symbol!, style: const TextStyle(color: Colors.white, fontSize: 16),)  
                  ],
                ),
                Column(
                  children: [
                    Text("\$ ${crypto.currentPrice}", style: const TextStyle(color: Colors.white, fontSize: 16),),
                    const SizedBox(height: 8,),
                    Text(
                      crypto.priceChangePercentage24h! <= 0 ? " -${crypto.priceChangePercentage24h}%" :
                      "+ ${crypto.priceChangePercentage24h}%", 
                      style: TextStyle(
                        color: crypto.priceChangePercentage24h! <= 0 ? Colors.red :
                        Colors.green, 
                        fontSize: 16
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
              ),
        );
      },
    );
  }
}