import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final String _apiKey =
      "b05f1104dad84bc3ba82a89a269a4992"; // Replace with your API key
  final String _baseUrl = "https://newsapi.org/v2/everything";
  final TextEditingController _searchController = TextEditingController();
  List articles = [];
  bool isLoading = false;
  String errorMessage = "";

  Future<void> fetchNews(String query) async {
    setState(() {
      isLoading = true;
      errorMessage = "";
    });

    try {
      final response = await http.get(
        Uri.parse("$_baseUrl?q=$query&apiKey=$_apiKey"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          articles = data['articles'];
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "Failed to fetch news: ${response.statusCode}";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search news...",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      articles = [];
                    });
                  },
                ),
              ),
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  fetchNews(query); // Fetch news when user submits
                }
              },
            ),
          ),
          // Display results or loading indicator
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : errorMessage.isNotEmpty
                    ? Center(child: Text(errorMessage))
                    : articles.isEmpty
                        ? Center(
                            child: Text(
                                "No articles found. Try searching for something."))
                        : ListView.builder(
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              final article = articles[index];
                              return Card(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                child: ListTile(
                                  leading: article["urlToImage"] != null
                                      ? Image.network(
                                          article["urlToImage"],
                                          width: 50,
                                          fit: BoxFit.cover,
                                        )
                                      : Icon(Icons.image_not_supported),
                                  title: Text(article["title"] ?? "No Title"),
                                  subtitle: Text(article["description"] ??
                                      "No Description"),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text(
                                            article["title"] ?? "No Title"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(article["description"] ??
                                                "No Description"),
                                            SizedBox(height: 10),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Close"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
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
