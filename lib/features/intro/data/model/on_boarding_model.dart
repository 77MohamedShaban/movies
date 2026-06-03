import 'dart:ui';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_Manager.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String? des;
  final Color gradientColor;

  const OnBoardingModel({
    required this.image,
    required this.title,
    this.des,
    required this.gradientColor,
  });

  static List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      image: AssetsManager.onBoarding_2,
      title: StringsManager.onBoardingTitle_2,
      des: StringsManager.onBoardingDes_2,
      gradientColor: ColorsManager.gradientColor_1,
    ),
    OnBoardingModel(
      image: AssetsManager.onBoarding_3,
      title: StringsManager.onBoardingTitle_3,
      des: StringsManager.onBoardingDes_3,
      gradientColor: ColorsManager.gradientColor_2,
    ),
    OnBoardingModel(
      image: AssetsManager.onBoarding_4,
      title: StringsManager.onBoardingTitle_4,
      des: StringsManager.onBoardingDes_4,
      gradientColor: ColorsManager.gradientColor_3,
    ),
    OnBoardingModel(
      image: AssetsManager.onBoarding_5,
      title: StringsManager.onBoardingTitle_5,
      des: StringsManager.onBoardingDes_5,
      gradientColor: ColorsManager.gradientColor_4,
    ),
    OnBoardingModel(
      image: AssetsManager.onBoarding_6,
      title: StringsManager.onBoardingTitle_6,
      gradientColor: ColorsManager.gradientColor_5,
    ),
  ];
}
