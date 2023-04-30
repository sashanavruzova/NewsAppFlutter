import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_list_block.dart';
import 'package:news_app/config.dart';
import 'package:news_app/screens/news_list_screen.dart';
import 'package:news_app/services/news_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsListBloc>(
      create: (BuildContext context) => NewsListBloc(NewsService()),
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NewsListScreen(),
      ),
    );
  }
}
