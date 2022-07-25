import 'dart:ui';
import 'package:dfa_test_project/presentation/themes/app_theme.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:dfa_test_project/presentation/util/hex_color.dart';

class MainTheme implements AppTheme {
  static final _colorWhite = HexColor('#ffffff') ;
  static final _colorSeemsWhite = HexColor('#fdfdfd') ;
  static final _colorBlack = HexColor('#000000') ;
  static final _colorDarkGrey = HexColor('#2b2a28') ;
  static final _colorLightGrey = HexColor('#e5e5e5') ;
  static final _colorYellow = HexColor('#f8d548') ;
  static final _colorGrey = HexColor('#666666') ;

  @override
  Color get color1White => _colorWhite;

  @override
  Color get color2White => _colorSeemsWhite;

  @override
  Color get colorBlack => _colorBlack;

  @override
  Color get colorDarkGrey => _colorDarkGrey;

  @override
  Color get colorLightGrey => _colorLightGrey;

  @override
  Color get colorYellow => _colorYellow;

  @override
  Color get colorGrey => _colorGrey;

  @override
  TextStyle get text1Regular => TextStyle(
      fontFamily: 'SfUIDisplay',
      fontSize: 18,
      color: _colorDarkGrey
  );

  @override
  TextStyle get text2Regular => TextStyle(
      fontFamily: 'SfUIDisplay',
      fontSize: 8,
      color: _colorGrey
  );

  @override
  TextStyle get text1Semibold => TextStyle(
      fontFamily: 'SfUIDisplay',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: _colorDarkGrey
  );

  @override
  TextStyle get text2Semibold => TextStyle(
      fontFamily: 'SfUIDisplay',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: _colorWhite
  );

  @override
  TextStyle get textLight => TextStyle(
      fontFamily: 'SfUIDisplay',
      fontSize: 14,
      fontWeight: FontWeight.w200,
      color: _colorDarkGrey
  );

  @override
  TextStyle get textMedium => TextStyle(
      fontFamily: 'SfUIDisplay',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: _colorDarkGrey
  );

  @override
  TextStyle get textMixed => TextStyle(
      fontFamily: 'SfUIDisplay',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: _colorWhite
  );

}