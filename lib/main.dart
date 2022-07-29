import 'package:finances_control/app/modules/home/cubit/homepage_cubit.dart';
import 'package:finances_control/app/modules/home/homepage.dart';
import 'package:finances_control/app/utils/app_config_ui.dart';
import 'package:finances_control/repositories/exchange.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ExchangeRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppConfigUI.theme,
        initialRoute: '/home',
        routes: {
          '/home': (_) {
            return BlocProvider(
              create: (context) => HomePageCubit(
                exchangeRepository: context.read(),
              )..verifyPrice('USD-BRL'),
              child: const HomePage(),
            );
          }
        },
      ),
    );
  }
}
