import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';

class SearchProvider extends ChangeNotifier {


  List<ArticleModel> searchList = [];


  Future getAllSearchArticle(String value) async {

    try {
      print("///");
      var response = await Dio().get(
          "https://newsapi.org/v2/top-headlines?country=eg&apiKey=4ea227d420e4448b8a343828601fb9ee&q=${value}");
      print(response.data);
      searchList = List<ArticleModel>.from(
          response.data["articles"].map((e) => ArticleModel.fromJson(e)));
      notifyListeners();

    } catch (e) {
      print(e);
    }
  }

  }

