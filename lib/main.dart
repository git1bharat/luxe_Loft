import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe_loft/screens/onboarding_screen.dart';
import 'package:luxe_loft/screens/splash_screen.dart';

const double designSizeWidth = 390;
const double designSizeHeight = 844;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        designSizeWidth,
        designSizeHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset('assets/images/logo.png'),
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: OnBoardingScreen(),
        ),
      ),
    );
  }
}
