import 'package:database_class/models/app_db.dart';
import 'package:database_class/repository/demo_repository.dart';
import 'package:database_class/screens/person_screen.dart';
import 'package:database_class/view_models/person_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Personcard extends StatelessWidget {
  final PersonData personData;
  const Personcard({super.key, required this.personData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Are you sure to delete this person"),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            await PersonDataRepo().deletePerson(personData.id);
                            await Provider.of<PersonViewModel>(context,
                                    listen: false)
                                .fetchAllPerson();

                            Navigator.pop(context);
                          },
                          child: Text("Yes")),
                          SizedBox(width: 10,),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("No")),
                    ],
                  ),
                );
              });
        },
        onDoubleTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => PersonForm(
                        personData: personData,
                      )));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 177, 182, 192)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Person's Name: ${personData.name} ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Person's address: ${personData.address}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Person's phone number: ${personData.phoneNumber}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
