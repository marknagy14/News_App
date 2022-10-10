import 'package:flutter/material.dart';
import 'package:news_app/provider/breaking_news_provider.dart';
import 'package:news_app/provider/control_provider.dart';
import 'package:news_app/provider/search_provider.dart';
import 'package:news_app/provider/sports_provider.dart';
import 'package:news_app/view/widgets/control_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ControlProvider()),
      ChangeNotifierProvider(create: (context) => BreakingNewsProvider()),
      ChangeNotifierProvider(create: (context) => SearchProvider()),
      ChangeNotifierProvider(create: (context) => SportsProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ControlView(),
    );
  }
}
