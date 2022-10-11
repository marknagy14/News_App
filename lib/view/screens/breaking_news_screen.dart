// image =  "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"
// const Color(0xff151f2c),

import 'package:flutter/material.dart';
import 'package:news_app/provider/breaking_news_provider.dart';
import 'package:news_app/view/screens/web_view_screen.dart';
import 'package:news_app/view/widgets/list_builder.dart';
import 'package:provider/provider.dart';

class BreakingNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Breaking news'),
      ),
      body: Consumer<BreakingNewsProvider>(
        builder: (context, provider, child) {
          return provider.breakingNewsList.length == 0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListViewWidget(newsList: provider.breakingNewsList);
        },
      ),
    );
  }
}
