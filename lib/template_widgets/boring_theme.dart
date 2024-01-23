import 'package:boring_app/boring_app/navigation/drawer/style/boring_drawer_style.dart';
import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/material.dart';

class BoringTheme {
  static BoringThemeConfig boringThemeConfig(BuildContext context) =>
      BoringThemeConfig(
          theme: ThemeData(
        fontFamily: 'Inter',
        visualDensity: VisualDensity.standard,
        brightness: Brightness.light,
        scaffoldBackgroundColor: scaffoldColor,
        primaryColor: mainColor,
        timePickerTheme: const TimePickerThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        dialogTheme: const DialogTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        inputDecorationTheme: inputDecorationTheme(context),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: dialogTitleColor,
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: accentColor.withAlpha(40),
          deleteIconColor: mainColor,
          labelStyle: TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w500,
            color: mainColor,
            fontFamily: 'Inter',
          ),
        ),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: dialogTitleColor,
          labelColor: mainColor,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
          indicatorColor: mainColor,
        ),
        checkboxTheme: Theme.of(context).checkboxTheme.copyWith(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              side: BorderSide(
                width: 1,
                color: columnTableTextColor.withAlpha(150),
              ),
              splashRadius: 0,
            ),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: mainColor,
              secondary: accentColor,
              onPrimary: Colors.white,
              onSurface: dialogTitleColor,
            ),
      ));

  static const BoringDrawerStyle drawerStyle = BoringDrawerStyle(
      width: 230,
      backgroundColor: Colors.white,
      drawerContentPadding: EdgeInsets.symmetric(horizontal: 25),
      drawerRadius: BorderRadius.all(Radius.circular(10)));

  static BoringDrawerTileStyle drawerTileStyle = BoringDrawerTileStyle(
    selectedColor: mainColor.withAlpha(20),
    unSelectedTextColor: dialogTitleColor,
    selectedTextColor: mainColor,
  );
}
