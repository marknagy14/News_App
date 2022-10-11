import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/article_model.dart';
import '../screens/web_view_screen.dart';

class ListViewWidget extends StatelessWidget {
  List <ArticleModel> newsList;


  ListViewWidget({required this.newsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WebViewScreen(
                      url: newsList[index].url)));
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
                          image: NetworkImage(newsList[index]
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
                            newsList[index].title ??
                                "",
                            style: TextStyle(
                                color: Colors.white,fontWeight: FontWeight.bold ,fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 10),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            newsList[index]
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
  }
}
