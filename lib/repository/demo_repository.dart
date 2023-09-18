import 'package:database_class/models/app_db.dart';

import '../locator.dart';

class PersonDataRepo {
  MyDb db = getIt.get<MyDb>();

  fetchAllPersons() async {
    try {
      return await db.select(db.person).get();
    } catch (e) {
      print("Unabel to fetch because of $e");
    }
  }

  fetchPersonById(int id) async {
    return await (db.select(db.person)..where((tbl) => tbl.id.equals(id)))
        .getSingle()
        .then((value) => print("Successfully Fetched person data"))
        .onError((error, stackTrace) => print("error obtained successfully"));
  }

  addPerson(PersonCompanion person) async {
    await db
        .into(db.person)
        .insert(person)
        .then((value) => print('Successfully added'))
        .onError((error, stackTrace) =>
            print('Unable to add person data because of $error'));
  }

  updatePerson(PersonCompanion person) async {
    try {
      print("try blobk of update executed, ${db}, ${db.person}");
      await db.update(db.person).replace(person);
      print("execution completed");

    } catch (e, s) {
      print("Unable to update because of $e and stack trace is $s");
    }
  }

  deletePerson(int id) async {
    await (db.delete(db.person)..where((tbl) => tbl.id.equals(id)))
        .go()
        .then((value) => print('Successfully deleted'))
        .onError((error, stackTrace) => print('Unable to delete person data'));
  }
}
