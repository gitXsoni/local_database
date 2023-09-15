import 'dart:io';

import 'package:database_class/models/db_models.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import "package:path/path.dart" as p;

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Person])
class MyDb extends _$MyDb {
  MyDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
