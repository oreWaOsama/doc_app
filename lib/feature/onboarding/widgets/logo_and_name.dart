import 'package:doc_app/core/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogoAndName extends StatelessWidget {
  const LogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        SvgPicture.asset("assets/svgs/docdoc_logo.svg"),
        SizedBox(width: 10.w),
        Text("DocDoc", style: TextStyles.font24Black700Weight),
      ],
    );
  }
}
