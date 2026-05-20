import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors_manager.dart';

class IntroSection extends StatefulWidget {
  const IntroSection({super.key});

  @override
  State<IntroSection> createState() => _IntroDetailsState();
}

class _IntroDetailsState extends State<IntroSection> {
  bool watchList = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.onBoarding_3),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.2),
              Theme.of(context).colorScheme.primary,
            ],
            stops: const [0, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: REdgeInsets.only(top: 30, left: 20, right: 20, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        watchList = !watchList;
                      });
                    },
                    child: Icon(
                      Icons.bookmark,
                      color: watchList?Theme.of(
                        context,
                      ).colorScheme.onPrimaryContainer:Theme.of(
                        context,
                      ).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
              Image.asset(
                AssetsManager.playVideoIcon,
                height: 97.h,
              ),
              Column(
                children: [
                  Text(
                    "Doctor Strange in the Multiverse of Madness",
                    style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "2022",
                    style: Theme.of(context).textTheme.bodySmall
                        ?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.gray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
