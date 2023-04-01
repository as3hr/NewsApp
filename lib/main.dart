import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'helper/data.dart';
import 'models/category_model.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.white),
    home: const HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = <CategoryModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Flutter',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      body: Container(
          child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 70,
          child: ListView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryTile(
                  imageurl: categories[index].imageurl,
                  categoryName: categories[index].categoryName,
                );
              }),
        ),
      ])),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageurl;
  final categoryName;
  const CategoryTile({super.key, this.imageurl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imageurl,
              width: 120,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(6)),
            child: Center(
                child: Text(
              categoryName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )),
          )
        ]),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageurl, title, desc;

  const BlogTile(
      {super.key,
      required this.imageurl,
      required this.title,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Image.network(imageurl), Text(title), Text(desc)],
      ),
    );
  }
}
