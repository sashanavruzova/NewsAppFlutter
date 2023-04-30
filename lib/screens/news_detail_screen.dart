import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';

class NewsDetailsScreen extends StatelessWidget {
  final News news;

  const NewsDetailsScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: Column(
        children: [
          Image.network(news.imageUrl),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(news.description),
          ),
        ],
      ),
    );
  }
}
