import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/routing/routes.dart';
import 'package:flutter_advanced/features/login/ui/login_screen.dart';
import 'package:flutter_advanced/features/onBoarding/onBoarding_screen.dart';


class AppRouter
{
  Route generateRoute(RouteSettings settings)
  {
    switch(settings.name)
    {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => const OnboardingScreen(),);
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen(),);
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text('No routes defined for ${settings.name}'),
          ),
        ),);
    }
  }
}