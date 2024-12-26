import 'package:ProperGenies/view/animationScreen/animation_vm.dart';
import 'package:ProperGenies/view/propertyDetail/contactUs/contact_vm.dart';
import 'package:ProperGenies/view/propertyDetail/property_detail_vm.dart';
import 'package:ProperGenies/view/start/forgotPassword/forgot_password_view.dart';
import 'package:ProperGenies/view/start/forgotPassword/forgot_password_vm.dart';
import 'package:ProperGenies/view/start/register/register_vm.dart';
import 'package:ProperGenies/view/tabs/home/allPropertiesList/all_properties_vm.dart';
import 'package:ProperGenies/view/tabs/more/about/about_vm.dart';
import 'package:ProperGenies/view/tabs/more/services/lettings/lettings_vm.dart';
import 'package:ProperGenies/view/tabs/more/services/sales/sales_vm.dart';
import 'package:ProperGenies/view/tabs/more/services/services_vm.dart';
import 'package:ProperGenies/view/tabs/more/tools/tools_vm.dart';
import 'package:ProperGenies/view/tabs/valuation/valuation_view.dart';
import 'package:ProperGenies/view/tabs/valuation/valuation_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/animationScreen/animation_view.dart';
import '../view/bottomNav/bottom_nav.dart';
import '../view/bottomNav/bottom_nav_vm.dart';
import '../view/onBoarding/onboarding_view.dart';
import '../view/onBoarding/onboarding_vm.dart';
import '../view/propertyDetail/contactUs/contact_view.dart';
import '../view/propertyDetail/property_detail_view.dart';
import '../view/start/login/login.dart';
import '../view/start/login/login_vm.dart';
import '../view/start/register/register_view.dart';
import '../view/start/splash/splash_screen.dart';
import '../view/start/splash/splash_vm.dart';
import '../view/start/verification/verification_code_view.dart';
import '../view/start/verification/verification_code_vm.dart';
import '../view/tabs/home/allPropertiesList/all_properties_view.dart';
import '../view/tabs/home/favProperties/fav_properties_view.dart';
import '../view/tabs/home/favProperties/fav_properties_vm.dart';
import '../view/tabs/more/about/about_view.dart';
import '../view/tabs/more/services/lettings/lettings_view.dart';
import '../view/tabs/more/services/sales/sales_view.dart';
import '../view/tabs/more/services/services_view.dart';
import '../view/tabs/more/tools/tools_view.dart';
import '../view/tabs/more/webView/webView_screen.dart';
import '../view/tabs/more/webView/webView_vm.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case SplashScreen.route:
      builder = (context) => ChangeNotifierProvider(
          create: (context) => SplashVm(context), child: const SplashScreen());
      break;
    case LoginScreen.route:
      builder = (context) => ChangeNotifierProvider(
          create: (context) => LoginVm(), child: const LoginScreen());
      break;

    case OnboardingView.route:
      builder = (context) => ChangeNotifierProvider(
          create: (context) => OnBoardingVm(), child: const OnboardingView());
      break;

    case RegisterView.route:
      builder = (context) => ChangeNotifierProvider(
          create: (context) => RegisterVm(), child: const RegisterView());
      break;

    case FavPropertiesView.route:
      builder = (context) => ChangeNotifierProvider(
          create: (context) => FavPropertyVm(),
          child: const FavPropertiesView());
      break;

    case ForgotPasswordView.route:
      builder = (context) => ChangeNotifierProvider(
          create: (context) => ForgotPasswordVm(),
          child: const ForgotPasswordView());
      break;

    case PropertyDetailView.route:
      final modal = settings.arguments as dynamic;
      builder = (context) => ChangeNotifierProvider(
          create: (context) => PropertyDetailVm(id: modal),
          child: const PropertyDetailView());
      break;

    case AllPropertiesView.route:
      builder = (context) => ChangeNotifierProvider(
          create: (context) => AllPropertiesVm(),
          child: const AllPropertiesView());
      break;

    case ContactView.route:
      final modal = settings.arguments as dynamic;
      builder = (context) => ChangeNotifierProvider(
          create: (context) => ContactVm(id: modal),
          child: const ContactView());
      break;

    case VerificationCodeView.route:
      final data = settings.arguments as dynamic;
      builder = (context) => ChangeNotifierProvider(
          create: (context) => VerificationCodeVm(id: data['id'], email: data['email']),
          child: const VerificationCodeView());
      break;

    case BottomNav.route:
      builder = (context) => ChangeNotifierProvider(
          create: (context) => BottomNavVm(), child: const BottomNav());
      break;
    case AboutView.route:
      builder = (context) => ChangeNotifierProvider(
          create: (context) => AboutVm(), child: const AboutView());
      break;

    case WebViewScreen.route:
      final modal = settings.arguments as Map<String, dynamic>;
      builder = (context) => ChangeNotifierProvider(
          create: (context) =>
              WebViewVm(url: modal['url'], title: modal['title']),
          child: const WebViewScreen());
      break;
    case ToolsView.route:
      builder = (context) => ChangeNotifierProvider(
          create: (context) => ToolsVm(), child: const ToolsView());
      break;
    case ServicesView.route:
      builder = (context) => ChangeNotifierProvider(
          create: (context) => ServicesVm(), child: const ServicesView());
      break;
    case SalesView.route:
      builder = (context) => ChangeNotifierProvider(
          create: (context) => SalesVm(), child: const SalesView());
      break;
    case LettingsView.route:
      builder = (context) => ChangeNotifierProvider(
          create: (context) => LettingsVm(), child: const LettingsView());
      break;
    case ValuationView.route:
      builder = (context) => ChangeNotifierProvider(
          create: (context) => ValuationVm(), child: const ValuationView());
      break;

    case AnimationView.route:
      final modal = settings.arguments as Map<String, dynamic>;
      builder = (context) => ChangeNotifierProvider(
          create: (context) => AnimationVm(
              lottie: modal['lottie'],
              title: modal['title'],
              bypass: modal["bypass"]),
          child: const AnimationView());
      break;

    default:
      return errorRoute();
  }

  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      );
    },
    transitionDuration: const Duration(
        milliseconds: 500), // Set a custom duration for the transition
  );
}

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Arggg!',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const Center(
          child: Text('Oh No! You should not be here! '),
        ),
      );
    },
  );
}
