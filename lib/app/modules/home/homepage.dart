import 'package:finances_control/app/models/coin.dart';
import 'package:finances_control/app/modules/home/cubit/homepage_cubit.dart';
import 'package:finances_control/app/modules/home/widgets/coin_card.dart';
import 'package:finances_control/repositories/exchange.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageCubit, HomePageState>(
      listener: (context, state) {
        if (state.status == HomePageStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Erro ao carregar dados')));
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              BlocSelector<HomePageCubit, HomePageState, bool>(
                bloc: HomePageCubit(exchangeRepository: ExchangeRepository()),
                selector: (state) => state.status == HomePageStatus.loading,
                builder: (context, showLoading) => showLoading
                    ? const SizedBox(
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      )
                    : const SizedBox(),
              ),
              BlocSelector<HomePageCubit, HomePageState, CoinModel>(
                selector: (state) => state.coinModel!,
                builder: (context, coin) {
                  return CoinCard(
                    coinLabel: 'Dólar',
                    coinPrice: double.parse(coin.ask.toString()),
                    variation: double.parse(coin.varBid.toString()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
