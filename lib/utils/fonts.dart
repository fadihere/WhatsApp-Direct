import 'package:flutter/material.dart';
import 'colors.dart';

class StyleRefer {
  static const TextStyle kGilroy = TextStyle(
      fontFamily: UtilFonts.gilroy,
      overflow: TextOverflow.ellipsis,
      color: AppColors.kFont);
  static const TextStyle kgilroyExtraBold = TextStyle(
      fontFamily: UtilFonts.gilroyExtraBold,
      overflow: TextOverflow.ellipsis,
      color: AppColors.kFont);
}

class UtilFonts {
  static const String gilroy = 'Gilroy';
  static const String gilroyExtraBold = 'Gilroy-ExtraBold';
}
