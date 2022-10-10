import 'package:flutter/material.dart';
import 'package:news_app/view/screens/breaking_news_screen.dart';
import 'package:news_app/view/screens/search_screen.dart';
import 'package:news_app/view/screens/sports_screen.dart';

class ControlProvider extends ChangeNotifier {
  int currentScreenIndex = 0;

  Widget currentScreen = BreakingNewsScreen();

  void changeScreen(int index) {
    currentScreenIndex = index;

    switch (index) {
      case (0):
        currentScreen = BreakingNewsScreen();
        break;

      case (1):
        currentScreen = SportsScreen();
        break;

      case (2):
        currentScreen = SearchScreen();
        break;
    }
    notifyListeners();
  }
}
