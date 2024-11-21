import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart' as intl;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:luxe_loft/utill/luxe_typography.dart';
import 'package:luxe_loft/widgets/social_icon_button.dart';
import 'package:luxe_loft/widgets/submit_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final TextEditingController phoneController = TextEditingController();

String fullNumber = '';

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 50.h),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Create Account',
                style: LuxeTypo.displayLarge,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Text(
              'sign Up',
              style: LuxeTypo.displaySmall,
            ),
            SizedBox(
              height: 50.h,
            ),
            _buildTextField(),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            SubmitButton(
              buttonName: 'NEXT',
              onTap: () => Navigator.pushNamed(context, '/homeScreen'),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text(
              'or continue with ',
              style: LuxeTypo.titleSmall,
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                const SocialIconButton(
                    image: 'assets/images/google.webp', buttonName: 'Google'),
                SizedBox(width: 5.w),
                const SocialIconButton(
                    image: 'assets/images/facebook.png',
                    buttonName: 'facebook'),
                SizedBox(width: 5.w),
                const SocialIconButton(
                    image: 'assets/images/facebook.png', buttonName: 'facebook')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTextField() {
  return Form(
    child: Column(
      children: [
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email_outlined),
            labelText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_open_rounded),
            labelText: 'Special Character',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_open_rounded),
            labelText: 'Repeat Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_open_rounded),
            labelText: 'Repeat Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        PhoneNumberInput(
          controller: phoneController,
        ),
      ],
    ),
  );
}

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  String initialCountry = 'NG';
  // final intl.PhoneNumber _phoneNumber = intl.PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color.fromARGB(255, 146, 136, 136)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          fullNumber = number.phoneNumber!;
        },
        textFieldController: widget.controller,
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          setSelectorButtonAsPrefixIcon: true,
          useBottomSheetSafeArea: true,
        ),
        inputDecoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter phone number',
          contentPadding: EdgeInsets.zero,
        ),
        countries: const [
          'US',
          'IN'
        ], // We can increase the List of countries as we require
        spaceBetweenSelectorAndTextField: 0,
      ),
    );
  }
}
