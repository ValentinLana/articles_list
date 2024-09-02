import 'package:article_test/features/articles/data/repositories/article_repository_impl.dart';
import 'package:article_test/features/articles/domain/repositories/article_repository.dart';
import 'package:article_test/features/articles/domain/usecases/get_articles_usecase.dart';
import 'package:article_test/features/articles/domain/usecases/get_articles_usecase_impl.dart';
import 'package:article_test/features/articles/presentation/cubit/article_cubit.dart';
import 'package:article_test/network/http_client.dart';
import 'package:article_test/utils/network_info.dart';
import 'package:get_it/get_it.dart';

abstract class ArticlesFeature {
  static void registerDependencies(GetIt injector) {
    _registerPlaceFindeFeature(injector);
  }

  static void _registerPlaceFindeFeature(GetIt injector) {
    injector.registerFactory<ArticleRepository>(
      () => ArticleRepositoryImpl(
        httpClient: injector.get<HttpClient>(),
        networkInfo: injector.get<NetworkInfo>(),
        baseUrl: injector.get<String>(instanceName: 'baseUrl'),
      ),
    );

    injector.registerFactory<GetArticlesUseCase>(
      () => GetArticlesUseCaseImpl(
        repository: injector.get<ArticleRepository>(),
      ),
    );

    injector.registerFactory<ArticleCubit>(
      () => ArticleCubit(
        getArticlesUseCase: injector.get<GetArticlesUseCase>(),
      ),
    );
  }
}
