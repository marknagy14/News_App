import 'package:flutter/material.dart';
import 'package:news_app/provider/search_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/list_builder.dart';

class SearchScreen extends StatelessWidget {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, provider, child) {
      return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: TextField(
                onChanged: (value) {
                  // called everytime you type a letter
                  tapped = true;
                  Provider.of<SearchProvider>(context, listen: false)
                      .getAllSearchArticle(value);
                },
                decoration: InputDecoration(
                    hintText: 'search',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
          ),
          body: (tapped == false)
              ? (Center(
                  child: Text(
                  "what's in your mind?",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )))
              : ((provider.searchList.length == 0)
                  ? (Center(
                      child: Text(
                      "No results",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )))
                  : (ListViewWidget(newsList: provider.searchList))
      ));
    });
  }
}
