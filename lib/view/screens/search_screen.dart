import 'package:flutter/material.dart';
import 'package:news_app/provider/search_provider.dart';
import 'package:news_app/view/screens/web_view_screen.dart';
import 'package:provider/provider.dart';

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
                  : (ListView.builder(
                      itemCount: provider.searchList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            tapped = true;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => WebViewScreen(
                                    url: provider.searchList[index].url)));
                          },
                          child: Card(
                            elevation: 20,
                            color: Color(0xff151f2c),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(provider
                                                .searchList[index].urlToImage ??
                                            "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Text(
                                          provider.searchList[index].title ??
                                              "",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Text(
                                          provider.searchList[index]
                                                  .description ??
                                              "",
                                          style:
                                              TextStyle(color: Colors.white38),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }))
      ));
    });
  }
}
