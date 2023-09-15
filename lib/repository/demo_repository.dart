import 'package:database_class/models/app_db.dart';

class PersonDataRepo {
  MyDb db = MyDb();

  addPerson(PersonCompanion person) async {
    await db
        .into(db.person)
        .insert(person)
        .then((value) => print('Successfully added'))
        .onError((error, stackTrace) => print('Unable to add person data'));
  }
  updatePerson(PersonCompanion person) async {
    await db.update(db.person).replace(person)
        .then((value) => print('Successfully updated'))
        .onError((error, stackTrace) => print('Unable to update person data'));
  }
  deletePerson(int id) async {
    await (db.delete(db.person)..where((tbl) => tbl.id.equals(id))).go()
        .then((value) => print('Successfully deleted'))
        .onError((error, stackTrace) => print('Unable to delete person data'));
  }
}
