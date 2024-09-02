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

  ArticleRepositoryImpl({
    required HttpClient httpClient,
    required NetworkInfo networkInfo,
    required String baseUrl,
  })  : _httpClient = httpClient,
        _networkInfo = networkInfo,
        _baseUrl = baseUrl;

  @override
  Future<ArticlesOutput> getArticles() async {
    bool hasConnection = await _networkInfo.networkInfo.hasConnection;

    if (hasConnection) {
      HttpResponse response = await _httpClient.get(
        '$_baseUrl/api/v1/search_by_date?query=mobile',
      );
      if (response.isOk()) {
        final ArticlesDto articlesDto = ArticlesDto.fromJson(response.data);

        return ArticlesOutput(articlesList: articlesDto.toArticles());
      }
      ErrorResponse? errorResponse;
      try {
        errorResponse = ErrorResponse.fromJson(response.data);
      } catch (_) {
        errorResponse = ErrorResponse(statusCode: response.statusCode, error: '', message: []);
      }
      return ArticlesOutput(error: errorResponse);
    }
    return ArticlesOutput(error: ErrorResponse.noInternet());
  }
}
