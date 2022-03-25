import 'package:flutter/material.dart';
import 'package:flutter_tdd_new/configs/flavors/flavor_config.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:injectable/injectable.dart';

@Environment(Env.prod)
@Singleton(as: FlavorConfig)
class ProdFlavorValue implements FlavorConfig {
  @override
  String get baseUrl => 'https://reqres.in';

  @override
  Color get backgroundColor => Colors.indigoAccent;

  @override
  String get name => 'PROD';
}
