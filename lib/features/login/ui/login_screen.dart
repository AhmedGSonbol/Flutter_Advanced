import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/core/widgets/appTextButton.dart';
import 'package:flutter_advanced/core/widgets/appTextFormField.dart';
import 'package:flutter_advanced/features/login/ui/widgets/alreadyHaveAnAccountText.dart';
import 'package:flutter_advanced/features/login/ui/widgets/termsAndConditionsText.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{

  final formKey = GlobalKey<FormState>();

  bool isObsecureText = true;


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

                verticalSpacing(8),

                Text('We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),

                verticalSpacing(36),

                Form(
                  key: formKey,
                    child:
                    Column(
                      children:
                      [
                        Apptextformfield(
                          hintText: 'Email',
                        ),
                        verticalSpacing(18.0),
                        Apptextformfield(
                          hintText: 'Password',
                          isObSecureText: isObsecureText,
                          suffixIcon: IconButton(
                            onPressed: ()
                            {
                              setState(()
                              {
                                isObsecureText = !isObsecureText;

                              });
                            },
                            icon: isObsecureText
                                ?
                            Icon(Icons.visibility_off)
                                :
                            Icon(Icons.visibility)
                          ),
                        ),

                        verticalSpacing(14.0),

                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text('Forgot Password?',
                            style: TextStyles.font13BlueRegular,
                          ),
                        ),

                        verticalSpacing(40.0),

                        AppTextButton(
                          onPressed: (){},
                          buttonText: 'Login',
                        ),

                        verticalSpacing(16.0),

                        TermsAndConditionsText(),

                        verticalSpacing(60.0),

                        DontHaveAccountText(),

                      ],
                    )

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
