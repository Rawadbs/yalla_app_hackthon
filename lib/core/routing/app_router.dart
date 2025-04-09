import 'package:flutter/material.dart';
import 'package:yalla_app_hackthon/core/features/challenges/challenges_screen.dart';
import 'package:yalla_app_hackthon/core/features/chatbot/ui/chat_bot_screen.dart';
import 'package:yalla_app_hackthon/core/features/community/ui/community_screen.dart';
import 'package:yalla_app_hackthon/core/features/home/ui/home_screen.dart';
import 'package:yalla_app_hackthon/core/features/login/ui/sign_in_screen.dart';
import 'package:yalla_app_hackthon/core/features/navbar/bottom_nav_bar.dart';
import 'package:yalla_app_hackthon/core/features/onboarding/ui/on_boarding_screen.dart';
import 'package:yalla_app_hackthon/core/features/signup/ui/signup_screen.dart';
import 'package:yalla_app_hackthon/core/features/welcome/ui/welcome_sceen.dart';
import 'package:yalla_app_hackthon/core/routing/routes.dart';

class AppRouters {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case Routes.challengesScreen:
        return MaterialPageRoute(builder: (_) => const ChallengesScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.communityScreen:
        return MaterialPageRoute(builder: (_) => const CommunityScreen());
      case Routes.storeScreen:
        return MaterialPageRoute(builder: (_) => const CommunityScreen());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeSceen());
      case Routes.chatBotScreen:
        return MaterialPageRoute(builder: (_) => const ChatBotScreen());
      default:
        return null;
    }
  }
}
