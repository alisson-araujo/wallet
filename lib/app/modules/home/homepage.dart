import 'package:finances_control/app/models/coin.dart';
import 'package:finances_control/app/modules/home/cubit/homepage_cubit.dart';
import 'package:finances_control/app/modules/home/widgets/coin_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocSelector<HomePageCubit, HomePageState, CoinModel>(
        selector: (state) {
          return state.maybeWhen(
            data: (coin) => coin,
            orElse: () => CoinModel(),
          );
        },
        builder: (_, coin) {
          return Center(
            child: CoinCard(
              coinLabel: 'Dólar',
              coinPrice: double.parse(coin.ask!),
              coinImg: 'assets/images/dollar.png',
              variation: double.parse(coin.varBid!),
            ),
          );
        },
      ),
    );
  }
}
