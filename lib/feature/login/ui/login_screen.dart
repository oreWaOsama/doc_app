import 'package:doc_app/core/theming/app_color.dart';
import 'package:doc_app/core/theming/text_style.dart';
import 'package:doc_app/core/widgets/app_button.dart';
import 'package:doc_app/core/widgets/app_text_form_field.dart';
import 'package:doc_app/feature/login/ui/widgets/dont_have_account_text.dart';
import 'package:doc_app/feature/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcom Back', style: TextStyles.font24BlueBold),
                SizedBox(height: size.height * 0.01),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                SizedBox(height: size.height * 0.05),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(hintText: 'Email'),
                      SizedBox(height: size.height * 0.03),
                      AppTextFormField(
                        hintText: 'Password',
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: isObscureText
                                ? ColorsManager.lightGray
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Forget Password?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      AppButton(
                        buttonText: 'Login',
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () {},
                      ),

                      SizedBox(height: size.height * 0.02),
                      const TermsAndConditionsText(),
                      SizedBox(height: size.height * 0.05),
                      const DontHaveAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
