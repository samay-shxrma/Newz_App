import 'package:flutter/material.dart';
import 'package:myapp/Model/model.dart';
import 'package:myapp/Screen/news_detail.dart';
import 'package:myapp/Services/sevice.dart';

class SelectedCategoryNews extends StatefulWidget {
  String category;
  SelectedCategoryNews({super.key, required this.category});

  @override
  State<SelectedCategoryNews> createState() => _SelectedCategoryNewsState();
}

class _SelectedCategoryNewsState extends State<SelectedCategoryNews> {
  List<NewsModel> articles = [];
  bool isLoadin = true;
  getNews() async {
    CategoryNews news = CategoryNews();
    await news.getNews(widget.category);
    setState(() {
      isLoadin = false;
    });
    articles = news.dataStore;
  }

  @override
  void initState() {
    getNews();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          widget.category,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoadin
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetail(newsModel: article),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              article.urlToImage!,
                              height: 200,
                              width: 400,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            article.title!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const Divider(thickness: 2),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
