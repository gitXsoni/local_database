import 'package:database_class/repository/demo_repository.dart';
import 'package:flutter/material.dart';

import '../models/app_db.dart';

class PersonViewModel extends ChangeNotifier {
  PersonViewModel() {
    fetchAllPerson();
  }
  PersonDataRepo personDataRepo = PersonDataRepo();
  List<PersonData> _personList = [];
  List<PersonData> get personList => _personList;

  fetchAllPerson() async {
    _personList = await personDataRepo.fetchAllPersons();

    print("Fetched Successfully");
    print(_personList);
    notifyListeners();
  }

  // refreshPersonData() async {
  //   _personList = await personDataRepo.fetchAllPersons();

  //   notifyListeners();
  // }
}
