import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/strings_Manager.dart';
import 'package:movies/core/reusable_component/main_btn.dart';
import 'package:movies/features/movie_details/presentation/screens/widgets/cast_section.dart';
import 'package:movies/features/movie_details/presentation/screens/widgets/evaluation_section.dart';
import 'package:movies/features/movie_details/presentation/screens/widgets/genres_section.dart';
import 'package:movies/features/movie_details/presentation/screens/widgets/intro_section.dart';
import 'package:movies/features/movie_details/presentation/screens/widgets/screen_shots_section.dart';
import 'package:movies/features/movie_details/presentation/screens/widgets/similar_section.dart';
import 'package:movies/features/movie_details/presentation/screens/widgets/summary_section.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // Intro
            SliverToBoxAdapter(
              child: SizedBox(height: 645.h, child: IntroSection()),
            ),

            // Watch Button
            SliverPadding(
              padding: REdgeInsets.only(right: 16, left: 16, top: 16),
              sliver: SliverToBoxAdapter(
                child: MainBtn(
                  text: StringsManager.watch,
                  onClick: () {},
                  redBackgroundColor: true,
                ),
              ),
            ),

            // Evaluation
            SliverPadding(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
              sliver: SliverToBoxAdapter(child: EvaluationSection()),
            ),

            const ScreenShotsSection(),
            const SimilarSection(),
            const SummarySection(),
            const CastSection(),
            const GenresSection(),
          ],
        ),
      ),
    );
  }
}
