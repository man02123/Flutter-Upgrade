//
// Created by bhavyadeeppurswani on 17/07/22.
//
import 'package:flutter/material.dart';

class AppThemeData {
  static final AppThemeData _instance = AppThemeData._withDefaultValues();

  static AppThemeData get instance => _instance;

  Color _primaryColor, _primaryColorLight, _primaryColorDark;
  Color _secondaryColor, _secondaryColorLight, _secondaryColorDark;
  Color _backgroundMain,
      _backgroundLight1,
      _backgroundLight2,
      _backgroundLight3,
      _backgroundLight4;
  final Color _backgroundGrey;
  final Color _textDark1, _textDark2, _textDark3, _textLight1, _textLight2;
  Color _fillLight,
      _fillDark1,
      _fillDark2,
      _fillDark3,
      _fillDark4,
      _secondaryFill;
  Color _strokeDark1, _strokeDark2, _strokeDark3;
  final Color _warningColor,
      _warningColorLight,
      _warningColorMedium,
      _warningColorDark;
  final Color _cautionColor,
      _cautionColorLight,
      _cautionColorVeryLight,
      _cautionColorDark;
  final Color _successColor,
      _successColorLight,
      _successColorMedium,
      _successColorDark;
  final Color _padding1;
  final Color _shadow1;
  final Color _horizontalDivider;
  Color _highlightPrimary;
  final Color _shadowColor;
  Color _footerColor;
  Color _ribbonColorLight, _ribbonColorDark;
  Color _primaryButtonFillColor,
      _primaryButtonTextColor,
      _primaryButtonHoverColor,
      _primaryButtonClickColor;
  Color _secondaryButtonFillColor,
      _secondaryButtonTextColor,
      _secondaryButtonHoverColor,
      _secondaryButtonClickColor,
      _secondaryButtonStrokeColor;
  final Color _activeColor;
  final Color _activeColorDark;
  final Color _activeFillColor;
  final Color _neutralColor;
  final Color _neutralColorDark;
  Color _tertiaryLinkColor;

  AppThemeData._withDefaultValues()
      : _primaryColor = const Color(0xFF0025B9),
        _primaryColorDark = const Color(0xFF001D92),
        _primaryColorLight = const Color(0xFF002DE0),
        _secondaryColor = const Color(0xFF00BC8D),
        _secondaryColorDark = const Color(0xFF00956F),
        _secondaryColorLight = const Color(0xFF00E3AB),
        _backgroundMain = const Color(0xFFF5F5F5),
        _backgroundLight1 = const Color(0xFFFFFFFF),
        _backgroundLight2 = const Color(0xFFF6FBFF),
        _backgroundLight3 = const Color(0xFFEEF4F9),
        _backgroundLight4 = const Color(0xFFE9EDF0),
        _backgroundGrey = const Color.fromRGBO(15, 15, 15, 0.05),
        _textDark1 = const Color.fromRGBO(0, 0, 0, 1),
        _textDark2 = const Color.fromRGBO(46, 46, 46, 1),
        _textDark3 = const Color.fromRGBO(92, 92, 92, 1),
        _textLight1 = const Color.fromRGBO(255, 255, 255, 1),
        _textLight2 = const Color.fromRGBO(255, 255, 255, 0.75),
        _fillLight = const Color(0xFFDEE7EE),
        _fillDark1 = const Color.fromRGBO(149, 190, 224, 1),
        _fillDark2 = const Color.fromRGBO(149, 190, 224, 0.3),
        _fillDark3 = const Color.fromRGBO(149, 190, 224, 0.05),
        _fillDark4 = const Color(0xFFC4D3E1),
        _secondaryFill = const Color(0xFFEDD7DA),
        _strokeDark1 = const Color.fromRGBO(95, 122, 143, 1),
        _strokeDark2 = const Color.fromRGBO(149, 190, 224, 1),
        _strokeDark3 = const Color.fromRGBO(149, 190, 224, 0.4),
        _warningColor = const Color(0xFFDC2804),
        _warningColorLight = const Color(0xFFFFEDC8),
        _warningColorMedium = const Color(0xFFF1CDCD),
        _warningColorDark = const Color(0xFFB32306),
        _cautionColor = const Color(0xFFFFC247),
        _cautionColorLight = const Color(0xFFFFD47F),
        _cautionColorVeryLight = const Color(0xFFFFF6E3),
        _cautionColorDark = const Color(0xFFD29822),
        _successColor = const Color(0xFF05945B),
        _successColorLight = const Color(0xFFEDF7F2),
        _successColorMedium = const Color(0xFFBBE2CE),
        _successColorDark = const Color(0xFF07794C),
        _padding1 = const Color(0xFFF5F5F5),
        _shadow1 = const Color(0xFF337AB7),
        _highlightPrimary = const Color.fromRGBO(0, 37, 185, 0.1),
        _horizontalDivider = const Color(0xFFDDDDDD),
        _shadowColor = const Color.fromRGBO(26, 62, 92, 0.15),
        _footerColor = const Color(0xFF0025B9),
        _ribbonColorLight = const Color(0xFF00E3AB),
        _ribbonColorDark = const Color(0xFF00956F),
        _primaryButtonFillColor = const Color(0xFF0025B9),
        _primaryButtonTextColor = const Color(0xFFFFFFFF),
        _primaryButtonHoverColor = const Color(0xFF002DE0),
        _primaryButtonClickColor = const Color(0xFF001D92),
        _secondaryButtonFillColor = const Color(0xFFFFFFFF),
        _secondaryButtonTextColor = const Color(0xFF0025B9),
        _secondaryButtonHoverColor = const Color(0xFFF6FBFF),
        _secondaryButtonClickColor = const Color(0xFFF6FBFF),
        _secondaryButtonStrokeColor = const Color(0xFF0025B9),
        _activeColor = const Color(0xFF0570DE),
        _activeColorDark = const Color(0xFF5F7A8F),
        _activeFillColor = const Color(0xFFDFEBF6),
        _neutralColor = const Color.fromRGBO(224, 224, 224, 1),
        _neutralColorDark = const Color.fromRGBO(15, 15, 15, 0.5),
        _tertiaryLinkColor = const Color(0xFF0025B9);

