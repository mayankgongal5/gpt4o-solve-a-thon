import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final String newsApiKey = '4f9a8a35e38b4867aea8a825065ed0cf'; // Replace with your actual News API key
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    _fetchIndianFinanceNews();
  }

  Future<void> _fetchIndianFinanceNews() async {
    final url =
        'https://newsapi.org/v2/everything?q=finance OR "stock market" AND India&sortBy=publishedAt&apiKey=$newsApiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> articlesJson = data['articles'];
      setState(() {
        articles = articlesJson
            .map((articleJson) => Article.fromJson(articleJson))
            .toList();
      });
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('India Finance News'),
      ),
      body: articles.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(article.description ?? 'No description available'),
                  const SizedBox(height: 8),
                  Text(
                    'Source: ${article.source}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.publishedAt,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Article {
  final String title;
  final String? description;
  final String source;
  final String publishedAt;
  final String url;

  Article({
    required this.title,
    this.description,
    required this.source,
    required this.publishedAt,
    required this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'],
      source: json['source']['name'],
      publishedAt: json['publishedAt'],
      url: json['url'],
    );
  }
}