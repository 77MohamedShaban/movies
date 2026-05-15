import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/features/auth/data/model/avatar_model.dart';

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
}
