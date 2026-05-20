import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/strings_Manager.dart';
import 'package:movies/core/routes_manager/routes_name.dart';

class AuthNavigate extends StatelessWidget {
  final bool logInNavigate;
  final void Function() onPressed;
  final String des;
  final String textBtn;

  const AuthNavigate({super.key,this.logInNavigate = false, required this.onPressed, required this.des, required this.textBtn});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              des,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontSize: 14, fontWeight: .w400),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: onPressed,
              child: Text(
                textBtn,
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(fontWeight: .w900),
              ),
            ),
          ],
        ),if(!logInNavigate)...[
          SizedBox(height: 25.h),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  thickness: 1,
                  indent: 55.w,
                  endIndent: 16.w,
                ),
              ),
              Text(
                StringsManager.or,
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(fontSize: 15),
              ),
              Expanded(
                child: Divider(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  thickness: 1,
                  indent: 16.w,
                  endIndent: 55.w,
                ),
              ),
            ],
          ),
        ]

      ],
    );
  }
}
