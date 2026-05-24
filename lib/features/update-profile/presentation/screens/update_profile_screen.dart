import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/app_constants.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/reusable_component/main_btn.dart';
import 'package:movies/core/reusable_component/ui_utils.dart';
import 'package:movies/features/update-profile/presentation/screens/widgets/select_avatar.dart';
import '../../../../core/resources/app_validator.dart';
import '../../../../core/resources/strings_Manager.dart';
import '../../../../core/reusable_component/custom_field.dart';
import '../../../auth/data/model/sign_up_models/avatar_model.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late AvatarModel selectedAvatar;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: "Mohamed Shaban");
    phoneController = TextEditingController(text: "01000000000");
    selectedAvatar =
        AppConstants.avatarList[0]; // with id from fireStore ( map )
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 32.h),
                      GestureDetector(
                        onTap: () async {
                          final result =
                              await SelectAvatar.selectAvatarBottomSheet(
                                context,
                                selectedAvatar.id,
                              );
                          if (result != null) {
                            setState(() {
                              selectedAvatar = result;
                            });
                          }
                        },
                        child: Image.asset(selectedAvatar.image, height: 150.h),
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

              Column(
                children: [
                  MainBtn(
                    text: StringsManager.deleteAccount,
                    onClick: () {
                      UiUtils.showAlertDialog(
                        context,
                        title: StringsManager.deleteAccount,
                        message: StringsManager.deleteAccountMessage,
                        confirmText: StringsManager.deleteAccount,
                        onConfirm: () {
                          // TODO: Implement delete account logic
                        },
                      );
                    },
                    redBackgroundColor: true,
                  ),
                  SizedBox(height: 16.h),
                  MainBtn(
                    text: StringsManager.updateData,
                    onClick: () {
                      if (formKey.currentState?.validate() ?? false) {
                        // TODO: Implement update data logic
                      }
                    },
                  ),
                ],
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
