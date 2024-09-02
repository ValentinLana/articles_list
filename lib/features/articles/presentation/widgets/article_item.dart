import 'package:flutter/material.dart';
import '../../domain/entities/article.dart';
import 'package:intl/intl.dart';


class ArticleItem extends StatelessWidget {
  final Article article;

  ArticleItem({super.key, required this.article});

  final dateFormat = DateFormat('d-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title),
      subtitle: Text('${article.author} - ${dateFormat.format(article.createdAt)}'),
    );
  }
}