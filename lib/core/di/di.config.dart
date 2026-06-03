// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
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
import '../../features/main_layout/browse/data/api/browse_client.dart' as _i421;
import '../../features/main_layout/browse/data/data_source/browse_dao.dart'
    as _i397;
import '../../features/main_layout/browse/data/data_source_impl/browse_dao_impl.dart'
    as _i341;
import '../../features/main_layout/browse/data/repo_impl/browse_repo_impl.dart'
    as _i38;
import '../../features/main_layout/browse/domain/repo/browse_repo.dart'
    as _i838;
import '../../features/main_layout/browse/domain/use_case/get_by_genre_use_case.dart'
    as _i928;
import '../../features/main_layout/browse/presentation/view_models/browse_cubit.dart'
    as _i673;
import '../../features/main_layout/home/data/api/home_client.dart' as _i687;
import '../../features/main_layout/home/data/data_source/home_dao.dart' as _i1;
import '../../features/main_layout/home/data/data_source_impl/home_dao_impl.dart'
    as _i551;
import '../../features/main_layout/home/data/repo_impl/home_repo_impl.dart'
    as _i263;
import '../../features/main_layout/home/domain/repo/home_repo.dart' as _i741;
import '../../features/main_layout/home/domain/use_case/get_by_genre_use_case.dart'
    as _i508;
import '../../features/main_layout/home/domain/use_case/get_movies_use_case.dart'
    as _i564;
import '../../features/main_layout/home/presentation/view_models/home_cubit.dart'
    as _i96;
import '../../features/main_layout/search/data/api/search_client.dart' as _i723;
import '../../features/main_layout/search/data/data_source/search_dao.dart'
    as _i9;
import '../../features/main_layout/search/data/data_source_impl/search_dao_impl.dart'
    as _i300;
import '../../features/main_layout/search/data/repo_impl/search_repo_impl.dart'
    as _i665;
import '../../features/main_layout/search/domain/repo/search_repo.dart'
    as _i801;
import '../../features/main_layout/search/domain/use_case/search_movie_use_case.dart'
    as _i350;
import '../../features/main_layout/search/presentation/view_models/search_cubit.dart'
    as _i991;
import '../../features/movie_details/data/api/movie_details_client.dart'
    as _i1048;
import '../../features/movie_details/data/data_source/movie_details_dao.dart'
    as _i11;
import '../../features/movie_details/data/data_source_impl/movie_details_dao_impl.dart'
    as _i1047;
import '../../features/movie_details/data/repo_impl/movie_details_repo_impl.dart'
    as _i54;
import '../../features/movie_details/domain/repo/movie_details_repo.dart'
    as _i293;
import '../../features/movie_details/domain/use_case/get_movie_details_use_case.dart'
    as _i448;
import '../../features/movie_details/domain/use_case/get_similar_movies_use_case.dart'
    as _i1064;
import '../../features/movie_details/presentation/view_models/movie_details_cubit.dart'
    as _i894;
import 'injectable_module.dart' as _i109;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    gh.factory<_i361.Dio>(() => injectableModule.createDio());
    gh.lazySingleton<_i59.FirebaseAuth>(() => injectableModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => injectableModule.firestore);
    gh.lazySingleton<_i116.GoogleSignIn>(() => injectableModule.googleSignIn);
    gh.singleton<_i421.BrowseClient>(() => _i421.BrowseClient(gh<_i361.Dio>()));
    gh.singleton<_i687.HomeClient>(() => _i687.HomeClient(gh<_i361.Dio>()));
    gh.singleton<_i723.SearchClient>(() => _i723.SearchClient(gh<_i361.Dio>()));
    gh.singleton<_i1048.MovieDetailsClient>(
      () => _i1048.MovieDetailsClient(gh<_i361.Dio>()),
    );
    gh.factory<_i718.AuthRemoteDao>(
      () => _i397.AuthRemoteDataSourceImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
        gh<_i116.GoogleSignIn>(),
      ),
    );
    gh.factory<_i1.HomeDao>(() => _i551.HomeDaoImpl(gh<_i687.HomeClient>()));
    gh.factory<_i11.MovieDetailsDao>(
      () => _i1047.MovieDetailsDaoImpl(gh<_i1048.MovieDetailsClient>()),
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
    gh.factory<_i741.HomeRepo>(() => _i263.HomeRepoImpl(gh<_i1.HomeDao>()));
    gh.factory<_i397.BrowseDao>(
      () => _i341.BrowseDaoImpl(gh<_i421.BrowseClient>()),
    );
    gh.factory<_i9.SearchDao>(
      () => _i300.SearchDaoImpl(gh<_i723.SearchClient>()),
    );
    gh.factory<_i801.SearchRepo>(
      () => _i665.SearchRepoImpl(gh<_i9.SearchDao>()),
    );
    gh.factory<_i293.MovieDetailsRepo>(
      () => _i54.MovieDetailsRepoImpl(gh<_i11.MovieDetailsDao>()),
    );
    gh.factory<_i350.SearchMovieUseCase>(
      () => _i350.SearchMovieUseCase(gh<_i801.SearchRepo>()),
    );
    gh.factory<_i508.GetByGenreUseCase>(
      () => _i508.GetByGenreUseCase(gh<_i741.HomeRepo>()),
    );
    gh.factory<_i564.GetMoviesUseCase>(
      () => _i564.GetMoviesUseCase(gh<_i741.HomeRepo>()),
    );
    gh.factory<_i96.HomeCubit>(
      () => _i96.HomeCubit(
        gh<_i564.GetMoviesUseCase>(),
        gh<_i508.GetByGenreUseCase>(),
      ),
    );
    gh.factory<_i572.LogInCubit>(
      () => _i572.LogInCubit(
        gh<_i973.LoginUseCase>(),
        gh<_i69.SignInWithGoogleUseCase>(),
      ),
    );
    gh.factory<_i991.SearchCubit>(
      () => _i991.SearchCubit(gh<_i350.SearchMovieUseCase>()),
    );
    gh.factory<_i329.ForgetCubit>(
      () => _i329.ForgetCubit(gh<_i559.ForgetUseCase>()),
    );
    gh.factory<_i330.SignUpCubit>(
      () => _i330.SignUpCubit(gh<_i426.SignUpUseCase>()),
    );
    gh.factory<_i838.BrowseRepo>(
      () => _i38.BrowseRepoImpl(gh<_i397.BrowseDao>()),
    );
    gh.factory<_i448.GetMovieDetailsUseCase>(
      () => _i448.GetMovieDetailsUseCase(gh<_i293.MovieDetailsRepo>()),
    );
    gh.factory<_i1064.GetSimilarMoviesUseCase>(
      () => _i1064.GetSimilarMoviesUseCase(gh<_i293.MovieDetailsRepo>()),
    );
    gh.factory<_i928.GetByGenreUseCase>(
      () => _i928.GetByGenreUseCase(gh<_i838.BrowseRepo>()),
    );
    gh.factory<_i894.MovieDetailsCubit>(
      () => _i894.MovieDetailsCubit(
        gh<_i448.GetMovieDetailsUseCase>(),
        gh<_i1064.GetSimilarMoviesUseCase>(),
      ),
    );
    gh.factory<_i673.BrowseCubit>(
      () => _i673.BrowseCubit(gh<_i928.GetByGenreUseCase>()),
    );
    return this;
  }
}

class _$InjectableModule extends _i109.InjectableModule {}
