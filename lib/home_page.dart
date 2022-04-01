import 'package:flutter/material.dart';
import 'package:greatcom/profile_page.dart';
import 'package:greatcom/text_with_style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();

}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.teal);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Annuaire',
      style: optionStyle,
    ),
    Text(
      'Index 2: Entraide',
      style: optionStyle,
    ),
    Text(
      'Index 3: Messagerie',
      style: optionStyle,
    ),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(title()),
        automaticallyImplyLeading: false,
      ),
      body: Center (
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 10,
        backgroundColor: Colors.teal,
          items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Image.asset('images/lettre-n-majuscule.jpg', height: height /7, width: width/5,), label: 'Actualité', backgroundColor: Colors.teal),
            BottomNavigationBarItem(icon: Image.asset('images/book.jpg',height: height /7, width: width/5,), label: 'Annuaire', backgroundColor: Colors.teal),
            BottomNavigationBarItem(icon: Image.asset('images/handShake.png',height: height /7, width: width/5,), label: 'Entraide', backgroundColor: Colors.teal),
            BottomNavigationBarItem(icon: Image.asset('images/Mail.jpg',height: height /7, width: width/5,), label: 'Messagerie', backgroundColor: Colors.teal),
            BottomNavigationBarItem(icon: Image.asset('images/user.png',height: height / 7, width: width/5,), label: 'Profile', backgroundColor: Colors.teal)
          ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      )


          /*  buildNavBarItem(pathImage: 'images/lettre-n-majuscule.jpg', width: width, height: height, title: 'Actualité'),
          buildNavBarItem(pathImage: 'images/book.jpg', width: width, height: height, title: ""),
          buildNavBarItem(pathImage: 'images/handShake.png', width: width, height: height, title: ""),
          buildNavBarItem(pathImage: 'images/Mail.jpg', width: width, height: height, title: ""),
          buildNavBarItem(pathImage: 'images/user.png', width: width, height: height, title: "")*/
    );
  }



/*
  Container buildNavBarItem( {required String pathImage, required double width, required height, required String title}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(),
          Container(
            height: height/ 6.5,
            width: width/5,
            decoration: const BoxDecoration(color: Colors.teal),
            child:
            Image.asset(pathImage),
          ),
          TextWithStyle(data: title)
        ],
      ),
    );
  }
*/

String title() {
  String t = "";
  if(_selectedIndex == 0) {
    t = "Home page";
  } else if(_selectedIndex == 1) {
    t = "Annuaire";
  }
  else if(_selectedIndex == 2) {
    t = "Entraide";
  }
  else if(_selectedIndex == 3) {
    t = "Messagerie";
  }
  else {
    t = "Profile";
  }
  return t;
}


}