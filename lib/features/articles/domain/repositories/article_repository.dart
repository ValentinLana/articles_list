import 'package:article_test/features/articles/domain/input_output/articles_output.dart';

abstract class ArticleRepository {
  Future<ArticlesOutput> getArticles();
}
