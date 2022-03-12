// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/auth/login/business_logic/bloc/login_form_bloc.dart'
    as _i13;
import '../../modules/auth/login/business_logic/bloc/mock_login_form_bloc.dart'
    as _i14;
import '../../modules/auth/login/data/data_providers/impl/mock_user_api.dart'
    as _i16;
import '../../modules/auth/login/data/data_providers/impl/user_api_impl.dart'
    as _i17;
import '../../modules/auth/login/data/data_providers/user_api.dart' as _i15;
import '../../modules/auth/login/data/repositories/impl/mock_user_repository.dart'
    as _i19;
import '../../modules/auth/login/data/repositories/impl/user_repository_impl.dart'
    as _i20;
import '../../modules/auth/login/data/repositories/user_repository.dart'
    as _i18;
import '../../shared/data/networks/client_common.dart' as _i4;
import '../../shared/data/networks/client_no_cache.dart' as _i7;
import '../../shared/data/networks/impl/client_common_impl.dart' as _i5;
import '../../shared/data/networks/impl/client_no_cache_impl.dart' as _i8;
import '../../shared/data/networks/impl/mock_client_common.dart' as _i6;
import '../../shared/data/networks/impl/mock_client_no_cache.dart' as _i9;
import '../../shared/services/http/http_module.dart' as _i21;
import '../flavors/flavor_config.dart' as _i10;
import '../flavors/impl/dev_flavor_config.dart' as _i12;
import '../flavors/impl/mock_flavor_config.dart' as _i11;

const String _prod = 'prod';
const String _stg = 'stg';
const String _dev = 'dev';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final httpModule = _$HttpModule();
  gh.singleton<_i3.Client>(httpModule.httpClient,
      registerFor: {_prod, _stg, _dev});
  gh.singleton<_i3.Client>(httpModule.mockClient, registerFor: {_test});
  gh.singleton<_i4.ClientCommon>(
      _i5.ClientCommonImpl(client: get<_i3.Client>()),
      registerFor: {_prod, _stg, _dev});
  gh.singleton<_i4.ClientCommon>(_i6.MockClientCommon(), registerFor: {_test});
  gh.singleton<_i7.ClientNoCache>(
      _i8.ClientNoCacheImpl(client: get<_i3.Client>()),
      registerFor: {_prod, _stg, _dev});
  gh.singleton<_i7.ClientNoCache>(_i9.MockClientNoCache(),
      registerFor: {_test});
  gh.singleton<_i10.FlavorConfig>(_i11.MockFlavorConfig(),
      registerFor: {_test});
  gh.singleton<_i10.FlavorConfig>(_i12.DevFlavorValue(),
      registerFor: {_prod, _stg, _dev});
  gh.singleton<_i13.LoginFormBloc>(_i14.MockLoginFormBloc(),
      registerFor: {_test});
  gh.singleton<_i15.UserAPI>(_i16.MockUserAPI(), registerFor: {_test});
  gh.singleton<_i15.UserAPI>(
      _i17.UserAPIImpl(
          flavorConfig: get<_i10.FlavorConfig>(),
          clientCommon: get<_i4.ClientCommon>()),
      registerFor: {_prod, _stg, _dev});
  gh.singleton<_i18.UserRepository>(_i19.MockUserRepository(),
      registerFor: {_test});
  gh.singleton<_i18.UserRepository>(
      _i20.UserRepositoryImpl(userAPI: get<_i15.UserAPI>()),
      registerFor: {_prod, _stg, _dev});
  gh.singleton<_i13.LoginFormBloc>(
      _i13.LoginFormBloc(userRepository: get<_i18.UserRepository>()),
      registerFor: {_prod, _stg, _dev});
  return get;
}

class _$HttpModule extends _i21.HttpModule {}
