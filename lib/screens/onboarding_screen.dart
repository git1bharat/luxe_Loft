import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:luxe_loft/utill/luxe_color.dart';
import 'package:luxe_loft/utill/luxe_typography.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showSkipButton: false,
      showNextButton: false,
      showDoneButton: false,
      isProgressTap: false,
      isProgress: false,
      done: const Text("Done"),
      onDone: () {},
      pages: [
        PageViewModel(
          title: '',
          bodyWidget: _buildPageView('Payment',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pharetra quam elementum massa, viverra. Ut turpis consectetur.'),
          decoration: const PageDecoration(
            pageColor: LuxeColors.brandPrimary,
            footerPadding: EdgeInsets.zero,
            pageMargin: EdgeInsets.zero,
            contentMargin: EdgeInsets.zero,
            safeArea: 0,
          ),
        )
      ],
    );
  }
}

Widget _buildPageView(String title, String description) {
  return Column(
    children: [
      SizedBox(
        height: 420.h,
      ),
      Container(
        height: 390,
        decoration: BoxDecoration(
          color: LuxeColors.brandWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: LuxeTypo.title.copyWith(color: LuxeColors.brandSecondry),
            ),
            Text(description),
            ElevatedButton(onPressed: () {}, child: const Text('Skip'))
          ],
        ),
      ),
    ],
  );
}
