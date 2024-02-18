import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK }

// 484390
// 0D1F61
const MaterialColor blueColor = MaterialColor(
  0xff2E2EFE,
  <int, Color>{
    50: Color(0xff2E2EFE),
    100: Color(0xff2E2EFE),
    200: Color(0xff2E2EFE),
    300: Color(0xff2E2EFE),
    400: Color(0xff2E2EFE),
    500: Color(0xff2E2EFE),
    600: Color(0xff2E2EFE),
    700: Color(0xff2E2EFE),
    800: Color(0xff2E2EFE),
    900: Color(0xff2E2EFE),
  },
);
const MaterialColor oldBlueColor = MaterialColor(
  0xff2E2EFE,
  <int, Color>{
    50: Color(0xff2E2EFE),
    100: Color(0xff2E2EFE),
    200: Color(0xff2E2EFE),
    300: Color(0xff2E2EFE),
    400: Color(0xff2E2EFE),
    500: Color(0xff2E2EFE),
    600: Color(0xff2E2EFE),
    700: Color(0xff2E2EFE),
    800: Color(0xff2E2EFE),
    900: Color(0xff2E2EFE),
  },
);

Color primaryAppColor(BuildContext context) {
  return AdaptiveTheme.of(context).theme.primaryColor;
}

Color primaryReverseAppColor(BuildContext context) {
  switch (AdaptiveTheme.of(context).theme.brightness) {
    case Brightness.light:
      return ThemeSource.darkTheme.primaryColor;
    case Brightness.dark:
      return ThemeSource.lightTheme.primaryColor;
    default:
      return Colors.black;
  }
}

Color focusAppColor({BuildContext? context}) {
  return oldBlueColor;
}

Color blueAccent(BuildContext context) {
  if (AdaptiveTheme.of(context).brightness == Brightness.light) {
    return oldBlueColor;
  } else {
    return blueColor;
  }
}

Color cardColor(BuildContext context) {
  return AdaptiveTheme.of(context).theme.cardColor;
}

Color appbarColor(BuildContext context) {
  return AdaptiveTheme.of(context).theme.appBarTheme.backgroundColor!;
}

Color textColor(BuildContext context) {
  return AdaptiveTheme.of(context).theme.textTheme.titleSmall?.color ??
      primaryAppColor(context);
}

Color calculatorItemColor(BuildContext context) {
  if (isDarkMode(context)) {
    return const Color.fromARGB(153, 255, 255, 255);
  } else {
    return const Color.fromARGB(67, 34, 37, 45);
  }
}

Color goldColor = const Color(0XFFE1DB9B);

class ThemeSource {
  static const Color lightGrey = Color(0xffB3B8CF);
  static const Color darkGrey = Color(0xff282F38);
  static const Color grey2 = Color(0xffB5BAC9);
  static const Color lightBlue = Color(0xffE8F0FD);

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'ProximaNova',
    primarySwatch: oldBlueColor,
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: Colors.black, fontSize: 12),
    ),
    useMaterial3: false,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: oldBlueColor,
        onPrimary: oldBlueColor,
        secondary: Color(0xFFFFFFFF),
        onSecondary: Color(0xFFFFFFFF),
        error: Color(0xFFFF0000),
        onError: Color(0xFFFF0000),
        background: Color(0xffF6F6FA),
        onBackground: Color(0xffF6F6FA),
        surface: Color(0x00000000),
        onSurface: Color(0x00000000)),
    appBarTheme: const AppBarTheme(
      color: Color(0xffFFFFFF),
    ),
    primaryColor: oldBlueColor,
    scaffoldBackgroundColor: const Color(0xffF6F6FA),
    cardColor: const Color(0xffFFFFFF),
    focusColor: const Color(0xff0066FF),
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: oldBlueColor,
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: Color(0xff2E2F40)),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'ProximaNova',
    primarySwatch: blueColor,
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: Color(0xFF000000)),
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: Colors.white, fontSize: 12),
    ),
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFFFFFFF),
        onPrimary: Color(0xFFFFFFFF),
        secondary: oldBlueColor,
        onSecondary: oldBlueColor,
        error: Color(0xFFFF0000),
        onError: Color(0xFFFF0000),
        background: Color(0xff14161B),
        onBackground: Color(0xff14161B),
        surface: Color(0x00000000),
        onSurface: Color(0x00000000)),
    appBarTheme: const AppBarTheme(
      color: Color(0xff14161B),
    ),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xff17222C),
    cardColor: const Color(0xff22252D),
    bottomSheetTheme: const BottomSheetThemeData(
      modalBackgroundColor: Color(0xff14161B),
    ),
    focusColor: const Color(0xff0066FF),
    cupertinoOverrideTheme: const CupertinoThemeData(
      barBackgroundColor: Color(0xff1B1E24),
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    ),
  );
}

String brightness(BuildContext context) =>
    AdaptiveTheme.of(context).theme.colorScheme.brightness == Brightness.dark
        ? "dark"
        : "light";

bool isDarkMode(BuildContext context) =>
    AdaptiveTheme.of(context).theme.colorScheme.brightness == Brightness.dark;
