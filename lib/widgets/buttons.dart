import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/fonts.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final double? minWidth;
  final VoidCallback? onTap;
  final Color? color;
  const AppButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.color,
    this.titleColor,
    this.minWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      disabledColor: AppColors.kLightGreen,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      minWidth: minWidth ?? MediaQuery.of(context).size.width,
      height: 42,
      color: color ?? AppColors.kGreen,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        style: StyleRefer.kGilroy.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: titleColor ?? AppColors.kWhite),
      ),
    );
  }
}
