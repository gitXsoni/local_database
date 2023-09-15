import 'package:drift/drift.dart';

class Person extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get address => text().nullable()();
  IntColumn get phoneNumber => integer().nullable()();
  TextColumn get college =>
      text().withDefault(const Constant("Prithvi Narayan Campus"))();
  BoolColumn get isPassed => boolean()();
}
