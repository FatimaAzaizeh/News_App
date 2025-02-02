import 'package:flutter/material.dart';
import 'package:news_app/core/constants/palette.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';

class NewsViewPage extends StatelessWidget {
  final NewsInfo newsInfo;
  const NewsViewPage({super.key, required this.newsInfo});

  String _getDateInDDMMYYFormat(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Palette.deeepBlue,
              size: 20,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newsInfo.title != null ? newsInfo.title! : '-- No title',
                style: const TextStyle(
                    color: Palette.deeepBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 300,
                color: Palette.lightGrey,
                child: newsInfo.imageURL != null
                    ? Image.network(
                        newsInfo.imageURL!,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox(),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                _getDateInDDMMYYFormat(newsInfo.dateTime),
                style: const TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                newsInfo.author != null ? newsInfo.author! : '-- No author',
                style: const TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                newsInfo.content != null ? newsInfo.content! : '-- No content',
                style: const TextStyle(
                  color: Palette.deeepBlue,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
