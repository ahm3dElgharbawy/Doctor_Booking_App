import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/constants/styles.dart';
import 'package:doctor_booking/core/utils/extensions/navigation.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {super.key, required this.title, this.actions, this.leading});
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: AppBar(
        title: Text(title, style: TextStyles.medium22),
        centerTitle: true,
        leading: leading ??
            FittedBox(
              fit: BoxFit.scaleDown,
              child: CustomRoundedContainer(
                onTap: () => context.pop(),
                padding: EdgeInsets.zero,
                color: AppColors.primary,
                width: 40.r,
                height: 40.r,
                child: Icon(Icons.arrow_back, size: 24.r, color: Colors.white),
              ),
            ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.r);
}
