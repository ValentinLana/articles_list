import 'package:article_test/features/articles/domain/entities/article.dart';
import 'package:article_test/features/articles/domain/usecases/get_articles_usecase.dart';
import 'package:article_test/features/articles/presentation/cubit/article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final GetArticlesUseCase getArticlesUseCase;

  ArticleCubit({required this.getArticlesUseCase}) : super(ArticleInitial());

  Future<void> fetchArticles() async {
    List<Article> currentList = [];
    if (state is ArticleLoaded) {
      final currentState = state as ArticleLoaded;
      currentList = currentState.articles;
    }
    emit(ArticleLoading());
    final articles = await getArticlesUseCase();
    if (articles.error == null) {
      articles.articlesList!.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      emit(ArticleLoaded(articles.articlesList!));
      return;
    }
    emit(ArticleError(articles.error!.error));
    emit(ArticleLoaded(currentList));
  }
}
