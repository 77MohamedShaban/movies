import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/app_constants.dart';
import '../../../../auth/data/model/sign_up_models/avatar_model.dart';

abstract class SelectAvatar {
  static Future<AvatarModel?> selectAvatarBottomSheet(
    BuildContext context,
    String selected,
  ) {
    return showModalBottomSheet<AvatarModel>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: REdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Container(
              height: 420.h,
              padding: REdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: GridView.builder(
                itemCount: AppConstants.avatarList.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120.w,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context, AppConstants.avatarList[index]);
                    },
                    child: Container(
                      padding: REdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selected == AppConstants.avatarList[index].id
                            ? Theme.of(context).colorScheme.onPrimaryContainer.withValues(alpha: .56)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                      ),
                      child: Image.asset(AppConstants.avatarList[index].image),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
