import 'package:flutter_tdd_new/configs/routers/e_page.dart';
import 'package:flutter_tdd_new/configs/routers/page_config.dart';
import 'package:flutter_tdd_new/modules/auth/login/presentation/screens/login_screen.dart';
import 'package:flutter_tdd_new/modules/home/presentation/screens/home_screen.dart';
import 'package:flutter_tdd_new/modules/not_found/presentation/screens/not_found_screen.dart';

abstract class Path {
  static const login = '/login';
  static const home = '/';
}

Map<String, EPage Function(Map<String, dynamic>)> _routes = {
  Path.login: (args) => LoginScreen(args: args),
  Path.home: (args) => HomeScreen(args: args),
};

EPage getEPage(PageConfig config) {
  final p = _routes[config.route]?.call(config.args) ??
      NotFoundScreen(args: config.args);
  return p;
}
