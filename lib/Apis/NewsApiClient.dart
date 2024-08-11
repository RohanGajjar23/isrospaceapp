import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class NewsApiClient {
  final String apiKey = "339a1fe4d02248ea92fba9570bbbfe66";
  final String baseUrl = 'https://newsapi.org/v2';


  List<String> news = [];
  List<String> newsBody = [];
  List<String> newsLink = [];

  NewsApiClient();

  Future<void> getSpaceNews() async {
    final url = Uri.parse(
  '$baseUrl/everything?q=spacecraft OR "space mission" OR "space exploration" OR NASA OR ISRO OR "space agency"&apiKey=$apiKey'
);


    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final articles = data['articles'];
        if (articles.isNotEmpty) {
          for (var article in articles) {
            log(article['url']);
            news.add(article['title']);
            newsBody.add(article['description']);
            newsLink.add(article['url']);
          }
        } else {
          print('No space-related news found.');
        }
      } else {
        print('Failed to load news: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred: $error');
    }
  }
}
