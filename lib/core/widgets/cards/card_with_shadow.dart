import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:doctor_booking/core/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';

class CustomCardWithShadow extends StatelessWidget {
  const CustomCardWithShadow(
      {super.key, required this.child, this.color = Colors.white, this.onTap});
  final Widget child;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      color: color,
      padding: EdgeInsets.all(15.r),
      shadow: BoxShadow(
        color: Colors.black.withOpacity(0.1),
        offset: const Offset(0, 4),
        blurRadius: 10,
        spreadRadius: -1,
      ),
      onTap: onTap,
      child: child,
    );
  }
}
