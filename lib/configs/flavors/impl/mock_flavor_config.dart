import 'package:flutter_tdd_new/configs/flavors/flavor_config.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@Environment(Env.test)
@Singleton(as: FlavorConfig)
class MockFlavorConfig extends Mock implements FlavorConfig {}
