


import 'package:article_test/features/articles/domain/entities/article.dart' as e;
import 'package:article_test/local_storage/database_impl.dart';

abstract class Database {
  Future<List<Article>> getAllArticles();
  Future<void> insertArticles(List<e.Article> articlesList);
  Future<void> deleteAllArticles();
}
