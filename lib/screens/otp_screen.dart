import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe_loft/utill/luxe_typography.dart';
import 'package:luxe_loft/widgets/submit_button.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 155, 207, 216),
                  shape: BoxShape.circle,
                ),
                width: 15.w,
                height: 15.h,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                ),
              ),
            ),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 18.h,
            ),
            const Text(
              'Otp Verification',
              style: LuxeTypo.displayLarge,
            ),
            SizedBox(
              height: 15.h,
            ),
            const Text(
              textAlign: TextAlign.center,
              'enter the verification code we just sent on your email address.',
              style: LuxeTypo.titleSmall,
            ),
            SizedBox(
              height: 34.h,
            ),
            const Center(child: Pinput(length: 4)),
            SizedBox(
              height: 34.h,
            ),
            SubmitButton(
              buttonName: 'VERIFY',
              onTap: () => Navigator.pushNamed(context, '/otpScreen'),
            )
          ],
        ),
      ),
    );
  }
}
