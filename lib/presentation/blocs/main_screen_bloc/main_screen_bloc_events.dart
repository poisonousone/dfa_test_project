abstract class MainScreenEvent {}

class NewsItemPressed extends MainScreenEvent {
  final String title;
  final String body;

  NewsItemPressed({required this.title, required this.body});
}

class BackButtonPressed extends MainScreenEvent {}

class ScreenNotImplemented extends MainScreenEvent {
  final String name;

  ScreenNotImplemented({required this.name});
}