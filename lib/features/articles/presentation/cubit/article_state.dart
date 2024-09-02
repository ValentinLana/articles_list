import 'package:article_test/features/articles/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class ArticleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<Article> articles;

  ArticleLoaded(this.articles);

  @override
  List<Object?> get props => [articles];
}

class ArticleError extends ArticleState {
  final String message;

  ArticleError(this.message);

  @override
  List<Object?> get props => [message];
}