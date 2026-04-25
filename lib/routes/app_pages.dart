import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/login_screen.dart';
import 'package:flutter_application_1/features/e_orders/screens/e_orders_screen.dart';
import 'package:flutter_application_1/features/e_orders/screens/new_order_screen.dart';
import 'package:flutter_application_1/features/home/home_screen.dart';
import 'package:flutter_application_1/features/splash/splash_screen.dart';
import 'package:flutter_application_1/routes/app_routes.dart';

class AppPages {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.home:
        final isGuest = settings.arguments as bool? ?? false;

        return MaterialPageRoute(builder: (_) => HomeScreen(isGuest: isGuest));

      case AppRoutes.eOrders:
        return MaterialPageRoute(builder: (_) => const EOrdersScreen());

      case AppRoutes.newOrder:
        return MaterialPageRoute(builder: (_) => const NewOrderScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
