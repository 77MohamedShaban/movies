import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/app_validator.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/strings_Manager.dart';
import 'package:movies/core/reusable_component/custom_field.dart';
import 'package:movies/core/reusable_component/main_btn.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late TextEditingController emailController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          StringsManager.forgetPasswordTitle,
          style: Theme.of(
            context,
          ).textTheme.displaySmall?.copyWith(fontSize: 16.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: REdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 24.h,
              children: [
                Image.asset(
                  AssetsManager.forgotPassword,
                  height: 430.h,
                  fit: BoxFit.fill,
                ),
                Form(
                  key: formKey,
                  child: CustomField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    hintText: StringsManager.email,
                    prefixPath: AssetsManager.email,
                    validator: AppValidator.emailValidator,
                  ),
                ),
                MainBtn(text: StringsManager.verifyEmail, onClick: (){
                  if (formKey.currentState?.validate() ?? false) {

                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
