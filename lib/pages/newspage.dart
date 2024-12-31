import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsPage(),
    );
  }
}

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final String _apiKey =
      "b05f1104dad84bc3ba82a89a269a4992"; // Replace with your API Key
  final String _baseUrl = "https://newsapi.org/v2/everything";
  List<dynamic> _newsArticles = [];
  bool _isLoading = true;
  String _error = '';
  Map<String, dynamic>? _selectedArticle;
  bool _isContentExpanded = false; // For expanding content

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
        Uri.parse("$_baseUrl?q=$query&language=en&apiKey=$_apiKey"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
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

  Widget _buildNewsList() {
    return ListView.builder(
      itemCount: _newsArticles.length,
      itemBuilder: (context, index) {
        final article = _newsArticles[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
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
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                article['description'] ?? "No description",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                ),
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
              onTap: () {
                setState(() {
                  _selectedArticle = article;
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildNewsDetails(Map<String, dynamic> article) {
    String content =
        article['content'] ?? article['description'] ?? "No content available";
    String articleDate = article['publishedAt'] ?? "No date available";
    String author = article['author'] ?? "Author not available";
    String title = article['title'] ?? "No Title Available";

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article['urlToImage'] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  article['urlToImage'],
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'By $author',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              articleDate,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 16.0),
            // Display truncated content first if not expanded
            Text(
              content.length > 300 && !_isContentExpanded
                  ? content.substring(0, 300) + '...'
                  : content,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            if (content.length > 300)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isContentExpanded = !_isContentExpanded;
                  });
                },
                child: Text(
                  _isContentExpanded ? "Show Less" : "Read More",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedArticle = null; // Return to news list
                });
              },
              child: Text("Back to News List"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Column(
        children: [
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
                    : _selectedArticle != null
                        ? _buildNewsDetails(_selectedArticle!)
                        : _buildNewsList(),
          ),
        ],
      ),
    );
  }
}
