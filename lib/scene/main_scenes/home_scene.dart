import 'package:flutter/material.dart';
import 'package:sign_up_app/scene/contact/dialpad_scene.dart';
import 'package:sign_up_app/scene/contact/near_contacts_scene.dart';

import '../contact/contacts_list.dart';

class HomeScene extends StatelessWidget {
  const HomeScene({Key? key}) : super(key: key);
  static const routeName1 = '/home_scene';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _HomeScene(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class _HomeScene extends StatefulWidget {
  const _HomeScene({Key? key}) : super(key: key);

  @override
  State<_HomeScene> createState() => _HomeSceneState();
}

class _HomeSceneState extends State<_HomeScene> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    DialPadScene(),
    NearContactScene(),
    ContactListScene(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dialpad),
            label: 'Bàn phím',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.recent_actors_rounded),
            label: 'Gần đây',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Danh bạ',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[700],
        onTap: _onItemTapped,
      ),
    );
  }
}
Widget searchBox(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          minWidth: 25,
        ),
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(
            color: Colors.grey
        ),
      ),
    ),
  );
}