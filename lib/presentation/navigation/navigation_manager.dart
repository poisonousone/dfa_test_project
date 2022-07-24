import 'package:flutter/widgets.dart';
import 'i_navigation_manager.dart';

class NavigationManager implements INavigationManager {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationManager({required this.navigatorKey});

  @override
  Future<dynamic> pushRoute(String route, [arguments]) async {
    return navigatorKey.currentState!.pushNamed(route, arguments: arguments);
  }

  @override
  Future<dynamic> pushRouteWithReplacement(String route, [arguments]) async {
    while (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
    }

    return navigatorKey.currentState!
        .pushReplacementNamed(route, arguments: arguments);
  }

  @override
  void goBack([arguments]) {
    navigatorKey.currentState!.pop(arguments);
  }

  @override
  BuildContext getGlobalContext() {
    return navigatorKey.currentContext!;
  }
}
