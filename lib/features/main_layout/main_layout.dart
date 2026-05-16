import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/features/main_layout/browse/presentation/tab/browse_tab.dart';
import 'package:movies/features/main_layout/home/presentation/tab/home_tab.dart';
import 'package:movies/features/main_layout/profile/presentation/tab/profile_tab.dart';
import 'package:movies/features/main_layout/search/presentation/tab/search_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedTab = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const BrowseTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(right: 12,left: 12,bottom: 12),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r)
          ,child: NavigationBar(
            selectedIndex: selectedTab,
            onDestinationSelected: (value) {
              setState(() {
                selectedTab = value;
              });
            },
            destinations: [
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  AssetsManager.homeIcon,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimaryContainer,
                    BlendMode.srcIn,
                  ),width: 28.w,height: 28.h,
                ),
                icon: SvgPicture.asset(AssetsManager.homeIcon,width: 24.w,height: 24.h,),
                label: '',
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  AssetsManager.searchIcon,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimaryContainer,
                    BlendMode.srcIn,
                  ),width: 28.w,height: 28.h,
                ),
                icon: SvgPicture.asset(AssetsManager.searchIcon,width: 24.w,height: 24.h,),
                label: '',
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  AssetsManager.browseIcon,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimaryContainer,
                    BlendMode.srcIn,
                  ),width: 28.w,height: 28.h,
                ),
                icon: SvgPicture.asset(AssetsManager.browseIcon,width: 24.w,height: 24.h,),
                label: '',
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  AssetsManager.profileIcon,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimaryContainer,
                    BlendMode.srcIn,
                  ),width: 28.w,height: 28.h,
                ),
                icon: SvgPicture.asset(AssetsManager.profileIcon,width: 24.w,height: 24.h,), label: '',

              ),
            ],
          ),
        ),
      ),

      body: tabs[selectedTab],
    );
  }
}
