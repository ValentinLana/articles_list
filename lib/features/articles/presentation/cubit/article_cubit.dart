import 'package:article_test/features/articles/domain/usecases/get_articles_usecase.dart';
import 'package:article_test/features/articles/presentation/cubit/article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final GetArticlesUseCase getArticlesUseCase;

  ArticleCubit({required this.getArticlesUseCase}) : super(ArticleInitial());

  Future<void> fetchArticles() async {
    emit(ArticleLoading());
    final articles = await getArticlesUseCase();
    articles.articlesList!.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    if (articles.error == null) {
      emit(ArticleLoaded(articles.articlesList!));
      return;
    }
    emit(ArticleLoaded(articles.articlesList!));
    emit(ArticleError(articles.error!.error));
  }
}
