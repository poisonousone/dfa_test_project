import 'dart:ui';

import 'package:dfa_test_project/data/api/api.dart';
import 'package:dfa_test_project/dependency_injection/getter.dart';
import 'package:dfa_test_project/domain/models/models.dart';
import 'package:dfa_test_project/presentation/blocs/blocs.dart';
import 'package:dfa_test_project/presentation/controls/controls.dart';
import 'package:dfa_test_project/presentation/themes/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dfa_test_project/presentation/blocs/main_screen_bloc/main_screen_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final NewsClient _newsClient = NewsClient(dio: getter());
  static const url = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Widget build(BuildContext context) => BlocListener<MainScreenBloc,
          MainScreenState>(
      listener: (context, state) {},
      child: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: CustomBottomBar(initialIndex: 0,),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 152,
                      child: Image.asset('assets/images/accountant.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Ваш бухгалтер', //todo i18n
                          style: ThemeHelper.getTheme().text1Regular),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Наталья Анашкина', //todo i18n
                          style: ThemeHelper.getTheme().text1Semibold),
                    ),
                    SizedBox(height: 5),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Уведомления', //todo i18n
                        style: ThemeHelper.getTheme().textMedium,
                      ),
                    ),
                    SizedBox(height: 3,),
                    _buildNotifications(),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Новости', //todo i18n
                        style: ThemeHelper.getTheme().textMedium,
                      ),
                    ),
                    _buildNewsList()
                  ]),
            ),
          ),
        ),
      ]));

  _buildNotifications() {
    List<NotificationItem> notifications = [
      NotificationItem(
          imageAsset: 'assets/images/notification.png',
          notificationText: 'Добавьте вашу первую компанию')
    ];

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) => Container(
              height: 86,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        color: ThemeHelper.getTheme().colorYellow,
                        blurRadius: 3)
                  ],
                  color: ThemeHelper.getTheme().color2White),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(notifications[index].imageAsset, fit: BoxFit.contain),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(notifications[index].notificationText,
                        style: ThemeHelper.getTheme().textMedium.copyWith(fontSize: 14.5),
                        textAlign: TextAlign.center,
                      ),
                  )
                  )
                ],
              ),
            ));
  }

  _buildNewsList() => FutureBuilder(
      future: _newsClient.getNewsList(url),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) => NewsItem.fromJson(snapshot.data![index]));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });
}
