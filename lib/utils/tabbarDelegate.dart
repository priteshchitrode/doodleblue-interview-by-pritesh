import 'package:doodleblue_interview_by_pritesh/utils/constant/appColors.dart';
import 'package:flutter/material.dart';

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  TabBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      color: AppColors.scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant TabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
