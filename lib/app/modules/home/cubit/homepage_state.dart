part of 'homepage_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  factory HomePageState.initial() = _Initial;
  factory HomePageState.loading() = _Loading;
  factory HomePageState.data(CoinModel coinModel) = _Data;
  factory HomePageState.error(String message) = _Error;
}
