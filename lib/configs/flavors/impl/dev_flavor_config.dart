import 'package:flutter_tdd_new/configs/flavors/flavor_config.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:injectable/injectable.dart';

@Environment(Env.prod)
@Environment(Env.stg)
@Environment(Env.dev)
@Environment(Env.endToEndTest)
@Singleton(as: FlavorConfig)
class DevFlavorValue implements FlavorConfig {
  @override
  String get baseUrl => 'https://reqres.in';
}
