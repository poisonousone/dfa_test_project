import 'package:dfa_test_project/data/api/api.dart';
import 'package:dfa_test_project/dependency_injection/getter.dart';
import 'package:dfa_test_project/domain/models/models.dart';
import 'package:dfa_test_project/presentation/blocs/blocs.dart';
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
        Image.asset(
          'assets/images/background',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('main.svg'),
                  activeIcon: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: ThemeHelper.getTheme().colorYellow,
                                spreadRadius: 2)
                          ]),
                      child: SvgPicture.asset('assets/images/main.svg'))),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/companies.svg'),
                  activeIcon: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: ThemeHelper.getTheme().colorYellow,
                                spreadRadius: 2)
                          ]),
                      child: SvgPicture.asset('assets/images/companies.svg'))),
              // BottomNavigationBarItem(
              //     icon: SvgPicture.asset('assets/images/.svg'),
              //     activeIcon: Container(
              //       decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         boxShadow: [
              //           BoxShadow(
              //             color: ThemeHelper.getTheme().colorYellow,
              //             spreadRadius: 2
              //           )
              //         ]
              //       ),
              //       child: SvgPicture.asset('assets/images/main.svg')
              //     )
              // ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/calendar.svg'),
                  activeIcon: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: ThemeHelper.getTheme().colorYellow,
                                spreadRadius: 2)
                          ]),
                      child: SvgPicture.asset('assets/images/calendar.svg'))),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('profile.svg'),
                  activeIcon: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: ThemeHelper.getTheme().colorYellow,
                                spreadRadius: 2)
                          ]),
                      child: SvgPicture.asset('assets/images/profile.svg'))),
            ],
            backgroundColor: ThemeHelper.getTheme().color1White,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    SizedBox(
                      height: 152,
                      child: SvgPicture.asset('assets/images/accountant.png'),
                    ),
                    Text('Ваш бухгалтер', //todo i18n
                        style: ThemeHelper.getTheme().text1Regular),
                    Text('Наталья Анашкина', //todo i18n
                        style: ThemeHelper.getTheme().text1Semibold),
                    Text(
                      'Уведомления', //todo i18n
                      style: ThemeHelper.getTheme().textMedium,
                    ),
                    _buildNotifications(),
                    Text(
                      'Новости', //todo i18n
                      style: ThemeHelper.getTheme().textMedium,
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
          imageAsset: 'assets/images/',
          notificationText: 'Добавьте вашу первую компанию')
    ];

    return ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: ThemeHelper.getTheme().colorYellow,
                        blurRadius: 5)
                  ],
                  color: ThemeHelper.getTheme().color2White),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(notifications[index].imageAsset),
                  Center(
                      child: Text(notifications[index].notificationText,
                          style: ThemeHelper.getTheme().textMedium))
                ],
              ),
            ));
  }

  _buildNewsList() => FutureBuilder(
      future: _newsClient.getNewsList('url'),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) => Container(
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/news_background.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(snapshot.data![index].title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: ThemeHelper.getTheme().text2Semibold),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(snapshot.data![index].body,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: ThemeHelper.getTheme().text2Semibold),
                          ),
                        )
                      ],
                    ),
                  )));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });
}
