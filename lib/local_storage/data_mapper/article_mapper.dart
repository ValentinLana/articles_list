import 'package:article_test/features/articles/domain/entities/article.dart' as e;
import 'package:article_test/local_storage/database_impl.dart';

class ArticleMapper {
  static List<e.Article> listToEntity(List<Article> articles) {
    return articles.map((article) => toEntity(article)).toList();
  }

  static e.Article toEntity(Article article) {
    return e.Article(
      title: article.title,
      author: article.author,
      createdAt: article.createdAt,
    );
  }
}
