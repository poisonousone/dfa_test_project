import 'package:dfa_test_project/presentation/screens/placeholder_screen/placeholder_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:dfa_test_project/dependency_injection/getter.dart';
import 'package:dfa_test_project/presentation/blocs/blocs.dart';
import 'package:dfa_test_project/presentation/navigation/routes.dart';
import 'package:dfa_test_project/presentation/screens/screens.dart';

class Router {
  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final route = routeSettings.name;

    switch (route) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getter<SplashBloc>(),
            child: SplashScreen(),
          ),
          settings: routeSettings
        );

      case Routes.mainScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => getter<MainScreenBloc>(),
                child: HomeScreen()
            ),
            settings: routeSettings
        );

      case Routes.articleScreen:
        return MaterialPageRoute(
          builder: (context) => ArticleScreen(),
          settings: routeSettings,
        );

      case Routes.placeholderScreen:
        return MaterialPageRoute(
            builder: (context) => PlaceholderScreen(),
            settings: routeSettings,
        );

      default:
        throw UnimplementedError(translate('app.exceptions.unknown_route', args: {"value" : route}));
    }
  }
}
