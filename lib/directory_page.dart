import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DirectoryPage extends StatefulWidget {
  const DirectoryPage({Key? key}) : super(key: key);

  @override
  DirectoryPageState createState() =>DirectoryPageState();
}

class DirectoryPageState extends State<DirectoryPage> {

  ImagePicker picker = new ImagePicker();
  File? imageFile;

  SearchField() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5.0),
            hintText: 'Rechercher par nom de famille'
        ),
        onChanged: (string) {

        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width /4;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(8),

              ),
              SearchField(),
              // Card(
              //   child: new ListTile(
              //     leading: new Icon(Icons.search),
              //     title: new TextField(
              //         controller: controller,
              //         decoration: new InputDecoration(
              //             hintText: 'Search', border: InputBorder.none),
              //         onChanged: (value) {
              //           setState(() {
              //             _searchResult = value;
              //             usersFiltered = users.where((user) => user.name.contains(_searchResult) || user.role.contains(_searchResult)).toList();
              //           });
              //         }),
              //     trailing: new IconButton(
              //       icon: new Icon(Icons.cancel),
              //       onPressed: () {
              //         setState(() {
              //           controller.clear();
              //           _searchResult = '';
              //           usersFiltered = users;
              //         });
              //       },
              //     ),
              //   ),
              // ),
              DataTable(
                sortAscending: true,
                sortColumnIndex: 3,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      '',
                      // style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Nom',
                      // style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Prénom',
                      // style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Promotion',
                      // style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        CircleAvatar(
                          backgroundImage: AssetImage("https://codabee.com/wp-content/uploads/2018/03/cropped-Artboard-2.png")
                        ),
                      ),
                      DataCell(Text('Lupin')),
                      DataCell(Text('Meyer')),
                      DataCell(Text('2019/2020')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        CircleAvatar(
                            backgroundImage: AssetImage("https://codabee.com/wp-content/uploads/2018/03/cropped-Artboard-2.png")
                        ),
                      ),
                      DataCell(Text('oooo')),
                      DataCell(Text('Meyer')),
                      DataCell(Text('2019/2020')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        CircleAvatar(
                            backgroundImage: AssetImage("https://codabee.com/wp-content/uploads/2018/03/cropped-Artboard-2.png")
                        ),
                      ),
                      DataCell(Text('Lupin')),
                      DataCell(Text('Meyer')),
                      DataCell(Text('2019/2020')),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }

  TextField myTextField({required TextEditingController controller,required String hint, isSecret, TextInputType type: TextInputType.text}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
      ),
      keyboardType: type,
      obscureText: isSecret,
    );
  }



  Text myTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
          fontSize: 18
      ),
    );
  }

  Divider separ() {
    return const Divider(color: Colors.teal, thickness: 2,);
  }


}