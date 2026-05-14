import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/remote/local/prefs_manager.dart';
import 'package:movies/core/resources/strings_Manager.dart';
import 'package:movies/core/reusable_component/main_btn.dart';
import 'package:movies/core/routes_manager/routes_name.dart';

import '../../../../data/model/on_boarding_model.dart';
import 'on_boarding_item.dart';

class NextItem extends StatefulWidget {
  const NextItem({super.key});

  @override
  State<NextItem> createState() => _NextItemState();
}

class _NextItemState extends State<NextItem> {
  late final PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemBuilder: (context, index) => OnBoardingItem(
              image: OnBoardingModel.onBoardingList[index].image,
              title: OnBoardingModel.onBoardingList[index].title,
              gradientColor:
                  OnBoardingModel.onBoardingList[index].gradientColor,
              des: OnBoardingModel.onBoardingList[index].des,
            ),
            itemCount: OnBoardingModel.onBoardingList.length,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            controller: _pageController,
          ),
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 16.h,
            children: [
              MainBtn(
                text: currentIndex <
                    OnBoardingModel.onBoardingList.length - 1 ? StringsManager.next:StringsManager.finish,
                onClick: () {
                  if (currentIndex <
                      OnBoardingModel.onBoardingList.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }else{
                    Navigator.pushReplacementNamed(context, RoutesName.signUp);
                    PrefsManager.buildOnBoarding(true);
                  }
                },
              ),
              Visibility(
                visible: currentIndex > 0,
                child: MainBtn(
                  text: StringsManager.back,
                  onClick: () {
                    if (currentIndex > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  isBorder: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
