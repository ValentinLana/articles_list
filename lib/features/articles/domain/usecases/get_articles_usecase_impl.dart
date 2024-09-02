import 'package:article_test/features/articles/domain/input_output/articles_output.dart';
import 'package:article_test/features/articles/domain/repositories/article_repository.dart';
import 'package:article_test/features/articles/domain/usecases/get_articles_usecase.dart';

class GetArticlesUseCaseImpl implements GetArticlesUseCase{
  final ArticleRepository repository;

  GetArticlesUseCaseImpl({required this.repository});

  @override
  Future<ArticlesOutput> call() async {
    return await repository.getArticles();
  }
}