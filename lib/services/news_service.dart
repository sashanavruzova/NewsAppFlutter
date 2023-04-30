import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news.dart';
import '../config.dart';

class NewsService {
  static const _baseUrl = 'https://newsapi.org/v2';

  Future<List<News>> getTopHeadlines() async {
    final response = await http.get(Uri.parse(
        '$_baseUrl/top-headlines?country=us&apiKey=${Config.apiKey}'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final articles = json['articles'] as List;
      return articles.map((e) => News.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
