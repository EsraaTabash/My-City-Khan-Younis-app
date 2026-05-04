import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';

class AppNavigation {
  static Future<T?> push<T>(BuildContext context, String routeName, {Object? arguments}) {
    return Navigator.of(context).pushNamed<T>(routeName, arguments: arguments);
  }

  static Future<T?> replace<T>(BuildContext context, String routeName, {Object? arguments}) {
    return Navigator.of(context).pushReplacementNamed<T, dynamic>(routeName, arguments: arguments);
  }

  static Future<T?> resetTo<T>(BuildContext context, String routeName, {Object? arguments}) {
    return Navigator.of(context).pushNamedAndRemoveUntil<T>(routeName, (route) => false, arguments: arguments);
  }

  static Future<void> goToLogin(BuildContext context) async {
    await resetTo(context, AppRoutes.login);
  }

  static Future<void> goToHome(BuildContext context, {bool isGuest = false}) async {
    await resetTo(context, AppRoutes.home, arguments: isGuest);
  }
}
