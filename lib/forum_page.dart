import 'package:flutter/material.dart';


class ForumPage extends StatefulWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  ForumPageState createState() =>ForumPageState();
}

class ForumPageState extends State<ForumPage> {

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
            // ListViewHome(),
            myTitle('Emploi'),
            myTitle('Stage'),
            myTitle('Juridique'),
            myTitle('Divers'),
          ],
        ),
      ),
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

class ListViewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Text('List 1'),
        Text('List 2'),
        Text('List 3'),
      ],
    );
  }
}