  void initFromMap(Map<String, String> map) {
    _primaryColor = _getColor(map['primaryColor'] ?? '');
    _primaryColorDark = _getColor(map['primaryColorDark'] ?? '');
    _primaryColorLight = _getColor(map['primaryColorLight'] ?? '');
    _secondaryColor = _getColor(map['secondaryColor'] ?? '');
    _secondaryColorDark = _getColor(map['secondaryColorDark'] ?? '');
    _secondaryColorLight = _getColor(map['secondaryColorLight'] ?? '');
    if (map.containsKey('backgroundMain')) {
      _backgroundMain =
          _getColor(map['backgroundMain'] ?? '', const Color(0xFFF5F5F5));
    }
    if (map.containsKey('backgroundLight1')) {
      _backgroundLight1 =
          _getColor(map['backgroundLight1'] ?? '', const Color(0xFFFFFFFF));
    }
    if (map.containsKey('backgroundLight2')) {
      _backgroundLight2 =
          _getColor(map['backgroundLight2'] ?? '', const Color(0xFFF6FBFF));
    }
    if (map.containsKey('backgroundLight3')) {
      _backgroundLight3 =
          _getColor(map['backgroundLight3'] ?? '', const Color(0xFFEEF4F9));
    }
    if (map.containsKey('backgroundLight4')) {
      _backgroundLight4 =
          _getColor(map['backgroundLight4'] ?? '', const Color(0xFFE9EDF0));
    }
    if (map.containsKey('fillLight')) {
      _fillLight = _getColor(map['fillLight'] ?? '', const Color(0xFFDEE7EE));
    }
    if (map.containsKey('fillDark1')) {
      _fillDark1 = _getColor(
          map['fillDark1'] ?? '', const Color.fromRGBO(149, 190, 224, 1));
    }
    if (map.containsKey('fillDark2')) {
      _fillDark2 = _getColor(
          map['fillDark2'] ?? '', const Color.fromRGBO(149, 190, 224, 0.3));
    }
    if (map.containsKey('fillDark3')) {
      _fillDark3 = _getColor(
          map['fillDark3'] ?? '', const Color.fromRGBO(149, 190, 224, 0.05));
    }
    if (map.containsKey('fillDark4')) {
      _fillDark4 = _getColor(map['fillDark4'] ?? '', const Color(0xFFC4D3E1));
    }
    if (map.containsKey('secondaryFill')) {
      _secondaryFill =
          _getColor(map['secondaryFill'] ?? '', const Color(0xFFEDD7DA));
    }
    if (map.containsKey('strokeDark1')) {
      _strokeDark1 = _getColor(
          map['strokeDark1'] ?? '', const Color.fromRGBO(95, 122, 143, 1));
    }
    if (map.containsKey('strokeDark2')) {
      _strokeDark2 = _getColor(
          map['strokeDark2'] ?? '', const Color.fromRGBO(149, 190, 224, 1));
    }
    if (map.containsKey('strokeDark3')) {
      _strokeDark3 = _getColor(
          map['strokeDark3'] ?? '', const Color.fromRGBO(149, 190, 224, 0.4));
    }
    if (map.containsKey('highlightPrimary')) {
      _highlightPrimary = _getColor(
          map['highlightPrimary'] ?? '', const Color.fromRGBO(0, 37, 185, 0.1));
    }
    _footerColor = _getColor(map['footerColor'] ?? '', _primaryColor);
    _ribbonColorLight =
        _getColor(map['ribbonColorLight'] ?? '', _secondaryColorLight);
    _ribbonColorDark =
        _getColor(map['ribbonColorDark'] ?? '', _secondaryColorDark);
    _primaryButtonFillColor =
        _getColor(map['primaryButtonFillColor'] ?? '', primaryColor);
    _primaryButtonTextColor =
        _getColor(map['primaryButtonTextColor'] ?? '', backgroundLight1);
    _primaryButtonHoverColor =
        _getColor(map['primaryButtonHoverColor'] ?? '', primaryColorLight);
    _primaryButtonClickColor =
        _getColor(map['primaryButtonClickColor'] ?? '', primaryColorDark);
    _secondaryButtonFillColor =
        _getColor(map['secondaryButtonFillColor'] ?? '', backgroundLight1);
    _secondaryButtonTextColor =
        _getColor(map['secondaryButtonTextColor'] ?? '', primaryColor);
    _secondaryButtonHoverColor =
        _getColor(map['secondaryButtonHoverColor'] ?? '', backgroundLight2);
    _secondaryButtonClickColor =
        _getColor(map['secondaryButtonClickColor'] ?? '', backgroundLight2);
    _secondaryButtonStrokeColor =
        _getColor(map['secondaryButtonStrokeColor'] ?? '', primaryColor);
    _tertiaryLinkColor =
        _getColor(map['tertiaryLinkColor'] ?? '', primaryColor);
  }

