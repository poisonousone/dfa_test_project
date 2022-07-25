import 'package:dfa_test_project/domain/models/models.dart';
import 'package:dfa_test_project/presentation/controls/controls.dart';
import 'package:dfa_test_project/presentation/themes/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dfa_test_project/presentation/blocs/blocs.dart';

class ArticleScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<String> args = ModalRoute.of(context)!.settings.arguments as List<String>;
    return BlocListener<MainScreenBloc,
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ThemeHelper
            .getTheme()
            .colorBlack
            .withOpacity(0.5),
        leading: IconButton(
          icon: SvgPicture.asset('assets/images/arrow.svg'),
          onPressed: () =>
              BlocProvider.of<MainScreenBloc>(context).add(BackButtonPressed()),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(initialIndex: 0,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 310,
                child: Image.asset(
                    'assets/images/news_background.png', fit: BoxFit.cover),
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        ThemeHelper
                            .getTheme()
                            .colorBlack
                      ]
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                      child: Text(args[0], style: ThemeHelper.getTheme().text2Semibold, textAlign: TextAlign.start,))
                ],
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                  args[1],
                  style: ThemeHelper.getTheme().textLight
                ),
              )
        ],
      ),
    ) ] ) );
  }

}