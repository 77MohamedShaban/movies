import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/features/intro/presentation/screens/on_boarding/widgets/next_item.dart';
import 'package:movies/features/intro/presentation/screens/on_boarding/widgets/start_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  @override
  void initState() {
   _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) async {
        if (!Navigator.canPop(context)) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
            StartItem(onNext: _nextPage),
            const NextItem(),
          ],
        ),
      ),
    );
  }
}
