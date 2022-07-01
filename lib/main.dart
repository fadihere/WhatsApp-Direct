import 'package:flutter/material.dart';
import 'package:whatsapp/screens/splash_screen.dart';
import 'package:whatsapp/utils/colors.dart';
import 'package:whatsapp/utils/fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Direct',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(),
        scaffoldBackgroundColor: AppColors.kWhite,
        iconTheme: const IconThemeData(color: AppColors.kFont),
        dividerTheme: const DividerThemeData(space: 0),
        colorScheme: const ColorScheme.light(
          primary: AppColors.kGreen,
          onPrimary: AppColors.kWhite,
          onSurface: AppColors.kFont,
        ),
        appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            titleTextStyle: StyleRefer.kGilroy
                .copyWith(color: AppColors.kWhite, fontSize: 16),
            iconTheme: const IconThemeData(color: AppColors.kWhite)),
        fontFamily: UtilFonts.gilroy,
        backgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}
