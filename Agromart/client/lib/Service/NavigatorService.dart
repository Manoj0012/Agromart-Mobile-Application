import 'package:flutter/widgets.dart';

class NavigatorService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static getNavigator(String routes) {
    return navigatorKey.currentState!.pushNamed(routes);
  }

  static loginRedirect() {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil('/login', (route) => false);
  }
}
