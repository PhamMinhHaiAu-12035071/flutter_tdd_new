import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/shared/data/networks/client_no_cache.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@Environment(Env.test)
@Singleton(as: ClientNoCache)
class MockClientNoCache extends Mock implements ClientNoCache {}
