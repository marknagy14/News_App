import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/provider/sports_provider.dart';
import 'package:provider/provider.dart';
import '../screens/web_view_screen.dart';

Widget listBuilder(var provider,List<ArticleModel> listOfKind){
  return Consumer<SportsProvider>(
    builder: (context, provider, child) {
      return provider.sportList.length == 0
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: provider.sportList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WebViewScreen(
                        url: provider.sportList[index].url)));
              },
              child: Card(
                elevation: 20,
                color: Color(0xff151f2c),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(provider
                                .sportList[index]
                                .urlToImage ??
                                "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"),
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              provider.sportList[index].title ??
                                  "",
                              style: TextStyle(
                                  color: Colors.white,fontWeight: FontWeight.bold ,fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 10),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              provider.sportList[index]
                                  .description ??
                                  "",
                              style: TextStyle(
                                  color: Colors.white38),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    },
  );

}