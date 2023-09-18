import 'package:database_class/screens/person_screen.dart';
import 'package:database_class/view_models/person_view_model.dart';
import 'package:database_class/widgets/person_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _PersonDataState();
}

class _PersonDataState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Home Page"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => PersonForm()));
            },
            child: Icon(Icons.add),
          ),
          body: Consumer<PersonViewModel>(
            builder: (_, personViewModel, __) {
              // personViewModel.fetchAllPerson();

              return Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: TextField(
                        onChanged: (value) {
                          if (value != '') {
                            personViewModel.searchPerson(value);
                          } else {
                            personViewModel.fetchAllPerson();
                          }
                        },
                      )),
                  Expanded(
                    flex: 8,
                    child: ListView.builder(
                        itemCount: personViewModel.personList.length,
                        itemBuilder: (context, index) => Personcard(
                              personData: personViewModel.personList[index],
                              // phoneNumber:
                              //     personViewModel.personList[index].phoneNumber,
                              // personName: personViewModel.personList[index].name,
                              // personAddress:
                              //     personViewModel.personList[index].address,
                            )),
                  ),
                ],
              );
            },
          )
          // body: Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          //       child: Container(
          //         width: MediaQuery.of(context).size.width,
          //         height: MediaQuery.of(context).size.height * 0.7,
          //         child: Column(
          //           children: [
          //             Row(
          //               children: [
          //                 MaterialButton(
          //                   onPressed: () {
          //                     Navigator.push(
          //                         context,
          //                         MaterialPageRoute(
          //                             builder: (context) => PersonScreen()));
          //                   },
          //                   child: Icon(
          //                     Icons.arrow_back,
          //                     size: 25,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 40,
          //                 ),
          //                 Text(
          //                   "Person Data",
          //                   style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(
          //               height: 20,
          //             ),

          //             SizedBox(
          //               height: 20,
          //             ),
          //           ],
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          ),
    );
  }
}
