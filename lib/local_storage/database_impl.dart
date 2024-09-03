import 'dart:io';

import 'package:article_test/local_storage/database.dart';
import 'package:article_test/local_storage/tables/articles.dart';
import 'package:article_test/features/articles/domain/entities/article.dart' as e;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'package:sqlite3/sqlite3.dart' hide Database;

part 'database_impl.g.dart';

@DriftDatabase(tables: [Articles])
class DatabaseImpl extends _$DatabaseImpl implements Database {
  DatabaseImpl() : super(_openConnection());

  @override
  Future<void> deleteAllArticles() async {
    (delete(articles));
  }

  @override
  Future<List<Article>> getAllArticles() async {
    return select(articles).get();
  }

  @override
  Future<void> insertArticles(List<e.Article> articlesList) async {
    await batch((batch) {
    final entries = articlesList.map((article) {
      return ArticlesCompanion.insert(
        title: article.title,
        author: article.author,
        createdAt: article.createdAt, 
      );
    }).toList();
    
    batch.insertAll(articles, entries);
  });
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
