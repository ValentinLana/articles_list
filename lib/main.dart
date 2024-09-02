import 'package:article_test/features/articles/presentation/page/article_page.dart';
import 'package:flutter/material.dart';

import 'core/injector_manager.dart';

void main() {
  InjectorManager.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hacker News App',
      home: ArticlePage(),
    );
  }
}