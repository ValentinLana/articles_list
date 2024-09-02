import 'package:article_test/features/articles/domain/entities/article.dart';
import 'package:article_test/features/articles/presentation/cubit/article_state.dart';
import 'package:article_test/core/injector_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/article_cubit.dart';
import '../widgets/article_item.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hacker News - Mobile')),
      body: BlocProvider(
        create: (_) => InjectorManager.getInstance().get<ArticleCubit>()..fetchArticles(),
        child: BlocConsumer<ArticleCubit, ArticleState>(
          listenWhen: (previous, current) => current is ArticleError,
          listener: (context, state) {
            if (state is ArticleError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Error : ${state.message}'),
              ));
            }
          },
          buildWhen: (previous, current) => current is ArticleLoading || current is ArticleLoaded,
          builder: (context, state) {
            if (state is ArticleLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ArticleLoaded) {
              return ArticlePageBody(
                articlesList: state.articles,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class ArticlePageBody extends StatelessWidget {
  final List<Article> articlesList;
  const ArticlePageBody({
    super.key,
    required this.articlesList,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<ArticleCubit>().fetchArticles(),
      child: ListView.builder(
        itemCount: articlesList.length,
        itemBuilder: (context, index) {
          return ArticleItem(article: articlesList[index]);
        },
      ),
    );
  }
}
