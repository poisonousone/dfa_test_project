import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/blocs/blocs.dart';
import '../../presentation/themes/theme_helper.dart';

class NewsItem extends StatelessWidget {
  final int userId;
  final int id;
  final String title;
  final String body;

  NewsItem(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory NewsItem.fromJson(dynamic json) => NewsItem(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']);

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => BlocProvider.of<MainScreenBloc>(context).
      add(NewsItemPressed(title: title, body: body)),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
          height: 166,
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/images/news_background.png'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  ThemeHelper.getTheme().colorBlack
                ]
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: ThemeHelper.getTheme().text2Semibold,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(body,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: ThemeHelper.getTheme().text2Semibold),
                    ),
                  )
                ],
              ),
            ),
          )),
    ),
  );
}
