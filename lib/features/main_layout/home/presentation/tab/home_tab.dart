import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/app_constants.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/reusable_component/movie_item.dart';
import 'package:movies/features/main_layout/home/presentation/tab/widgets/genre.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late int selectedMovie;
  late final PageController pageController;

  @override
  void initState() {
    selectedMovie = AppConstants.dumiMovies.length ~/ 2;
    pageController = PageController(
      viewportFraction: 0.6,
      initialPage: selectedMovie,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 650.h,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsManager.onBoarding_6),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.8),
                        Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.6),
                        Theme.of(context).colorScheme.primary,
                      ],
                      stops: const [0, .47, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: REdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(AssetsManager.availableNow, height: 93.h),
                        Expanded(
                          child: PageView.builder(
                            controller: pageController,
                            itemCount: AppConstants.dumiMovies.length,
                            onPageChanged: (index) {
                              setState(() {
                                selectedMovie = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              final isSelected = selectedMovie == index;
        
                              return GestureDetector(
                                onTap: () {
                                  pageController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
        
                                  setState(() {
                                    selectedMovie = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: EdgeInsets.symmetric(
                                    vertical: isSelected ? 0 : 5.h,
                                  ),
                                  child: AnimatedScale(
                                    scale: isSelected ? 1 : 0.8,
                                    duration: const Duration(milliseconds: 600),
                                    curve: Curves.easeOutCubic,
                                    child: MovieItem(
                                      image:
                                          AppConstants.dumiMovies[index].image,
                                      rate: AppConstants.dumiMovies[index].rate,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Image.asset(AssetsManager.watchNow, height: 140.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Genre(),
          ],
        ),
      ),
    );
  }
}
