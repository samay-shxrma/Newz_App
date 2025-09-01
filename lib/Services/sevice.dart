import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:myapp/Model/model.dart';

class NewsApi {
  List<NewsModel> dataStore = [];

  Future<void> getNews() async {
    Uri url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=eda4f038f3bc4040aea21eadbb929f2e",
    );
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == 'ok') {
      jsonData["articles"].forEach((Element) {
        if (Element['urlToImage'] != null &&
            Element['description'] != null &&
            Element['author'] != null &&
            Element['content'] != null) {
          NewsModel newsModel = NewsModel(
            title: Element['title'],
            urlToImage: Element['urlToImage'],
            description: Element['description'],
            author: Element['author'],
            content: Element['content'],
          );
          dataStore.add(newsModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<NewsModel> dataStore = [];

  Future<void> getNews(String category) async {
    Uri url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=eda4f038f3bc4040aea21eadbb929f2e",
    );
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == 'ok') {
      jsonData["articles"].forEach((Element) {
        if (Element['urlToImage'] != null &&
            Element['description'] != null &&
            Element['author'] != null &&
            Element['content'] != null) {
          NewsModel newsModel = NewsModel(
            title: Element['title'],
            urlToImage: Element['urlToImage'],
            description: Element['description'],
            author: Element['author'],
            content: Element['content'],
          );
          dataStore.add(newsModel);
        }
      });
    }
  }
}
