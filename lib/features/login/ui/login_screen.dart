import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/core/widgets/appTextButton.dart';
import 'package:flutter_advanced/core/widgets/appTextFormField.dart';
import 'package:flutter_advanced/features/login/data/models/login_request_body.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/login/ui/widgets/donot_have_an_account_text.dart';
import 'package:flutter_advanced/features/login/ui/widgets/email_and_password.dart';
import 'package:flutter_advanced/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter_advanced/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 30.0.h
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text('Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),

                verticalSpace(8),

                Text('We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),

                verticalSpace(36),

                Column(
                  children:
                  [
                    EmailAndPassword(),

                    verticalSpace(14.0),

                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text('Forgot Password?',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),

                    verticalSpace(40.0),

                    AppTextButton(
                      onPressed: ()
                      {
                        validateThenDoLogin(context);

                      },
                      buttonText: 'Login',
                    ),

                    verticalSpace(16.0),

                    TermsAndConditionsText(),

                    verticalSpace(60.0),

                    DontHaveAccountText(),

                    const LoginBlocListener()

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context)
  {
    if(context.read<LoginCubit>().formKey.currentState!.validate())
    {
      context.read<LoginCubit>().emitLoginState();
    }
  }
}
