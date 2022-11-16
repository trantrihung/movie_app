import 'package:flutter/material.dart';
import 'package:movie_app/core/route/app_route_name.dart';
import 'package:movie_app/feature/booking/presentation/booking_screen.dart';
import 'package:movie_app/feature/detail/presentation/detail_screen.dart';
import 'package:movie_app/feature/home/presentation/home_screen.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case AppRouteName.detail:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DetailScreen(),
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case AppRouteName.booking:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const BookingScreen(),
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
    }
    return null;
  }
}