  static Color _getColor(String colorValue, [Color? defaultValue]) {
    if (colorValue.isEmpty) {
      return defaultValue ?? Colors.black;
    }
    return HexColor.fromHex(colorValue);
  }

  Color get successColorDark => _successColorDark;

  Color get successColorMedium => _successColorMedium;

  Color get successColorLight => _successColorLight;

  Color get successColor => _successColor;

  Color get cautionColorDark => _cautionColorDark;

  Color get cautionColorLight => _cautionColorLight;

  Color get cautionColorVeryLight => _cautionColorVeryLight;

  Color get cautionColor => _cautionColor;

  Color get warningColorDark => _warningColorDark;

  Color get warningColorMedium => _warningColorMedium;

  Color get warningColorLight => _warningColorLight;

  Color get warningColor => _warningColor;

  Color get textDark3 => _textDark3;

  Color get textDark2 => _textDark2;

  Color get textDark1 => _textDark1;

  Color get textLight1 => _textLight1;

  Color get textLight2 => _textLight2;

  Color get backgroundLight3 => _backgroundLight3;

  Color get backgroundLight2 => _backgroundLight2;

  Color get backgroundLight1 => _backgroundLight1;

  Color get backgroundGrey => _backgroundGrey;

  Color get secondaryColorDark => _secondaryColorDark;

  Color get secondaryColorLight => _secondaryColorLight;

  Color get secondaryColor => _secondaryColor;

  Color get primaryColorDark => _primaryColorDark;

  Color get primaryColorLight => _primaryColorLight;

  Color get primaryColor => _primaryColor;

  Color get strokeDark3 => _strokeDark3;

  Color get strokeDark2 => _strokeDark2;

  Color get strokeDark1 => _strokeDark1;

  Color get fillDark3 => _fillDark3;

  Color get fillDark2 => _fillDark2;

  Color get fillDark1 => _fillDark1;

  Color get padding1 => _padding1;

  Color get shadow1 => _shadow1;

  Color get horizontalDivider => _horizontalDivider;

  Color get highlightPrimary => _highlightPrimary;

  Color get shadowColor => _shadowColor;

  Color get footerColor => _footerColor;

  Color get ribbonColorDark => _ribbonColorDark;

  Color get ribbonColorLight => _ribbonColorLight;

  get secondaryButtonStrokeColor => _secondaryButtonStrokeColor;

  get secondaryButtonClickColor => _secondaryButtonClickColor;

  get secondaryButtonHoverColor => _secondaryButtonHoverColor;

  get secondaryButtonTextColor => _secondaryButtonTextColor;

  Color get secondaryButtonFillColor => _secondaryButtonFillColor;

  get primaryButtonClickColor => _primaryButtonClickColor;

  get primaryButtonHoverColor => _primaryButtonHoverColor;

  get primaryButtonTextColor => _primaryButtonTextColor;

  Color get primaryButtonFillColor => _primaryButtonFillColor;

  get activeColor => _activeColor;

  Color get neutralColor => _neutralColor;

  Color get neutralColorDark => _neutralColorDark;

  Color get activeFillColor => _activeFillColor;

  Color get activeColorDark => _activeColorDark;

  Color get secondaryFill => _secondaryFill;

  Color get fillDark4 => _fillDark4;

  Color get fillLight => _fillLight;

  Color get backgroundLight4 => _backgroundLight4;

  Color get backgroundMain => _backgroundMain;

  Color get tertiaryLinkColor => _tertiaryLinkColor;
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
