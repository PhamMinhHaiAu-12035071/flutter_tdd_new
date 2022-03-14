import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_new/configs/di/injection.dart';
import 'package:flutter_tdd_new/configs/routers/e_route_information_parser.dart';
import 'package:flutter_tdd_new/configs/routers/e_router_delegate.dart';
import 'package:flutter_tdd_new/configs/routers/navigation_cubit.dart';
import 'package:flutter_tdd_new/configs/routers/page_config.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main({String environment = Env.dev}) async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await configureInjection(environment: environment);
  BlocOverrides.runZoned(
    () => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ERouteInformationParser _routeInformationParser =
      ERouteInformationParser();
  final ERouterDelegate _routerDelegate =
      ERouterDelegate(cubit: NavigationCubit([PageConfig(location: '/')]));

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
    );
  }
}
