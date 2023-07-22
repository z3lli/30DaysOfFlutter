import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pubguc/pages/home_page.dart';
import 'package:pubguc/pages/login_page.dart';
import 'package:pubguc/utils/routes.dart';
import 'package:pubguc/widgets/theme.dart';
import 'package:pubguc/widgets/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
