// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:nazruldex2/pages/settings_page.dart';

import 'package:nazruldex2/utils/routes.dart';
import 'package:nazruldex2/widgets/themes.dart';
import 'pages/home_page.dart';
import "package:velocity_x/velocity_x.dart";
Future<void> main() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final isDark = Settings.getValue(SettingsPage.settingDarkMode, false);
    return ValueChangeObserver(
      defaultValue: false,
      cacheKey: SettingsPage.settingDarkMode,
      builder: (context, isDark, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home : HomePage(),
        // initialRoute: "/login",
        // don't use this. Use / route instead.
        themeMode: isDark == false ? ThemeMode.light : ThemeMode.dark,
        theme: Themes.lightTheme(context),
        darkTheme: Themes.darkTheme(context),
        routes: {
          // "/" : (context) => LoginPage(),
          MyRoutes.homeRoute: (context)=> HomePage(),
        },
      ),
    );
  }
}