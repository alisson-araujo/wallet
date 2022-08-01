import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:finances_control/app/models/coin.dart';
import 'package:finances_control/repositories/exchange.dart';

part 'homepage_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final ExchangeRepository _exchangeRepository;

  HomePageCubit({required ExchangeRepository exchangeRepository})
      : _exchangeRepository = exchangeRepository,
        super(const HomePageState.initial());

  Future verifyPrice(String param) async {
    try {
      emit(state.copyWith(status: HomePageStatus.loading));
      final coin = await _exchangeRepository.price(param);
      emit(state.copyWith(status: HomePageStatus.data, coinModel: coin));
    } catch (e) {
      log('Erro ao buscar cotação', error: e);
      emit(state.copyWith(status: HomePageStatus.error));
    }
  }
}
