import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/app_constants.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/strings_Manager.dart';
import 'package:movies/core/reusable_component/custom_field.dart';
import 'package:movies/core/reusable_component/movie_item.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: REdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          spacing: 16.h,
          children: [
            CustomField(
              controller: searchController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              hintText: StringsManager.search,
              prefixPath: AssetsManager.searchIcon,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.r),
                  topLeft: Radius.circular(16.r),
                ),
                child: GridView.builder(
                  itemCount: AppConstants.dumiMovies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  padding: REdgeInsets.only(bottom:100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
