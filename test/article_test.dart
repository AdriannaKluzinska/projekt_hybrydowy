import 'dart:convert';
import 'package:test/test.dart';
import 'package:projekt_hybrydowy/models/news_model.dart';

void main() {
  test('should create a NewsArticle from JSON', () {
    const jsonString = '''
    {
      "source": {
        "id": "abc123",
        "name": "Sample Source"
      },
      "author": "John Doe",
      "title": "Sample Article",
      "description": "This is a sample article description.",
      "url": "https://www.example.com",
      "urlToImage": "https://www.example.com/image.jpg",
      "content": "This is the content of the sample article.",
      "publishedAt": "2025-01-20T00:00:00Z"
    }
    ''';

    // Konwersja JSON na obiekt NewsArticle
    final newsArticle = NewsArticle.fromJson(json.decode(jsonString));

    // Sprawdzamy, czy wartości są poprawnie przypisane
    expect(newsArticle.source.id, 'abc123');
    expect(newsArticle.source.name, 'Sample Source');
    expect(newsArticle.author, 'John Doe');
    expect(newsArticle.title, 'Sample Article');
    expect(newsArticle.description, 'This is a sample article description.');
    expect(newsArticle.url, 'https://www.example.com');
    expect(newsArticle.urlToImage, 'https://www.example.com/image.jpg');
    expect(newsArticle.content, 'This is the content of the sample article.');
    expect(newsArticle.publishedAt, DateTime.parse('2025-01-20T00:00:00Z'));
  });
}