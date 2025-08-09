import 'package:doc_app/core/theming/text_style.dart';
import 'package:doc_app/core/widgets/app_button.dart';
import 'package:doc_app/feature/login/data/models/login_request_body.dart';
import 'package:doc_app/feature/login/logic/cubit/login_cubit.dart';

import 'package:doc_app/feature/login/ui/widgets/dont_have_account_text.dart';
import 'package:doc_app/feature/login/ui/widgets/email_and_password.dart';
import 'package:doc_app/feature/login/ui/widgets/login_bloc_listener.dart';
import 'package:doc_app/feature/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Column(
                  children: [
                    const EmailAndPassword(),

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
                      onPressed: () {
                        validateThenLogin(context);
                      },
                    ),

                    SizedBox(height: size.height * 0.02),
                    const TermsAndConditionsText(),
                    SizedBox(height: size.height * 0.05),
                    const DontHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text,
        ),
      );
    }
  }
}
