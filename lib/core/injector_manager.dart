import 'package:article_test/features/articles/article_feature.dart';
import 'package:article_test/local_storage/database.dart';
import 'package:article_test/local_storage/database_impl.dart';
import 'package:article_test/utils/network_info.dart';
import 'package:get_it/get_it.dart';
import '../network/dio_http_client.dart';
import '../network/http_client.dart';

final injector = GetIt.instance;

abstract class InjectorManager {
  static void setup() async {
    // Register common dependencies
    injector.registerFactory<HttpClient>(() => DioHttpClient());
    injector.registerFactory<NetworkInfo>(() => NetworkInfoImpl());
    injector.registerFactory<String>(() => 'https://hn.algolia.com', instanceName: 'baseUrl');
    injector.registerFactory<Database>(() => DatabaseImpl());

    // Register features dependencies
    ArticlesFeature.registerDependencies(injector);
  }

  static GetIt getInstance() => injector;
}
