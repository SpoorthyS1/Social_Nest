import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final String _apiKey =
      "b05f1104dad84bc3ba82a89a269a4992"; // Hardcoded API Key
  final String _baseUrl = "https://newsapi.org/v2/everything";
  List<dynamic> _newsArticles = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchNews("India"); // Default query for fetching news
  }

  Future<void> _fetchNews(String query) async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final response = await http.get(
        Uri.parse("$_baseUrl?q=$query&apiKey=$_apiKey"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          // Filter out articles with null or placeholder fields
          _newsArticles = data['articles']
              .where((article) =>
                  article['title'] != null && article['title'] != "[Removed]")
              .toList();
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = "Failed to fetch news: ${response.reasonPhrase}";
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = "Error occurred: $e";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Column(
        children: [
          // Search bar below AppBar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  _fetchNews(value);
                }
              },
              decoration: InputDecoration(
                hintText: "Search for news...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _error.isNotEmpty
                    ? Center(child: Text(_error))
                    : ListView.builder(
                        itemCount: _newsArticles.length,
                        itemBuilder: (context, index) {
                          final article = _newsArticles[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 6.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 5,
                                    spreadRadius: 2,
                                    offset: Offset(2, 4),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.all(12.0),
                                title: Text(
                                  article['title'] ?? "No title",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                subtitle: Text(
                                  article['description'] ?? "No description",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                leading: article['urlToImage'] != null
                                    ? Image.network(
                                        article['urlToImage'],
                                        width: 80,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        width: 80,
                                        color: Colors.grey[200],
                                        child: Icon(Icons.image, size: 40),
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
