import 'package:flutter/material.dart';
import '../../widgets/contacts_widget.dart';

class ContactListScene extends StatelessWidget {
  const ContactListScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _ContactListScene(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _ContactListScene extends StatefulWidget {
  const _ContactListScene({Key? key}) : super(key: key);

  @override
  _ContactListSceneState createState() => _ContactListSceneState();
}

class _ContactListSceneState extends State<_ContactListScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 300,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Contacts',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text('00 Contacts have munber',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15),
                    ),
                  ],
                )
              ),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:const [
                    IconButton(onPressed: null,
                      icon: Icon(Icons.add,
                        color: Colors.black,),
                    ),
                    IconButton(onPressed: null,
                      icon: Icon(Icons.search,
                        color: Colors.black,),
                    ),
                    IconButton(onPressed: null,
                      icon: Icon(Icons.more_vert,
                        color: Colors.black,),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: const [
                    ContactWidget(),
                    ContactWidget(),
                    ContactWidget(),
                    ContactWidget(),
                    ContactWidget(),
                    ContactWidget(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}



// Widget searchBox(){
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: const TextField(
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.all(0),
//         prefixIcon: Icon(
//           Icons.search,
//           color: Colors.black,
//           size: 20,
//         ),
//         prefixIconConstraints: BoxConstraints(
//           maxHeight: 20,
//           minWidth: 25,
//         ),
//         border: InputBorder.none,
//         hintText: 'Search',
//         hintStyle: TextStyle(
//             color: Colors.grey
//         ),
//       ),
//     ),
//   );
// }



