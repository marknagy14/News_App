import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';

class BreakingNewsProvider extends ChangeNotifier {
  List<ArticleModel> breakingNewsList = [];

  BreakingNewsProvider() {
    getAllBreakingNews();
  }

  Future getAllBreakingNews() async {
    try {
      print("///");
      var response = await Dio().get(
          "https://newsapi.org/v2/top-headlines?country=eg&apiKey=4ea227d420e4448b8a343828601fb9ee");
      print(response.data);
      breakingNewsList = List<ArticleModel>.from(
          response.data["articles"].map((e) => ArticleModel.fromJson(e)));
      notifyListeners();

    } catch (e) {
      print(e);
    }
  }
}
