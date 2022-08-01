part of 'homepage_cubit.dart';

enum HomePageStatus { initial, loading, data, error }

class HomePageState {
  final HomePageStatus status;
  final CoinModel? coinModel;

  const HomePageState._({required this.status, this.coinModel});

  const HomePageState.initial() : this._(status: HomePageStatus.initial);

  HomePageState.loading() : this._(status: HomePageStatus.loading);
  HomePageState.data(CoinModel coinModel)
      : this._(status: HomePageStatus.data, coinModel: coinModel);
  HomePageState.error() : this._(status: HomePageStatus.error);

  HomePageState copyWith({
    HomePageStatus? status,
    CoinModel? coinModel,
  }) {
    return HomePageState._(
      status: status ?? this.status,
      coinModel: coinModel ?? this.coinModel,
    );
  }

  // HomePageState.loading() = _Loading;
  // HomePageState.data(CoinModel coinModel) = _Data;
  // HomePageState.error(String message) = _Error;
}
