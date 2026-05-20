import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/app_constants.dart';
import 'package:movies/core/reusable_component/movie_item.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: REdgeInsets.only(top: 16, left: 16, right: 16),
        child: DefaultTabController(
          length: AppConstants.genres.length,
          child: Column(
            spacing: 16.h,
            children: [
              TabBar(
                indicator: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                labelPadding: REdgeInsets.symmetric(horizontal: 8),
                dividerHeight: 0,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                tabs: AppConstants.genres.map((genre) {
                  return Tab(
                    child: Container(
                      padding: REdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(genre),
                    ),
                  );
                }).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: AppConstants.genres
                      .map(
                        (e) => ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16.r),
                            topLeft: Radius.circular(16.r),
                          ),
                          child: GridView.builder(
                            itemCount: AppConstants.dumiMovies.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: .75,
                                ),
                            itemBuilder: (context, index) {
                              return MovieItem(
                                image: AppConstants.dumiMovies[index].image,
                                rate: AppConstants.dumiMovies[index].rate,
                              );
                            },
                            padding: REdgeInsets.only(bottom: 100),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
