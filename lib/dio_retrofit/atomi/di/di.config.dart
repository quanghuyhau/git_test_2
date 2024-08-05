// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:learn_flutter/dio_retrofit/atomi/authentication/login/cubit/login_cubit.dart'
    as _i208;
import 'package:learn_flutter/dio_retrofit/atomi/authentication/signup/cubit/signup_cubit.dart'
    as _i182;
import 'package:learn_flutter/dio_retrofit/atomi/di/di_module.dart' as _i977;
import 'package:learn_flutter/dio_retrofit/atomi/weather/cubit/weather_cubit.dart'
    as _i996;
import 'package:learn_flutter/dio_retrofit/atomi/weather/service/weather_service.dart'
    as _i880;
import 'package:logger/logger.dart' as _i974;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.factory<_i182.SignUpCubit>(() => _i182.SignUpCubit());
    gh.lazySingleton<_i59.FirebaseAuth>(() => injectionModule.firebaseAuth);
    gh.lazySingleton<_i974.Logger>(() => injectionModule.logger);
    gh.factory<_i208.LoginCubit>(() => _i208.LoginCubit(
          gh<_i59.FirebaseAuth>(),
          gh<_i974.Logger>(),
        ));
    gh.factory<_i996.WeatherCubit>(
        () => _i996.WeatherCubit(gh<_i880.WeatherService>()));
    return this;
  }
}

class _$InjectionModule extends _i977.InjectionModule {}
