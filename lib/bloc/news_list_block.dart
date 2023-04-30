import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/services/news_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsListBloc extends Cubit<List<News>> {
  final NewsService _newsService;
  List<News> _newsList = [];
  bool _allRead = false;
  final StreamController<List<News>> _newsController =
      StreamController<List<News>>();

  NewsListBloc(this._newsService) : super([]) {
    getTopHeadlines();
  }

  Stream<List<News>> get newsStream => _newsController.stream;
  bool get allRead => _allRead;

  Future<void> getTopHeadlines() async {
    try {
      _newsList = await _newsService.getTopHeadlines();
      _newsController.add(_newsList);
      emit(_newsList);
    } catch (e) {
      _newsController.addError(e);
    }
  }

  void markAllRead() {
    _allRead = true;
    _newsList = _newsList.map((news) => news.copyWith(read: true)).toList();
    _newsController.add(_newsList);
    emit(_newsList);
  }

  void markAsRead(News news) {
    final index = _newsList.indexOf(news);
    if (index != -1) {
      _newsList[index].read = true;
      _newsController.add(_newsList);
      emit(_newsList);
    }
  }
}
