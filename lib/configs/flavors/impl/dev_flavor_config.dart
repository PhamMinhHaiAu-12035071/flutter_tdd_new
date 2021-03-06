import 'package:flutter/material.dart';
import 'package:flutter_tdd_new/configs/flavors/flavor_config.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:injectable/injectable.dart';

@Environment(Env.dev)
@Environment(Env.endToEndTest)
@Singleton(as: FlavorConfig)
class DevFlavorValue implements FlavorConfig {
  @override
  String get baseUrl => 'https://reqres.in';

  @override
  Color get backgroundColor => Colors.teal;

  @override
  String get name => 'DEV';
}
