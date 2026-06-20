import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/strings_Manager.dart';
import 'package:movies/core/reusable_component/main_btn.dart';
import 'package:movies/core/reusable_component/ui_utils.dart';
import 'package:movies/core/routes_manager/routes_name.dart';
import '../../../../../auth/domain/entity/user_entity.dart';
import '../../view_models/profile_cubit.dart';

class Header extends StatelessWidget {
  final UserEntity user;
  final String watchlistCount;
  final String historyCount;

  const Header({
    super.key,
    required this.user,
    this.watchlistCount = "0",
    this.historyCount = "0",
  });

  String _getAvatarPath(String? avatarId) {
    switch (avatarId) {
      case "1": return AssetsManager.avatar_1;
      case "2": return AssetsManager.avatar_2;
      case "3": return AssetsManager.avatar_3;
      case "4": return AssetsManager.avatar_4;
      case "5": return AssetsManager.avatar_5;
      case "6": return AssetsManager.avatar_6;
      case "7": return AssetsManager.avatar_7;
      case "8": return AssetsManager.avatar_8;
      case "9": return AssetsManager.avatar_9;
      default: return AssetsManager.avatar_1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final avatar = _getAvatarPath(user.avatarId);
    final name = user.name ?? "";

    return Padding(
      padding: REdgeInsets.only(top: 20, left: 24, right: 24, bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(avatar, width: 118.w, height: 118.h),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: 190.w,
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              _buildStatColumn(context, watchlistCount, StringsManager.wishList),
              _buildStatColumn(context, historyCount, StringsManager.history),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: MainBtn(
                  text: StringsManager.editProfile,
                  onClick: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      RoutesName.updateProfile,
                      arguments: user,
                    );
                    if (result == true) {
                      context.read<ProfileCubit>().getUserData();
                    }
                  },
                ),
              ),
              SizedBox(width: 10.w),
              MainBtn(
                text: StringsManager.exit,
                onClick: () => _showLogoutDialog(context),
                width: 120.w,
                exiteBtn: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(BuildContext context, String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 20.h),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    UiUtils.showAlertDialog(
      context,
      title: StringsManager.exit,
      message: StringsManager.logoutMessage,
      confirmText: StringsManager.exit,
      onConfirm: () async {
        try {
          await getIt<FirebaseAuth>().signOut();
          await getIt<GoogleSignIn>().signOut();
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.logIn,
            (route) => false,
          );
        } catch (e) {
          UiUtils.showMessage(context, e.toString());
        }
      },
    );
  }
}
