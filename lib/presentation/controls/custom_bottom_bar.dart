import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../blocs/blocs.dart';
import '../themes/theme_helper.dart';

class CustomBottomBar extends StatefulWidget {

  final int initialIndex;

  CustomBottomBar({required this.initialIndex});

  @override
  State<CustomBottomBar> createState()  => _CustomBottomBarState(selectedIndex: initialIndex);

}

class _CustomBottomBarState extends State<CustomBottomBar> {

  int selectedIndex;

  _CustomBottomBarState({required this.selectedIndex});

  double _sizeParameter = 50;

  List<String> names = ['Главная', 'Компании', '', 'Календарь', 'Профиль'];

  void _onSelect(int index) {
    setState(() {
      if (selectedIndex != index) {
        if (index != 2) selectedIndex = index;
        if (selectedIndex == 0) {
          BlocProvider.of<MainScreenBloc>(context).add(BackButtonPressed());
        }
        else {
          BlocProvider.of<MainScreenBloc>(context).add(ScreenNotImplemented(name: names[selectedIndex]));
        }

        };
      });
    }

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        iconSize: _sizeParameter,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/main.svg'),
              label: 'Главная',
              activeIcon: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      color: ThemeHelper.getTheme().color2White,
                      boxShadow: [
                        BoxShadow(
                            color: ThemeHelper.getTheme().colorYellow,
                            spreadRadius: 2,
                            blurRadius: 3
                        )
                      ]),
                  child: Container(
                      child: SvgPicture.asset(
                        'assets/images/main.svg',
                        height: _sizeParameter*0.8,
                        width: _sizeParameter*0.8,
                        fit: BoxFit.scaleDown,
                      )))),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/companies.svg'),
              label: 'Мои компании',
              activeIcon: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeHelper.getTheme().color2White,
                      boxShadow: [
                        BoxShadow(
                            color: ThemeHelper.getTheme().colorYellow,
                            spreadRadius: 2,
                            blurRadius: 3)
                      ]),
                  child: SvgPicture.asset('assets/images/companies.svg',
                    height: _sizeParameter*0.8,
                    width: _sizeParameter*0.8,
                    fit: BoxFit.scaleDown,))),
          BottomNavigationBarItem(
              icon: Material(
                elevation: 50,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Container(
                      height: _sizeParameter*1.1,
                      width: _sizeParameter*1.1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeHelper.getTheme().colorYellow,
                      ),
                      child: SvgPicture.asset('assets/images/central_icon.svg', fit: BoxFit.contain,)),
              ),
              label: 'Центральная'
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/calendar.svg'),
              label: 'Календарь',
            activeIcon: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ThemeHelper.getTheme().color2White,
                    boxShadow: [
                      BoxShadow(
                          color: ThemeHelper.getTheme().colorYellow,
                          spreadRadius: 2,
                          blurRadius: 3)
                    ]),
                  child: SvgPicture.asset('assets/images/calendar.svg',
                    height: _sizeParameter*0.8,
                    width: _sizeParameter*0.8,
                    fit: BoxFit.scaleDown,)
              ),

          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/profile.svg'),
              label: 'Мой профиль',
              activeIcon: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeHelper.getTheme().color2White,
                      boxShadow: [
                        BoxShadow(
                            color: ThemeHelper.getTheme().colorYellow,
                            spreadRadius: 2,
                            blurRadius: 3)
                      ]),
                  child: SvgPicture.asset('assets/images/profile.svg',
                    height: _sizeParameter*0.8,
                    width: _sizeParameter*0.8,
                    fit: BoxFit.scaleDown,))),
        ],
        backgroundColor: ThemeHelper.getTheme().color1White,
        currentIndex: selectedIndex,
        selectedItemColor: ThemeHelper.getTheme().colorBlack,
        selectedFontSize: 10,
        onTap: _onSelect,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      );
}
