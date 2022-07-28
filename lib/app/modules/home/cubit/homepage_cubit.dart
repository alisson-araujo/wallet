import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:finances_control/app/models/coin.dart';
import 'package:finances_control/repositories/exchange.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'homepage_state.dart';
part 'homepage_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final ExchangeRepository _exchangeRepository;

  HomePageCubit({required ExchangeRepository exchangeRepository})
      : _exchangeRepository = exchangeRepository,
        super(HomePageState.initial());

  Future verifyPrice(String param) async {
    try {
      emit(HomePageState.loading());
      final coin = await _exchangeRepository.price(param);
      emit(HomePageState.data(coin));
    } catch (e) {
      log('Erro ao buscar cotação', error: e);
      emit(HomePageState.error('Erro ao buscar cotação'));
    }
  }
}
