import 'package:FlutterNews/helper/news.dart';
import 'package:FlutterNews/models/article_model.dart';
import 'package:FlutterNews/views/shimmer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'article_view.dart';

class CategoryNews extends StatefulWidget {

  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Text(widget.category),
            Text(
              "News",
              style: TextStyle(color: Colors.red),
            ),
                ],
              ),
            ),
            Icon(Icons.refresh)
          ],
        ),
        elevation: 0.0,
      ),
      body: _loading
          ? shimmmerEffect()
          : SingleChildScrollView(
                      child: Container(
        child: Column(
            children: <Widget>[
              Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 10),
                        child: ListView.builder(
                            itemCount: articles.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return BlogTile(
                                imageUrl: articles[index].urlToImage,
                                title: articles[index].title,
                                desc: articles[index].description,
                                url: articles[index].url
                              );
                            }),
                      )
            ],
        ),
      ),
          ),
      
    );
  }
}
class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc,url;
  BlogTile(
      {@required this.imageUrl, @required this.title, @required this.desc,@required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(
          blogUrl:url,
        )));
      },
          child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                imageUrl,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    desc,
                    style: TextStyle(fontSize: 15, color: Colors.white70),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.white24)
          ],
        ),
      ),
    );
  }
}
