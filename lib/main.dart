import 'package:flutter/material.dart';
import 'package:movies_app/pages/dashboard.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MoviesProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme:ThemeData(
        primaryColor: appColorWhite,
        fontFamily: 'Poppins',),
      home: const DashboardPage(),
    );
  }
}

