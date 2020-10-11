import 'package:FlutterNews/helper/news.dart';
import 'package:FlutterNews/models/article_model.dart';
import 'package:FlutterNews/views/article_view.dart';
import 'package:FlutterNews/views/category_news.dart';
import 'package:FlutterNews/views/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:FlutterNews/models/category_model.dart';
import 'package:FlutterNews/helper/data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Flutter"),
              Text(
                "News",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.location_on), onPressed: () {  },
            )
          ],
        ),
        drawer: Drawer(),
        body: _loading
            ? shimmmerEffect()
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      //Categories
                      Container(
                        height: 250,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                imageUrl: categories[index].imageUrl,
                                categoryName: categories[index].categoryName,
                              );
                            }),
                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(10,15,10,0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.assessment,
                            size:30,
                            ),
                            SizedBox(width: 20,),
                            Text("Daily ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                            ),
                            ),
                            SizedBox(width: 5,),
                            Text("Top",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,                              
                            ),
                            ),
                            Text("Updates",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                            ),
                            ),
                          ],
                        ),
                      ),

                      //Newsblogs
                      Container(
                        padding: EdgeInsets.fromLTRB(10,3,10,0),
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
              floatingActionButton: FloatingActionButton(
                onPressed: ()=>{
                  null,
                },
                backgroundColor: Colors.red,
                child: Icon(Icons.refresh,
                color: Colors.white,
                ),
                ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>CategoryNews(
          category: categoryName
        )));
      },
          child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 250,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.red.withOpacity(0.5),
                      Colors.black26.withOpacity(0.0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.0, 0.9]),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.red),
                margin: EdgeInsets.only(left: 20, bottom: 20),
                child: Text(categoryName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    )),
              ),
            )
          ],
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
