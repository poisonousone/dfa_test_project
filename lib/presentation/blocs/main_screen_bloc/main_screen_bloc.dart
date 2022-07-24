import 'package:dfa_test_project/presentation/blocs/main_screen_bloc/main_screen_bloc_events.dart';
import 'package:dfa_test_project/presentation/blocs/main_screen_bloc/main_screen_bloc_states.dart';
import 'package:dfa_test_project/presentation/navigation/i_navigation_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final INavigationManager navigationManager;

  MainScreenBloc({required this.navigationManager});

  @override
  MainScreenState get initialState => InitialState();

  @override
  Stream<MainScreenState> mapEventToState(MainScreenEvent event) async* {
    if (event is NewsItemPressed) {
      yield LoadNewsItemCard();
    }
    else {
      yield LoadPlaceholderCard();
    }
  }



}