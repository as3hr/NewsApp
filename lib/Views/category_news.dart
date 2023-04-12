import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/news.dart';
import '../models/ArticleModel.dart';
import 'article_view.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({super.key, required this.categoryName});
  final String categoryName;
  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> article = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getCategorynews(widget.categoryName);
    article = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'News',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                'Today',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                  child: Column(children: [
                Container(
                  child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: article.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return BlogTile(
                          imageurl: article[index].urlToimage,
                          title: article[index].title,
                          desc: article[index].description,
                          url: article[index].url,
                        );
                      }),
                )
              ])),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageurl, title, desc, url;

  const BlogTile(
      {super.key,
      required this.imageurl,
      required this.title,
      required this.desc,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => AtricleView(
                      blogurl: url,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageurl,
                height: 240,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              desc,
              style: const TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
