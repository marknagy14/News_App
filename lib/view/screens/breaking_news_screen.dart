// image =  "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"
// const Color(0xff151f2c),

import 'package:flutter/material.dart';
import 'package:news_app/provider/breaking_news_provider.dart';
import 'package:news_app/view/screens/web_view_screen.dart';
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
              : ListView.builder(
                  itemCount: provider.breakingNewsList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WebViewScreen(
                                url: provider.breakingNewsList[index].url)));
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
                                            .breakingNewsList[index]
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
                                      provider.breakingNewsList[index].title ??
                                          "",
                                      style: TextStyle(
                                          color: Colors.white,fontWeight: FontWeight.bold ,fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      provider.breakingNewsList[index]
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
      ),
    );
  }
}
