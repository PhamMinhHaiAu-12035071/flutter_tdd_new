import 'package:flutter/material.dart';
import 'package:flutter_tdd_new/configs/di/injection.dart';
import 'package:flutter_tdd_new/configs/flavors/flavor_config.dart';
import 'package:flutter_tdd_new/configs/routers/e_route_information_parser.dart';
import 'package:flutter_tdd_new/configs/routers/e_router_delegate.dart';
import 'package:flutter_tdd_new/configs/routers/navigation_cubit.dart';
import 'package:flutter_tdd_new/configs/routers/page_config.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/modules/home/presentation/screens/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  setUp(() async {
    await configureInjection(environment: Env.test);
    when(() => getIt<FlavorConfig>().baseUrl).thenReturn('https://reqres.in');
    when(() => getIt<FlavorConfig>().name).thenReturn('test');
    when(() => getIt<FlavorConfig>().backgroundColor).thenReturn(Colors.red);
  });
  tearDown(() async {
    await getIt.reset();
  });

  group('HomeScreen', () {
    testWidgets('renders a HomeView ', (tester) async {
      final _routeInformationParser = ERouteInformationParser();
      final _routerDelegate = ERouterDelegate(
        cubit: NavigationCubit([PageConfig(location: '/')]),
      );

      await tester.pumpWidget(
        MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routeInformationParser: _routeInformationParser,
          routerDelegate: _routerDelegate,
        ),
      );

      expect(find.byType(HomeView), findsOneWidget);
    });
  });
}
