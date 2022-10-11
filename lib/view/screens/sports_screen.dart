
import 'package:flutter/material.dart';
import 'package:news_app/provider/sports_provider.dart';
import 'package:news_app/view/screens/web_view_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/list_builder.dart';


class SportsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Sports news'),
      ),
      body: Consumer<SportsProvider>(
        builder: (context, provider, child) {
          return provider.sportList.length == 0
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ListViewWidget(newsList: provider.sportList);
        },
      ),
    );
  }
}
