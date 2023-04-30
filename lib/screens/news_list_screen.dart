import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_list_block.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/screens/news_detail_screen.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Headlines'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.read<NewsListBloc>().markAllRead();
            },
            child: const Text(
              'Mark all read',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<NewsListBloc, List<News>>(
        builder: (context, List<News> newsList) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    final news = newsList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailsScreen(news: news),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(news.imageUrl,
                                  fit: BoxFit.fill),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                news.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    final news = newsList[index];
                    return ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(news.title),
                          ),
                          if (!news.read) const SizedBox(width: 10),
                          if (!news.read)
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                      subtitle: Text(news.description),
                      leading: SizedBox(
                          width: 100, child: Image.network(news.imageUrl)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailsScreen(news: news),
                          ),
                        );
                        context.read<NewsListBloc>().markAsRead(news);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
