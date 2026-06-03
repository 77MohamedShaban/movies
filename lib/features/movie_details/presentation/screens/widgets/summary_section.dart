import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/strings_Manager.dart';

class SummarySection extends StatelessWidget {
  final String summary ;
  const SummarySection({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              StringsManager.summary,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),

        SliverPadding(
          padding: REdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
          sliver: SliverToBoxAdapter(
            child: Text(
            summary
            ,style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ),
      ],
    );
  }
}
