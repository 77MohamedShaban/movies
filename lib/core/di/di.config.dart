// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_source/auth_remote_dao.dart' as _i718;
import '../../features/auth/data/data_source_impl/auth_remote_dao_impl.dart'
    as _i397;
import '../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i279;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/use_case/forget_use_case.dart' as _i559;
import '../../features/auth/domain/use_case/login_use_case.dart' as _i973;
import '../../features/auth/domain/use_case/sign_in_with_google_use_case.dart'
    as _i69;
import '../../features/auth/domain/use_case/sign_up_use_case.dart' as _i426;
import '../../features/auth/presentation/view_models/forget_password/forget_cubit.dart'
    as _i329;
import '../../features/auth/presentation/view_models/log_in/log_in_cubit.dart'
    as _i572;
import '../../features/auth/presentation/view_models/sign_up/sign_up_cubit.dart'
    as _i330;
import 'injectable_module.dart' as _i109;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i59.FirebaseAuth>(() => injectableModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => injectableModule.firestore);
    gh.lazySingleton<_i116.GoogleSignIn>(() => injectableModule.googleSignIn);
    gh.factory<_i718.AuthRemoteDao>(
      () => _i397.AuthRemoteDataSourceImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
        gh<_i116.GoogleSignIn>(),
      ),
    );
    gh.factory<_i170.AuthRepo>(
      () => _i279.AuthRepositoryImpl(gh<_i718.AuthRemoteDao>()),
    );
    gh.factory<_i559.ForgetUseCase>(
      () => _i559.ForgetUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i973.LoginUseCase>(
      () => _i973.LoginUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i69.SignInWithGoogleUseCase>(
      () => _i69.SignInWithGoogleUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i426.SignUpUseCase>(
      () => _i426.SignUpUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i572.LogInCubit>(
      () => _i572.LogInCubit(
        gh<_i973.LoginUseCase>(),
        gh<_i69.SignInWithGoogleUseCase>(),
      ),
    );
    gh.factory<_i329.ForgetCubit>(
      () => _i329.ForgetCubit(gh<_i559.ForgetUseCase>()),
    );
    gh.factory<_i330.SignUpCubit>(
      () => _i330.SignUpCubit(gh<_i426.SignUpUseCase>()),
    );
    return this;
  }
}

class _$InjectableModule extends _i109.InjectableModule {}
