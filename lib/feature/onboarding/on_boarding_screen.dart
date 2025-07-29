import 'package:doc_app/feature/onboarding/widgets/doctor_image_and_text.dart';
import 'package:doc_app/feature/onboarding/widgets/logo_and_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogoAndName(),
              SizedBox(height: 30.h),
              DoctorImageAndText(),
            ],
          ),
        ),
      ),
    );
  }
}
