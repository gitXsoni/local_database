import 'package:database_class/models/app_db.dart';
import 'package:database_class/repository/demo_repository.dart';
// import 'package:database_class/screens/home_screen.dart';
import 'package:database_class/view_models/person_view_model.dart';
import 'package:database_class/widgets/custom_text_field.dart';
import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonForm extends StatefulWidget {
  final PersonData? personData;
  const PersonForm({super.key, this.personData});

  @override
  State<PersonForm> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _collegeController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.personData != null) {
      _nameController.text = widget.personData!.name;
      _addressController.text = widget.personData!.address!;
      _phoneController.text = widget.personData!.phoneNumber!.toString();
      _collegeController.text = widget.personData!.college;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => PersonData()));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Personal Data",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 177, 182, 192)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: _nameController,
                            labelText: "Name",
                          ),
                          CustomTextField(
                            controller: _addressController,
                            labelText: "Address",
                          ),
                          CustomTextField(
                            controller: _phoneController,
                            labelText: "Phone",
                          ),
                          CustomTextField(
                            controller: _collegeController,
                            labelText: "College Name",
                          ),
                          // TextFormField(
                          //   decoration: InputDecoration(
                          //       enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(20)),
                          //       labelText: "William John Malik"),
                          // ),
                          // TextFormField(
                          //   decoration: InputDecoration(
                          //       enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(20)),
                          //       labelText: "William John Malik"),
                          // ),
                          // TextFormField(
                          //   decoration: InputDecoration(
                          //       enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(20)),
                          //       labelText: "William John Malik"),
                          // ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            PersonCompanion person = PersonCompanion(
                                name: d.Value(_nameController.text),
                                address: d.Value(_addressController.text),
                                phoneNumber:
                                    d.Value(int.parse(_phoneController.text)),
                                college: d.Value(_collegeController.text),
                                isPassed: d.Value(true));

                             widget.personData == null
                                ? await PersonDataRepo().addPerson(person)
                                : await PersonDataRepo().updatePerson(person);
                            await Provider.of<PersonViewModel>(context,
                                    listen: false)
                                .fetchAllPerson();
                            Navigator.pop(
                              context,
                            );

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => PersonData()));
                          },
                          child: Text(
                              widget.personData == null ? "Save" : "Update"))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
