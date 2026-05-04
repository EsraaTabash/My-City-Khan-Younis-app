import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_application_1/features/account/screens/invoices_screen.dart';
import 'package:flutter_application_1/features/account/screens/points_screen.dart';
import 'package:flutter_application_1/features/account/screens/services_directory_screen.dart';
import 'package:flutter_application_1/features/adan_time/screens/adan_time_screen.dart';
import 'package:flutter_application_1/features/auth/screens/login_screen.dart';
import 'package:flutter_application_1/features/baladiyati/data/baladiyati_data.dart';
import 'package:flutter_application_1/features/baladiyati/screens/baladiyati_detail_screen.dart';
import 'package:flutter_application_1/features/baladiyati/screens/baladiyati_news_detail_screen.dart';
import 'package:flutter_application_1/features/baladiyati/screens/baladiyati_news_screen.dart';
import 'package:flutter_application_1/features/contact_us/screens/contact_us_screen.dart';
import 'package:flutter_application_1/features/contact_us/screens/new_message_screen.dart';
import 'package:flutter_application_1/features/currency/screens/currency_screen.dart';
import 'package:flutter_application_1/features/discover/models/discover_place.dart';
import 'package:flutter_application_1/features/discover/screens/discover_map_screen.dart';
import 'package:flutter_application_1/features/discover/screens/place_details_screen.dart';
import 'package:flutter_application_1/features/e_orders/screens/e_orders_screen.dart';
import 'package:flutter_application_1/features/e_orders/screens/new_order_screen.dart';
import 'package:flutter_application_1/features/home/screens/home_screen.dart';
import 'package:flutter_application_1/features/splash/screens/splash_screen.dart';
import 'package:flutter_application_1/features/water_table/screens/water_table_detail_screen.dart';
import 'package:flutter_application_1/features/water_table/screens/water_table_screen.dart';
import 'package:flutter_application_1/features/weather/screens/weather_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _pageRoute(settings, const SplashScreen());
      case AppRoutes.login:
        return _pageRoute(settings, const LoginScreen());
      case AppRoutes.home:
        final isGuest = settings.arguments as bool? ?? false;
        return _pageRoute(settings, HomeScreen(isGuest: isGuest));
      case AppRoutes.eOrders:
        return _pageRoute(settings, const EOrdersScreen());
      case AppRoutes.newOrder:
        return _pageRoute(settings, const NewOrderScreen());
      case AppRoutes.waterTable:
        return _pageRoute(settings, const WaterTableScreen());
      case AppRoutes.waterTableDetail:
        final region = settings.arguments as Map<String, dynamic>?;
        return _pageRoute(settings, WaterTableDetailScreen(region: region ?? {}));
      case AppRoutes.servicesDirectory:
        return _pageRoute(settings, const ServicesDirectoryScreen());
      case AppRoutes.invoices:
        return _pageRoute(settings, const InvoicesScreen());
      case AppRoutes.points:
        return _pageRoute(settings, const PointsScreen());
      case AppRoutes.contactUs:
        return _pageRoute(settings, const ContactUsScreen());
      case AppRoutes.newMessage:
        return _pageRoute(settings, const NewMessageScreen());
      case AppRoutes.adanTime:
        return _pageRoute(settings, const AdanTimeScreen());
      case AppRoutes.currency:
        return _pageRoute(settings, const CurrencyScreen());
      case AppRoutes.weather:
        return _pageRoute(settings, const WeatherScreen());
      case AppRoutes.baladiyatiNews:
        return _pageRoute(settings, const BaladiyatiNewsScreen());
      case AppRoutes.baladiyatiDetail:
        final type = settings.arguments as BaladiyatiDetailType?;
        return _pageRoute(settings, BaladiyatiDetailScreen(type: type ?? BaladiyatiDetailType.city));
      case AppRoutes.baladiyatiNewsDetail:
        final item = settings.arguments as BaladiyatiNewsItem?;
        return _pageRoute(settings, item == null ? const BaladiyatiNewsScreen() : BaladiyatiNewsDetailScreen(item: item));
      case AppRoutes.discoverMap:
        final categoryTitle = settings.arguments as String? ?? '';
        return _pageRoute(settings, DiscoverMapScreen(categoryTitle: categoryTitle));
      case AppRoutes.placeDetails:
        final place = settings.arguments as DiscoverPlace?;
        return _pageRoute<DiscoverPlace?>(settings, place == null ? const Scaffold(body: Center(child: Text('Place not found'))) : PlaceDetailsScreen(place: place));
      default:
        return _pageRoute(settings, const Scaffold(body: Center(child: Text('Route not found'))));
    }
  }

  static PageRoute<T> _pageRoute<T>(RouteSettings settings, Widget page) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }
}
