import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/app_validator.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/strings_Manager.dart';
import 'package:movies/core/reusable_component/custom_field.dart';
import 'package:movies/core/reusable_component/auth_navigate.dart';
import 'package:movies/core/reusable_component/localization_item.dart';
import 'package:movies/core/reusable_component/main_btn.dart';
import 'package:movies/core/routes_manager/routes_name.dart';

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
    return Scaffold(
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
            
                MainBtn(
                  text: StringsManager.login,
                  onClick: () {
                    if (formKey.currentState?.validate() ?? false) {
                      // authenticate
                    }
                  },
                ),
                SizedBox(height: 23.h),
                AuthNavigate(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.signUp);
                  },
                  des: StringsManager.doNotHaveAccount,
                  textBtn: StringsManager.createOne,
                ),
                SizedBox(height: 25.h),
                MainBtn(
                  fontSize: 16,
                  isGoogleBtn: true,
                  text: StringsManager.loginWithGoogle,
                  onClick: () async {},
                ),
                SizedBox(height: 30.h),
                LocalizationItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
