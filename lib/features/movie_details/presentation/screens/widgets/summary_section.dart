import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/strings_Manager.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

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
              "Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse...",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ),
      ],
    );
  }
}
