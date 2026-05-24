import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/app_constants.dart';
import 'package:movies/core/resources/strings_Manager.dart';

class AvatarWidget extends StatefulWidget {
  final Function(String avatarId) onAvatarSelected;
  const AvatarWidget({super.key, required this.onAvatarSelected});

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  late int selectedAvatar;

  late final PageController pageController;

  @override
  void initState() {
    selectedAvatar = AppConstants.avatarList.length ~/ 2;
    pageController = PageController(
      viewportFraction: 0.35,
      initialPage: selectedAvatar,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150.h,
          child: PageView.builder(
            controller: pageController,
            itemCount: AppConstants.avatarList.length,
            onPageChanged: (index) {
              setState(() {
                selectedAvatar = index;
              });
              widget.onAvatarSelected(
                AppConstants.avatarList[index].id,
              );
            },
            itemBuilder: (context, index) {
              final isSelected = selectedAvatar == index;

              return GestureDetector(
                onTap: () {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );

                  setState(() {
                    selectedAvatar = index;
                  });

                  widget.onAvatarSelected(
                    AppConstants.avatarList[index].id,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: isSelected ? 0 : 15.h,
                  ),
                  child: Transform.scale(
                    scale: isSelected ? 1.2 : 0.8,
                    child: Image.asset(AppConstants.avatarList[index].image),
                  ),
                ),
              );
            },
          ),
        ),

        SizedBox(height: 10.h),

        Text(
          StringsManager.avatar,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
