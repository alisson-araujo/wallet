import 'package:finances_control/app/utils/app_config_ui.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final String coinLabel;
  final double coinPrice;
  final String coinImg;
  final double variation;
  const CoinCard({
    super.key,
    required this.coinLabel,
    required this.coinPrice,
    required this.coinImg,
    required this.variation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 180,
      decoration: BoxDecoration(
        color: AppConfigUI.theme.primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  coinLabel,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    SizedBox(
                      child: variation > 0
                          ? const Icon(Icons.arrow_upward, color: Colors.green)
                          : const Icon(Icons.arrow_downward, color: Colors.red),
                    ),
                    const SizedBox(width: 1),
                    Text('${(variation * 100).toStringAsFixed(1)}%',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15))
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'R\$ ${coinPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
