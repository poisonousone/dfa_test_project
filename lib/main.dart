import 'package:dfa_test_project/presentation/blocs/main_screen_bloc/main_screen_bloc.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:dfa_test_project/presentation/navigation/navigation.dart';
import 'package:dfa_test_project/dependency_injection/getter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGetter();

  runApp(DFATestApp());
}

class DFATestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MainScreenBloc>(
              create: (context) => MainScreenBloc(navigationManager: getter()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DFA Test App', //todo i18n
          navigatorKey: getter(),
          initialRoute: Routes.splash,
          onGenerateRoute: getter<Router>().onGenerateRoute,
        ));
  }
}
