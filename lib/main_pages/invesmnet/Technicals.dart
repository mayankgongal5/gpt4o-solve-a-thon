import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TechnicalsPage extends StatefulWidget {
  @override
  _TechnicalsPageState createState() => _TechnicalsPageState();
}

class _TechnicalsPageState extends State<TechnicalsPage> {
  List<String> _topics = [
    'Investment',
    'Finance',
    'Budgeting',
    'Loans',
    'Credit',
    'Debt',
    'Savings',
    'Interest',
    'Tax',
    'Stock'
  ];

  Map<String, String?> _topicDetails = {};

  @override
  void initState() {
    super.initState();
    _fetchTopicDetails();
  }

  Future<void> _fetchTopicDetails() async {
    const apiKey = ''; // Replace with your actual API key
    const apiUrl = '';

    for (String topic in _topics) {
      final prompt = 'Provide a short overview of $topic in 50 words.';
      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $apiKey',
          },
          body: json.encode({
            'model': 'gpt-4',
            'messages': [{'role': 'user', 'content': prompt}],
            'max_tokens': 50,
          }),
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final String detail = data['choices'][0]['message']['content'].trim();
          setState(() {
            _topicDetails[topic] = detail;
          });
        }
      } catch (e) {
        print('Error fetching details for $topic: $e');
      }
    }
  }

  void _showTopicDetail(String topic) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(topic),
          content: StatefulBuilder(
            builder: (context, setState) {
              String content = _topicDetails[topic] ?? 'Loading...';
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(content),
                  if (content == 'Loading...')
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CircularProgressIndicator(),
                    ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );

    if (_topicDetails[topic] == null) {
      _fetchTopicDetailsFor(topic);
    }
  }

  Future<void> _fetchTopicDetailsFor(String topic) async {
    const apiKey = ''; // Replace with your actual API key
    const apiUrl = '';

    final prompt = 'Provide a short overview of $topic in 50 words.';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: json.encode({
          'model': 'gpt-4',
          'messages': [{'role': 'user', 'content': prompt}],
          'max_tokens': 50,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final String detail = data['choices'][0]['message']['content'].trim();
        setState(() {
          _topicDetails[topic] = detail;
        });
      }
    } catch (e) {
      print('Error fetching details for $topic: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finance Roadmap'),
      ),
      body: Stack(
        children: [
          // Background road design
          Positioned.fill(
            child: Container(
              color: Colors.grey[300], // Light grey for road
              child: Center(
                child: Container(
                  height: 10,
                  color: Colors.black, // Black road
                  width: double.infinity,
                ),
              ),
            ),
          ),
          // Left and Right topics
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side topics
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ..._topics.sublist(0, _topics.length ~/ 2).map((topic) {
                        return _buildTopicCard(topic);
                      }).toList(),
                    ],
                  ),
                ),
                // Right side topics
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ..._topics.sublist(_topics.length ~/ 2).map((topic) {
                        return _buildTopicCard(topic);
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicCard(String topic) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          topic,
          style: TextStyle(fontSize: 18.0),
        ),
        onTap: () => _showTopicDetail(topic),
      ),
    );
  }
}
