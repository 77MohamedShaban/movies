import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/features/auth/data/model/avatar_model.dart';
import 'package:movies/features/main_layout/home/data/model/movie_model.dart';

abstract class AppConstants {
  static List<AvatarModel> avatarList = [
    AvatarModel(image: AssetsManager.avatar_1, id: "1"),
    AvatarModel(image: AssetsManager.avatar_2, id: "2"),
    AvatarModel(image: AssetsManager.avatar_3, id: "3"),
    AvatarModel(image: AssetsManager.avatar_4, id: "4"),
    AvatarModel(image: AssetsManager.avatar_5, id: "5"),
    AvatarModel(image: AssetsManager.avatar_6, id: "6"),
    AvatarModel(image: AssetsManager.avatar_7, id: "7"),
    AvatarModel(image: AssetsManager.avatar_8, id: "8"),
    AvatarModel(image: AssetsManager.avatar_9, id: "9"),
  ];
  static List<MovieModel> dumiMovies = [
    MovieModel(image: AssetsManager.onBoarding_1, rate: 7.7),
    MovieModel(image: AssetsManager.onBoarding_2, rate: 6.7),
    MovieModel(image: AssetsManager.onBoarding_3, rate: 5.7),
    MovieModel(image: AssetsManager.onBoarding_4, rate:2.7),
    MovieModel(image: AssetsManager.onBoarding_6, rate: 5.7),
    MovieModel(image: AssetsManager.onBoarding_1, rate:2.7),
    MovieModel(image: AssetsManager.onBoarding_2, rate: 5.7),
    MovieModel(image: AssetsManager.onBoarding_3, rate: 5.1),
    MovieModel(image: AssetsManager.onBoarding_5, rate: 2.7),
    MovieModel(image: AssetsManager.onBoarding_4, rate: 7.7),
  ];
}
