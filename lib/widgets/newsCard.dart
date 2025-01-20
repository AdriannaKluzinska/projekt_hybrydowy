import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // Dodaj import pakietu intl

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String publishedAt;  // Oczekujemy, że będzie to data w formacie ISO 8601
  final String author;
  final String imageUrl;

  const NewsCard({
    super.key,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.author,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.parse(publishedAt);
    final String formattedDate = DateFormat('yyyy/MM/dd').format(date);

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white54,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: Column(
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.person_rounded,
                      color: Colors.black26,
                    ),
                    Text(
                      author,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.black26,
                    ),
                    Text(
                      formattedDate,  // Używamy sformatowanej daty
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
