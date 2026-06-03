import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String hintText;
  final String prefixPath;
  final bool isPassword;
  final String? Function(String?)? validator;
  final bool isConfirmPassword;
  final bool isSearch;
  final Function(String)? onSubmitted;

  const CustomField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.textInputAction,
    required this.hintText,
    this.prefixPath = "",
    this.isPassword = false,
    this.validator,
    this.isConfirmPassword = false,
    this.isSearch = false, this.onSubmitted,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late bool isShowPassword = widget.isPassword;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      enableInteractiveSelection: !widget.isConfirmPassword,
      autocorrect: !widget.isPassword,
      enableSuggestions: !widget.isPassword,
      controller: widget.controller,
      onTapUpOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      onFieldSubmitted: widget.onSubmitted,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: isShowPassword,
      style: Theme.of(
        context,
      ).textTheme.labelSmall?.copyWith(fontSize: 18, fontWeight: .w500),

      decoration: InputDecoration(
        prefixIcon: widget.isSearch
            ? null
            : Padding(
                padding:  REdgeInsetsDirectional.only(start: 16, end: 8),
                child: SvgPicture.asset(widget.prefixPath),
              ),
        prefixIconColor: Theme.of(context).colorScheme.onPrimary,
        prefixIconConstraints: BoxConstraints(maxHeight: 40.h, maxWidth: 50.w),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                icon: Icon(
                  !isShowPassword ? Icons.visibility : Icons.visibility_off,
                  weight: 30.w,
                ),
              )
            : null,
        suffixIconColor: Theme.of(context).colorScheme.onPrimary,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.labelSmall,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1.5,
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
      ),
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
