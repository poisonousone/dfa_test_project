import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dfa_test_project/presentation/blocs/splash_bloc/splash_events.dart';
import 'package:dfa_test_project/presentation/blocs/splash_bloc/splash_states.dart';
import 'package:dfa_test_project/presentation/navigation/navigation.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final INavigationManager navigationManager;

  SplashBloc({required this.navigationManager});

  @override
  SplashState get initialState => InitialSplashState();

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is ScreenChangeEvent) {
      Future.delayed(
        Duration(seconds: event.seconds),
        () => navigationManager.pushRouteWithReplacement(Routes.mainScreen)
      );
    }
  }

}
