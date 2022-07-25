import 'package:dfa_test_project/presentation/controls/controls.dart';
import 'package:dfa_test_project/presentation/themes/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/main_screen_bloc/main_screen_bloc.dart';
import '../../blocs/main_screen_bloc/main_screen_bloc_states.dart';

class PlaceholderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? arg = ModalRoute.of(context)?.settings.arguments as String;
    return BlocListener<MainScreenBloc, MainScreenState>(
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
              bottomNavigationBar: CustomBottomBar(
                initialIndex: ((arg! == 'Компании')
                    ? 1
                    : (arg! == 'Календарь')
                        ? 3
                        : 4),
              ),
              body: Stack(
                children: [
                  Center(
                      child:
                          SvgPicture.asset('assets/images/unimplemented.svg')),
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.16),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Flexible(
                              child: Text(
                                  'Функционал раздела \"${arg!}\" находится в разработке',
                                  style: ThemeHelper.getTheme().text1Regular)))
                    ],
                  )
                ],
              ))
        ]));
  }
}
