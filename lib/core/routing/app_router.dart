import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/core/routing/routes.dart';
import 'package:flutter_advanced/features/home/ui/dhome_screen.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/login/ui/login_screen.dart';
import 'package:flutter_advanced/features/onBoarding/onBoarding_screen.dart';
import 'package:flutter_advanced/features/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter_advanced/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppRouter
{
  Route generateRoute(RouteSettings settings)
  {
    switch(settings.name)
    {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => const OnboardingScreen(),);
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) =>  BlocProvider(
            create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ),);
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) =>  homeScreen(),);
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (context) =>  BlocProvider(
          create: (context) => getIt<SignUpCubit>(),
          child: const SignUpScreen(),
        ),);
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text('No routes defined for ${settings.name}'),
          ),
        ),);
    }
  }
}