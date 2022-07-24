import 'package:flutter/material.dart' hide Router;
import 'package:flutter_translate/flutter_translate.dart';
import 'package:dfa_test_project/presentation/navigation/navigation.dart';
import 'package:dfa_test_project/dependency_injection/getter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGetter();

  runApp(DFATestApp());
}

class DFATestApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DFA Test App',
        navigatorKey: getter(),
        initialRoute: Routes.splash,
        onGenerateRoute: getter<Router>().onGenerateRoute,
      ),
    );
  }
}
