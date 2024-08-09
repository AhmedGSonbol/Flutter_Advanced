import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/app_regex.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/widgets/appTextFormField.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/login/ui/widgets/password_validations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({Key? key}) : super(key: key);

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword>
{



  bool isObsecureText = true;

  bool showPasswordValidators = false;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinimumLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }




  void setupPasswordControllerListener()
  {
    passwordController.addListener(()
    {
      setState(()
      {

        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinimumLength = AppRegex.hasMinLength(passwordController.text);

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children:
        [
          AppTextFormField(
            hintText: 'Email',
            validator: (value)
            {
              if(value == null || value.isEmpty || !AppRegex.isEmailValid(value))
              {
                return 'Please enter a valid email !';
              }
              return null;
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18.0),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
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
            validator: (value)
            {
              if(value == null || value.isEmpty)
              {
                setState(()
                {

                  showPasswordValidators = false;

                });
                return 'Please enter a valid password !';

              }
              else
              {
                if (!hasNumber || !hasMinimumLength || ! hasSpecialCharacter || ! hasLowerCase || !hasUpperCase)
                {
                  setState(()
                  {
                    showPasswordValidators = true;

                  });
                  return '';
                }
                else
                {
                  setState(()
                  {

                    showPasswordValidators = false;

                  });
                }
              }

            },
          ),
          // verticalSpacing(24.0),
          if(showPasswordValidators)
            PasswordValidations(
            hasUpperCase: hasUpperCase,
            hasLowerCase: hasLowerCase,
            hasSpecialCharacter: hasSpecialCharacter,
            hasMinimumLength: hasMinimumLength,
            hasNumber: hasNumber,

          ),

        ],
      ),
    );

  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }


}
