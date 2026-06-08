import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/reusable_component/main_btn.dart';
import 'package:movies/core/reusable_component/ui_utils.dart';
import 'package:movies/features/auth/domain/entity/user_entity.dart';
import 'package:movies/features/update-profile/presentation/screens/widgets/select_avatar.dart';
import 'package:movies/features/update-profile/presentation/view_models/update_profile_cubit.dart';

import '../../../../core/resources/app_validator.dart';
import '../../../../core/resources/strings_Manager.dart';
import '../../../../core/reusable_component/custom_field.dart';
import '../../../../core/routes_manager/routes_name.dart';
import '../../../auth/data/model/sign_up_models/avatar_model.dart';
import '../../../main_layout/profile/presentation/view_models/profile_cubit.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController phoneController;

  AvatarModel? selectedAvatar;
  UserEntity? user;

  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  String _getAvatarPath(String? avatarId) {
    switch (avatarId) {
      case "1":
        return AssetsManager.avatar_1;
      case "2":
        return AssetsManager.avatar_2;
      case "3":
        return AssetsManager.avatar_3;
      case "4":
        return AssetsManager.avatar_4;
      case "5":
        return AssetsManager.avatar_5;
      case "6":
        return AssetsManager.avatar_6;
      case "7":
        return AssetsManager.avatar_7;
      case "8":
        return AssetsManager.avatar_8;
      case "9":
        return AssetsManager.avatar_9;
      default:
        return AssetsManager.avatar_1;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInit) {
      final args = ModalRoute.of(context)?.settings.arguments;

      if (args is UserEntity) {
        user = args;

        nameController.text = user?.name ?? "";
        phoneController.text = user?.phone ?? "";

        selectedAvatar = AvatarModel(
          id: user?.avatarId ?? "1",
          image: _getAvatarPath(user?.avatarId),
        );
      }

      _isInit = true;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpdateProfileCubit>(),
      child: BlocListener<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileLoading || state is DeleteAccountLoading) {
            // يمكن إضافة Loading Dialog هنا إذا لزم الأمر
          } else if (state is UpdateProfileSuccess) {
            UiUtils.showMessage(context, state.message, isError: false);
            Navigator.pop(context, true);
          } else if (state is UpdateProfileError) {
            UiUtils.showMessage(context, state.message);
          } else if (state is DeleteAccountSuccess) {
            UiUtils.showMessage(context, state.message, isError: false);
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(RoutesName.logIn, (route) => false);
          } else if (state is DeleteAccountError) {
            UiUtils.showMessage(context, state.message);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            title: Text(
              StringsManager.pickAvatar,
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(fontSize: 16.sp),
            ),
          ),
          body: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Column(
                        children: [
                          SizedBox(height: 32.h),
                          GestureDetector(
                            onTap: () async {
                              final result =
                                  await SelectAvatar.selectAvatarBottomSheet(
                                    context,
                                    selectedAvatar?.id ?? "1",
                                  );

                              if (result != null) {
                                setState(() {
                                  selectedAvatar = result;
                                });
                              }
                            },
                            child: Image.asset(
                              selectedAvatar?.image ?? AssetsManager.avatar_1,
                              height: 150.h,
                            ),
                          ),
                          SizedBox(height: 32.h),
                          CustomField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            hintText: StringsManager.name,
                            prefixPath: AssetsManager.defaultUserIcon,
                            validator: AppValidator.nameValidator,
                          ),
                          SizedBox(height: 16.h),
                          CustomField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            hintText: StringsManager.phoneNumber,
                            prefixPath: AssetsManager.phone,
                            validator: AppValidator.phoneValidator,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Builder(
                    builder: (context) {
                      return Column(
                        children: [
                          MainBtn(
                            text: StringsManager.deleteAccount,
                            redBackgroundColor: true,
                            onClick: () {
                              UiUtils.showAlertDialog(
                                context,
                                title: StringsManager.deleteAccount,
                                message: StringsManager.deleteAccountMessage,
                                confirmText: StringsManager.deleteAccount,
                                onConfirm: () {
                                  if (user?.uid != null) {
                                    context
                                        .read<UpdateProfileCubit>()
                                        .deleteAccount(user!.uid!);
                                  }
                                },
                              );
                            },
                          ),
                          SizedBox(height: 16.h),
                          MainBtn(
                            text: StringsManager.updateData,
                            onClick: () async {
                              if (formKey.currentState?.validate() ?? false) {
                                if (user != null) {
                                  context
                                      .read<UpdateProfileCubit>()
                                      .updateProfile(
                                        uid: user!.uid!,
                                        email: user!.email!,
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        avatarId: selectedAvatar?.id ?? "1",
                                      );
                                }
                              }
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
