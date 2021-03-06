import 'package:flutter/material.dart';
import 'package:greatcom/directory_page.dart';
import 'package:greatcom/news_page.dart';
import 'package:greatcom/profile_page.dart';
import 'package:greatcom/text_with_style.dart';
import 'admin_page.dart';
import 'forum_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  int isAdmin = 0;


  static  final List<Widget> _widgetOptions = <Widget>[
    // TextWithStyle(data: 'Index 0: Home', weight: FontWeight.bold, color: Colors.teal, size: 30,),
    const NewsPage(),
    // TextWithStyle(data: 'Index 1: Annuaire', weight: FontWeight.bold, color: Colors.teal, size: 30,),
    const DirectoryPage(),
    // TextWithStyle(data: 'Index 2: Entraide', weight: FontWeight.bold, color: Colors.teal, size: 30,),
    const ForumPage(),
    TextWithStyle(data: 'Index 3: Messagerie', weight: FontWeight.bold, color: Colors.teal, size: 30,),
    const ProfilePage(),
    const AdminPage()
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
    final double height = size.height;
    final double width = size.width;

    // String titre = title();
    return Scaffold(
      appBar: AppBar(
        title: Text(title()),
          // (titre == "Actualités") ? Icon(Icons.plus_one) : '';
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: bottomBar(),

    );
  }



  BottomNavigationBar bottomBar() {
    Color? selectedColor = Colors.amber[800];
    return BottomNavigationBar(
      backgroundColor: Colors.teal,
      items:  [
        BottomNavigationBarItem(icon: Image.asset('images/lettre-n-majuscule.jpg', height: 27, color: (_selectedIndex == 0) ? selectedColor : Colors.white,), label: 'Actualité', backgroundColor: Colors.teal),
        const BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: 'Annuaire', backgroundColor: Colors.teal),
        const BottomNavigationBarItem(icon: Icon(Icons.handshake), label: 'Forum', backgroundColor: Colors.teal),
        const BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Messagerie', backgroundColor: Colors.teal,),
        const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile', backgroundColor: Colors.teal),
        const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Administrateur', backgroundColor: Colors.teal)
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: selectedColor,
      onTap: _onItemTapped,
    );
  }


  String title() {
    String t = "";
    if(_selectedIndex == 0) {
      t = "Actualités";
    } else if(_selectedIndex == 1) {
      t = "Annuaire";
    }
    else if(_selectedIndex == 2) {
      t = "Forum";
    }
    else if(_selectedIndex == 3) {
      t = "Messagerie";
    }
    else if(_selectedIndex == 5){
      t = "Administration";
    }
    else {
      t = "Profile";
    }
    return t;
  }


}