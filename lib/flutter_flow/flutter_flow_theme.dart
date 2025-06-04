// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';

SharedPreferences? _prefs;

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color primaryBtnText;
  late Color lineColor;
  late Color customColor2;
  late Color customColor3;
  late Color customColor1;
  late Color parkingPrimary;
  late Color parkingPrimaryBackground;
  late Color parkingSecondaryBackground;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFB6001A);
  late Color secondary = const Color(0xFFDFC8A5);
  late Color tertiary = const Color(0xFFA2DB3D);
  late Color alternate = const Color(0xFF9DB8FF);
  late Color primaryText = const Color(0xFF0D0801);
  late Color secondaryText = const Color(0xFF54726D);
  late Color primaryBackground = const Color(0xFFF4F3F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0xFF616161);
  late Color accent2 = const Color(0xFF757575);
  late Color accent3 = const Color(0xFFE0E0E0);
  late Color accent4 = const Color(0xFFEEEEEE);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color primaryBtnText = const Color(0xFFFFFFFF);
  late Color lineColor = const Color(0xFF0D0801);
  late Color customColor2 = const Color(0xFFD8D5E5);
  late Color customColor3 = const Color(0xFFF5F6FB);
  late Color customColor1 = const Color(0xFF979CAF);
  late Color parkingPrimary = const Color(0xFFFFAC47);
  late Color parkingPrimaryBackground = const Color(0xFFE4E2EC);
  late Color parkingSecondaryBackground = const Color(0xFF18212F);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Numans';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 29.0,
      );
  String get displayMediumFamily => 'Numans';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get displaySmallFamily => 'Numans';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get headlineLargeFamily => 'Numans';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
      );
  String get headlineMediumFamily => 'Numans';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
      );
  String get headlineSmallFamily => 'Numans';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 17.0,
      );
  String get titleLargeFamily => 'Numans';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 17.0,
      );
  String get titleMediumFamily => 'Numans';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 15.0,
      );
  String get titleSmallFamily => 'Numans';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 15.0,
      );
  String get labelLargeFamily => 'Numans';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelMediumFamily => 'Numans';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Numans';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Numans';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyMediumFamily => 'Numans';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 10.0,
      );
  String get bodySmallFamily => 'Numans';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 10.0,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Numans';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 29.0,
      );
  String get displayMediumFamily => 'Numans';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get displaySmallFamily => 'Numans';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get headlineLargeFamily => 'Numans';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
      );
  String get headlineMediumFamily => 'Numans';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
      );
  String get headlineSmallFamily => 'Numans';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 17.0,
      );
  String get titleLargeFamily => 'Numans';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 17.0,
      );
  String get titleMediumFamily => 'Numans';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 15.0,
      );
  String get titleSmallFamily => 'Numans';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 15.0,
      );
  String get labelLargeFamily => 'Numans';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelMediumFamily => 'Numans';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Numans';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Numans';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyMediumFamily => 'Numans';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 10.0,
      );
  String get bodySmallFamily => 'Numans';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 10.0,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Numans';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 34.0,
      );
  String get displayMediumFamily => 'Numans';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 28.0,
      );
  String get displaySmallFamily => 'Numans';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 28.0,
      );
  String get headlineLargeFamily => 'Numans';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get headlineMediumFamily => 'Numans';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get headlineSmallFamily => 'Numans';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Numans';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'Numans';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Numans';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get labelLargeFamily => 'Numans';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Numans';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelSmallFamily => 'Numans';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get bodyLargeFamily => 'Numans';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodyMediumFamily => 'Numans';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.numans(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodySmallFamily => 'Numans';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.numans(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFB6001A);
  late Color secondary = const Color(0xFFBD9A65);
  late Color tertiary = const Color(0xFF568B00);
  late Color alternate = const Color(0xFF5E52D4);
  late Color primaryText = const Color(0xFFF2F2EA);
  late Color secondaryText = const Color(0xFFB6A774);
  late Color primaryBackground = const Color(0xFF131517);
  late Color secondaryBackground = const Color(0xFF1F2527);
  late Color accent1 = const Color(0xFFEEEEEE);
  late Color accent2 = const Color(0xFFE0E0E0);
  late Color accent3 = const Color(0xFF757575);
  late Color accent4 = const Color(0xFF616161);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color primaryBtnText = const Color(0xFFFFFFFF);
  late Color lineColor = const Color(0xFF0D0801);
  late Color customColor2 = const Color(0xFF212A2F);
  late Color customColor3 = const Color(0xFF0D0801);
  late Color customColor1 = const Color(0xFF4E595D);
  late Color parkingPrimary = const Color(0xFFFFAC47);
  late Color parkingPrimaryBackground = const Color(0xFF161A1E);
  late Color parkingSecondaryBackground = const Color(0xFF18212F);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
