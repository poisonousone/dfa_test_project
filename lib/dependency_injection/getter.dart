import 'dart:io';
import 'package:flutter/material.dart' hide Router;
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:dfa_test_project/data/api/api.dart';
import 'package:dfa_test_project/presentation/blocs/blocs.dart';
import 'package:dfa_test_project/presentation/navigation/navigation.dart';

final getter = GetIt.instance;

Future<void> initGetter() async {
  _initNavigation();
  _initNetwork();
  _initBlocs();
}

void _initNavigation() {
  getter.registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>());

  getter.registerLazySingleton<INavigationManager>(
      () => NavigationManager(navigatorKey: getter()));

  getter.registerLazySingleton<Router>(() => Router());
}

void _initNetwork() {
  Dio dio = Dio(BaseOptions(validateStatus: (status) => true));
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  getter.registerLazySingleton<Dio>(() => dio);

  getter.registerLazySingleton<NewsApi>(() => NewsClient(dio: getter()));
}

void _initBlocs() {
  getter.registerFactory<SplashBloc>(() => SplashBloc(
    navigationManager: getter()
  ));

  getter.registerFactory<MainScreenBloc>(() => MainScreenBloc(
      navigationManager: getter()
  ));
}
