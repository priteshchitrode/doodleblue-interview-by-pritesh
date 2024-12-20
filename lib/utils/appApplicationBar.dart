import 'package:doodleblue_interview_by_pritesh/utils/appIcons.dart';
import 'package:doodleblue_interview_by_pritesh/utils/appTextStyle.dart';
import 'package:doodleblue_interview_by_pritesh/utils/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppApplicationBar extends StatelessWidget implements PreferredSizeWidget {
   final Color? backgroundColor;
   final double? elevation;
   final List<Widget>? actions;
   final String? title;
   final Color? titleColor;
   final Widget? leading;
   final bool? isLeading;
   final Color? leadingColor;
   final void Function()? onLeadingTap;
   final PreferredSizeWidget? bottom;
  const AppApplicationBar({super.key, this.isLeading ,this.backgroundColor, this.elevation, this.actions, this.title, this.titleColor, this.leading, this.leadingColor, this.onLeadingTap, this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation ?? 0.0,
      scrolledUnderElevation: elevation,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: backgroundColor ?? AppColors.appBarBackgroundColor,
      automaticallyImplyLeading: isLeading ?? false,
      leading: leading ?? (isLeading == true || isLeading == null ? IconButton(onPressed: onLeadingTap ??  () => Navigator.of(context).pop(), icon: SvgPicture.asset(AppIcons.svg.back)) : null),
      centerTitle: true,
      title: title != null ? Text(title.toString(), style: AppTextStyle.appBar.copyWith(color: titleColor ?? Colors.black, fontSize: 20)) : null,
      actions: actions,
      bottom: bottom,
    );
  }

   @override
   Size get preferredSize => Size.fromHeight(
     kToolbarHeight + (bottom?.preferredSize.height ?? 0.0),
   );

}
