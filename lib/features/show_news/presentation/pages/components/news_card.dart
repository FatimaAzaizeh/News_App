import 'package:flutter/material.dart';
import 'package:news_app/core/constants/palette.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';
import 'package:news_app/features/show_news/presentation/pages/components/news_view_page.dart';

class NewsCard extends StatelessWidget {
  final NewsInfo newsInfo;
  const NewsCard({super.key, required this.newsInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NewsViewPage(
            newsInfo: newsInfo,
          );
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 300,
        width: MediaQuery.of(context).size.width - (2 * 16),
        child: Stack(
          children: [
            Container(
              height: 260,
              color: Palette.lightGrey,
              child: newsInfo.imageURL != null
                  ? Image.network(
                      newsInfo.imageURL!,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 0,
              child: Container(
                height: 80,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    color: Colors.black12,
                  )
                ]),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      newsInfo.title != null ? newsInfo.title! : '-- No title',
                      maxLines: 2,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Palette.deeepBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
