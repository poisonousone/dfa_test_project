import 'package:dfa_test_project/presentation/blocs/main_screen_bloc/main_screen_bloc_events.dart';
import 'package:dfa_test_project/presentation/blocs/main_screen_bloc/main_screen_bloc_states.dart';
import 'package:dfa_test_project/presentation/navigation/navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final INavigationManager navigationManager;

  MainScreenBloc({required this.navigationManager});

  @override
  MainScreenState get initialState => InitialState();

  @override
  Stream<MainScreenState> mapEventToState(MainScreenEvent event) async* {
    if (event is NewsItemPressed) {
      yield* _loadNewsPage(event);
    }
    else if (event is BackButtonPressed) {
      yield* _loadMainPage();
    }
    else if (event is ScreenNotImplemented) {
      yield* _loadPlaceholderPage(event);
    }
  }

  _loadNewsPage(NewsItemPressed event) => navigationManager.pushRoute(Routes.articleScreen, [event.title, event.body]);

  _loadMainPage() => navigationManager.pushRouteWithReplacement(Routes.mainScreen);

  _loadPlaceholderPage(ScreenNotImplemented event) => navigationManager.pushRouteWithReplacement(Routes.placeholderScreen, event.name);

}