import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/strings_Manager.dart';
import 'package:movies/core/reusable_component/main_btn.dart';
import 'package:movies/core/reusable_component/ui_utils.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 50, left: 24, right: 24, bottom: 16),
      child: Column(
        spacing: 24.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                spacing: 16.h,
                children: [
                  Image.asset(
                    AssetsManager.avatar_1,
                    width: 118.w,
                    height: 118.h,
                  ),
                  Text(
                    "Name",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 20.h,
                children: [
                  Text(
                    "12",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    StringsManager.wishList,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 20.h,
                children: [
                  Text(
                    "10",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    StringsManager.history,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: MainBtn(
                  text: StringsManager.editProfile,
                  onClick: () {},
                ),
              ),
              MainBtn(
                text: StringsManager.exit,
                onClick: () {
                  UiUtils.showAlertDialog(
                    context,
                    title: StringsManager.exit,
                    message: StringsManager.logoutMessage,
                    confirmText: StringsManager.exit,
                    onConfirm: () {
                      // TODO: Add logout logic here
                    },
                  );
                },
                width: 120.w,
                exiteBtn: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
