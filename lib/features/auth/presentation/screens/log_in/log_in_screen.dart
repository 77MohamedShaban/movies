import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/resources/app_validator.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/strings_Manager.dart';
import 'package:movies/core/reusable_component/custom_field.dart';
import 'package:movies/core/reusable_component/auth_navigate.dart';
import 'package:movies/core/reusable_component/localization_item.dart';
import 'package:movies/core/reusable_component/main_btn.dart';
import 'package:movies/core/reusable_component/ui_utils.dart';
import 'package:movies/core/routes_manager/routes_name.dart';
import 'package:movies/features/auth/presentation/view_models/log_in/log_in_cubit.dart';
import 'package:movies/features/auth/presentation/view_models/log_in/log_in_states.dart';

class LogInScreen extends StatefulWidget {
  static const String routeName = "/login";

  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LogInCubit>(),
      child: Scaffold(
        body: Padding(
          padding: REdgeInsets.all(19),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  Image.asset(AssetsManager.logo, height: 118.h, width: 121.w),
                  SizedBox(height: 70.h),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          hintText: StringsManager.email,
                          prefixPath: AssetsManager.email,
                          validator: AppValidator.emailValidator,
                        ),
                        SizedBox(height: 23.h),
                        CustomField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          hintText: StringsManager.password,
                          prefixPath: AssetsManager.lock,
                          isPassword: true,
                          validator: AppValidator.passwordValidator,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.forgetPassword);
                      },
                      child: Text(
                        StringsManager.forgetPassword,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ),
                  SizedBox(height: 33.h),
                  BlocConsumer<LogInCubit, LogInState>(
                    listener: (context, state) {
                      if (state is LogInSuccess) {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.mainLayout);
                        UiUtils.showMessage(
                          context,
                          StringsManager.userLoggedSuccessfully,
                          isError: false,
                        );
                      }
                      if (state is LogInError) {
                        UiUtils.showMessage(context, state.message,
                            isError: true);
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          MainBtn(
                            isLoading: state is LogInLoading,
                            text: StringsManager.login,
                            onClick: () {
                              if (formKey.currentState?.validate() ?? false) {
                                context.read<LogInCubit>().login(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                              }
                            },
                          ),
                          SizedBox(height: 40.h),
                          AuthNavigate(
                            onPressed: () {
                              Navigator.pushNamed(context, RoutesName.signUp);
                            },
                            des: StringsManager.alreadyHaveAccount,
                            textBtn: StringsManager.createOne,
                          ),
                          SizedBox(height: 25.h),
                          MainBtn(
                            isLoading: state is LogInGoogleLoading,
                            fontSize: 16,
                            isGoogleBtn: true,
                            text: StringsManager.loginWithGoogle,
                            onClick: () {
                              context.read<LogInCubit>().signInWithGoogle();
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  const LocalizationItem(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
