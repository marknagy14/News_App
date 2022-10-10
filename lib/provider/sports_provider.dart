import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/article_model.dart';


class SportsProvider extends ChangeNotifier {
  List<ArticleModel> sportList = [];

  SportsProvider (){
    getAllSportsNews();
  }

  Future getAllSportsNews() async {
    try {
      print("get sports news method called");
      var response = await Dio().get(
          "https://newsapi.org/v2/top-headlines?apiKey=4ea227d420e4448b8a343828601fb9ee&country=eg&category=sports");
      print(response.data);
      sportList = List<ArticleModel>.from(
          response.data["articles"].map((e) => ArticleModel.fromJson(e)));
      notifyListeners();
    }
    catch (e) {
      print(e);
    }
  }
}
