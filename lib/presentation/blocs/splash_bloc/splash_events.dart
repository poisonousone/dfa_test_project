abstract class SplashEvent {}

class ScreenChangeEvent extends SplashEvent {
  final int seconds;
  ScreenChangeEvent({required this.seconds});
}