import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/core/resources/app_constants.dart';
import 'package:movies/core/reusable_component/movie_item.dart';
import 'package:movies/features/main_layout/profile/presentation/tab/widgets/header.dart';
import 'package:movies/features/main_layout/profile/presentation/view_models/profile_cubit.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if ((state.profileStatus == ProfileStatus.loading || state.profileStatus == ProfileStatus.initial) && state.user == null) {
              return Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  size: 60.h,
                ),
              );
            }

            if (state.profileStatus == ProfileStatus.error && state.user == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.profileErrorMessage ?? "Error loading profile",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context.read<ProfileCubit>().getUserData(),
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            }

            if (state.user != null) {
              return DefaultTabController(
                length: AppConstants.tabBarProfile.length,
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: REdgeInsets.only(bottom: 24),
                          child: Header(
                            user: state.user!,
                            watchlistCount: state.watchlist.length.toString(),
                            historyCount: state.history.length.toString(),
                          ),
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
                            unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
                            labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                            indicator: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Theme.of(context).colorScheme.onPrimaryContainer,
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
                    children: [
                      // تاب الـ Watchlist
                      _buildMoviesGrid(state.watchlist, state.watchlistStatus, "No movies in your watchlist"),
                      // تاب الـ History
                      _buildMoviesGrid(state.history, state.historyStatus, "No watched movies yet"),
                    ],
                  ),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildMoviesGrid(List movies, dynamic status, String emptyMessage) {
    if (status == WatchlistStatus.loading || status == HistoryStatus.loading) {
      if (movies.isEmpty) {
        return Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: Colors.white,
            size: 40.h,
          ),
        );
      }
    }

    if (movies.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }

    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        padding: REdgeInsets.only(top: 16),
        itemCount: movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: .72,
        ),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieItem(
            image: movie.largeCoverImage,
            rate: movie.rating.toString(),
            title: movie.title,
            year: movie.year.toString(),
            id: movie.id,
            url: movie.url,
          );
        },
      ),
    );
  }
}
