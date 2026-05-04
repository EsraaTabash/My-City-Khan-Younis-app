import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/account/screens/services_directory_screen.dart';
import 'package:flutter_application_1/features/adan_time/adan_time_screen.dart';
import 'package:flutter_application_1/features/auth/login_screen.dart';
import 'package:flutter_application_1/features/baladiyati/screens/baladiyati_news_screen.dart';
import 'package:flutter_application_1/features/contact_us/screens/contact_us_screen.dart';
import 'package:flutter_application_1/features/contact_us/screens/new_message_screen.dart';
import 'package:flutter_application_1/features/currency/currency_screen.dart';
import 'package:flutter_application_1/features/e_orders/screens/e_orders_screen.dart';
import 'package:flutter_application_1/features/e_orders/screens/new_order_screen.dart';
import 'package:flutter_application_1/features/home/home_screen.dart';
import 'package:flutter_application_1/features/splash/splash_screen.dart';
import 'package:flutter_application_1/features/water_table/screens/water_table_screen.dart';
import 'package:flutter_application_1/features/water_table/screens/water_table_detail_screen.dart';
import 'package:flutter_application_1/features/weather/weather_screen.dart';
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

      case AppRoutes.waterTable:
        return MaterialPageRoute(builder: (_) => const WaterTableScreen());

      case AppRoutes.contactUs:
        return MaterialPageRoute(builder: (_) => const ContactUsScreen());

      case AppRoutes.newMessage:
        return MaterialPageRoute(builder: (_) => const NewMessageScreen());

      case AppRoutes.adanTime:
        return MaterialPageRoute(builder: (_) => const AdanTimeScreen());

      case AppRoutes.currency:
        return MaterialPageRoute(builder: (_) => const CurrencyScreen());

      case AppRoutes.weather:
        return MaterialPageRoute(builder: (_) => const WeatherScreen());

      case AppRoutes.baladiyatiNews:
        return MaterialPageRoute(builder: (_) => const BaladiyatiNewsScreen());

      case AppRoutes.waterTableDetail:
        final region = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => WaterTableDetailScreen(region: region ?? {}),
        );

      case AppRoutes.servicesDirectory:
        return MaterialPageRoute(
          builder: (_) => const ServicesDirectoryScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
