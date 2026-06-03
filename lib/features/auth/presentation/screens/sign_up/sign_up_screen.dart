import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/app_validator.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/strings_Manager.dart';
import 'package:movies/core/reusable_component/auth_navigate.dart';
import 'package:movies/core/reusable_component/custom_field.dart';
import 'package:movies/core/reusable_component/localization_item.dart';
import 'package:movies/core/reusable_component/main_btn.dart';
import 'package:movies/core/reusable_component/ui_utils.dart';
import 'package:movies/core/routes_manager/routes_name.dart';
import 'package:movies/features/auth/presentation/screens/sign_up/widgets/avatar_widget.dart';
import '../../../../../core/di/di.dart';
import '../../view_models/sign_up/sign_up_cubit.dart';
import '../../view_models/sign_up/sign_up_states.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController confirmController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   String selectedAvatarId = "5";

  @override
  void initState() {
    emailController = TextEditingController(text: "mohamed@gmail.com");
    passwordController = TextEditingController(text: "M.m01116955612");
    nameController = TextEditingController(text: "Mohamed");
    phoneController = TextEditingController(text: "01116955612");
    confirmController = TextEditingController(text: "M.m01116955612");
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignUpCubit>(),
      child: Scaffold(
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
            StringsManager.register,
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontSize: 16.sp),
          ),
        ),
        body: Padding(
          padding: REdgeInsets.only(top: 18, left: 18, right: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AvatarWidget(
                  onAvatarSelected: (avatarId) {
                    selectedAvatarId = avatarId;
                  },
                ),
                SizedBox(height: 40.h),
                Form(
                  key: formKey,
                  child: Column(
                    spacing: 20.h,
                    children: [
                      CustomField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        hintText: StringsManager.name,
                        prefixPath: AssetsManager.iconName,
                        validator: AppValidator.nameValidator,
                      ),
                      CustomField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        hintText: StringsManager.email,
                        prefixPath: AssetsManager.email,
                        validator: AppValidator.emailValidator,
                      ),
                      CustomField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        hintText: StringsManager.password,
                        prefixPath: AssetsManager.lock,
                        isPassword: true,
                        validator: AppValidator.passwordValidator,
                      ),
                      CustomField(
                        controller: confirmController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        hintText: StringsManager.confirmPassword,
                        prefixPath: AssetsManager.lock,
                        isPassword: true,
                        validator: (value) =>
                            AppValidator.confirmPasswordValidator(
                              value,
                              passwordController.text,
                            ),
                      ),
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
                SizedBox(height: 33.h),
                BlocConsumer<SignUpCubit, SignUpStates>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesName.mainLayout,
                      );
                      UiUtils.showMessage(
                        context,
                        StringsManager.userCreatedSuccessfully,
                        isError: false,
                      );
                    }

                    if (state is AuthError) {
                      UiUtils.showMessage(context, state.message);
                    }
                  },
                  builder: (context, state) {
                    return MainBtn(
                      isLoading: state is AuthLoading,
                      text: StringsManager.createAccount,
                      onClick: () {
                        if (formKey.currentState?.validate() ?? false) {
                          context.read<SignUpCubit>().signUp(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            phone: phoneController.text.trim(),
                            avatarId: selectedAvatarId,
                          );
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 40.h),
                AuthNavigate(
                  logInNavigate: true,
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.logIn);
                  },
                  des: StringsManager.alreadyHaveAccount,
                  textBtn: StringsManager.login,
                ),
                SizedBox(height: 30.h),
                LocalizationItem(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
