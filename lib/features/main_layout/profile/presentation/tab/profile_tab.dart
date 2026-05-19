import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/resources/app_constants.dart';
import 'package:movies/core/reusable_component/movie_item.dart';
import 'package:movies/features/main_layout/profile/presentation/tab/widgets/header.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: DefaultTabController(
        length: AppConstants.tabBarProfile.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: REdgeInsets.only(bottom: 24),
                  child: Header(),
                ),
              ),

              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                toolbarHeight: 0,
                elevation: 0,
                backgroundColor: Theme.of(context).colorScheme.primary,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(100.h),
                  child: TabBar(
                    dividerHeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Theme.of(context).colorScheme.onPrimary,
                    unselectedLabelColor: Theme.of(
                      context,
                    ).colorScheme.onPrimary,
                    labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                          width: 3,
                        ),
                      ),
                    ),

                    tabs: AppConstants.tabBarProfile.map((item) {
                      return Tab(
                        height: 90.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(item.icon, width: 28.w),
                            Text(item.text),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ];
          },

          body: TabBarView(
            children: AppConstants.tabBarProfile.map((e) {
              return Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  padding: REdgeInsets.only(top: 16),
                  itemCount: AppConstants.dumiMovies.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: .72,
                  ),

                  itemBuilder: (context, index) {
                    return MovieItem(
                      image: AppConstants.dumiMovies[index].image,
                      rate: AppConstants.dumiMovies[index].rate,
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
