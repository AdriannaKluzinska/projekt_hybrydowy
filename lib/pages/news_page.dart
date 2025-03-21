import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {
  final String title;
  final String description;
  final String publishedAt;
  final String author;
  final String imageUrl;
  final String content;
  const NewsPage({
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.author,
    required this.imageUrl,
    required this.content
  });

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.parse(widget.publishedAt);
    final String formattedDate = DateFormat('yyyy/MM/dd').format(date);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.4),
                  child: const Icon(
                      Icons.chevron_left,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            centerTitle: true,
            expandedHeight: 350,
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  background: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.black38, Colors.black],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter
                    ).createShader(bounds),
                    blendMode: BlendMode.darken,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.imageUrl),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 180, right: 40),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          widget.description,
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.newspaper_sharp,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              widget.author,
                              style: const TextStyle(
                                color: Colors.white
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                  color: Colors.white
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "News Content",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600]
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(widget.content)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
