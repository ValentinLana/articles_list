import 'package:article_test/network/error_response.dart';
import 'package:article_test/features/articles/domain/entities/article.dart';

class ArticlesOutput {
  final List<Article>? articlesList;
  final ErrorResponse? error;

  ArticlesOutput({this.articlesList,this.error});
}
