import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe_loft/utill/luxe_color.dart';
import 'package:luxe_loft/utill/luxe_typography.dart';
import 'package:luxe_loft/widgets/submit_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 45.h,
                  ),
                  Center(
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  const Text(
                    'Welcome Back!',
                    style: LuxeTypo.displayLarge,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text(
                    'login to continue',
                    style: LuxeTypo.titleSmall,
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  _buildTextField(),
                  SizedBox(
                    height: 30.h,
                  ),
                  SubmitButton(
                    buttonName: 'Get Otp',
                    onTap: () => Navigator.pushNamed(context, '/otpScreen'),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  const Text(
                    'or continue with ',
                    style: LuxeTypo.titleSmall,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon('assets/images/google.webp', 'Google'),
                      const SizedBox(
                        width: 15.2,
                      ),
                      _buildSocialIcon(
                          'assets/images/facebook.png', 'facebook'),
                    ],
                  ),
                  SizedBox(
                    height: 140.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: 'SIGN UP',
                          style: const TextStyle(
                            color: LuxeColors.brandPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/signUpScreen');
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}

Widget _buildTextField() {
  return Form(
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone_android),
        labelText: 'Mobile Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    ),
  );
}

Widget _buildSocialIcon(String image, String buttonName) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 35),
    decoration: BoxDecoration(
      color: LuxeColors.brandWhite,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          image,
          width: 30,
          height: 30,
        ),
        Text(
          buttonName,
          style: LuxeTypo.titleSmall,
        )
      ],
    ),
  );
}
