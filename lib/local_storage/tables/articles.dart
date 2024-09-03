import 'package:drift/drift.dart';

class Articles extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get author => text()();
  DateTimeColumn get createdAt => dateTime()();
}