import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/extensions.dart';
import 'package:flutter_advanced/core/routing/routes.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      listener: (context, state)
      {
        state.whenOrNull(
          loading: ()
          {
            showDialog(
              context: context,
              builder: (context) =>  Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainColor,
                ),
              ),
            );
          },
          success: (loginResponse)
          {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error)
          {
            setupErrorState(context, error);
          }
        );
      },
      child: SizedBox.shrink(),
    );
  }
}

void setupErrorState(BuildContext context, String error) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: TextStyles.font15DarkBlueMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: TextStyles.font14BlueSemiBold,
          ),
        ),
      ],
    ),
  );
}
