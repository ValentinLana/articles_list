import 'package:article_test/local_storage/data_mapper/article_mapper.dart';
import 'package:article_test/local_storage/database.dart';
import 'package:article_test/network/error_response.dart';
import 'package:article_test/features/articles/data/dto/articles_dto.dart';
import 'package:article_test/features/articles/domain/input_output/articles_output.dart';
import 'package:article_test/network/http_client.dart';
import 'package:article_test/utils/network_info.dart';

import '../../domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NetworkInfo _networkInfo;
  final HttpClient _httpClient;
  final String _baseUrl;
  final Database _localDatabase;

  ArticleRepositoryImpl({
    required HttpClient httpClient,
    required NetworkInfo networkInfo,
    required String baseUrl,
    required Database localDatabase,
  })  : _httpClient = httpClient,
        _networkInfo = networkInfo,
        _baseUrl = baseUrl,
        _localDatabase = localDatabase;

  @override
  Future<ArticlesOutput> getArticles() async {
    bool hasConnection = await _networkInfo.networkInfo.hasConnection;

    if (hasConnection) {
      HttpResponse response = await _httpClient.get(
        '$_baseUrl/api/v1/search_by_date?query=mobile',
      );
      if (response.isOk()) {
        final ArticlesDto articlesDto = ArticlesDto.fromJson(response.data);

        await _localDatabase.deleteAllArticles();

        await _localDatabase.insertArticles(articlesDto.toArticles());

        return ArticlesOutput(articlesList: articlesDto.toArticles());
      }
      ErrorResponse? errorResponse;
      try {
        errorResponse = ErrorResponse.fromJson(response.data);
      } catch (_) {
        errorResponse = ErrorResponse(statusCode: response.statusCode, error: '', message: []);
      }

      final databaseArticles = await _localDatabase.getAllArticles();

      return ArticlesOutput(articlesList: ArticleMapper.listToEntity(databaseArticles), error: errorResponse);
    }

    final databaseArticles = await _localDatabase.getAllArticles();

    return ArticlesOutput(
        articlesList: ArticleMapper.listToEntity(databaseArticles), error: ErrorResponse.noInternet());
  }
}
