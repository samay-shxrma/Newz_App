import 'package:flutter/material.dart';
import 'package:myapp/Model/model.dart';

class NewsDetail extends StatelessWidget {
  final NewsModel newsModel;
  const NewsDetail({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text(
              newsModel.title!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              children: [
                Expanded(child: SizedBox()),
                Expanded(child: Text(" - ${newsModel.author}", maxLines: 1)),
              ],
            ),
            SizedBox(height: 10),
            Image.network(newsModel.urlToImage!),
            SizedBox(height: 10),
            Text(newsModel.description!, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
