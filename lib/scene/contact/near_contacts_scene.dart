import 'package:flutter/material.dart';
import 'package:sign_up_app/widgets/near_contacts_widget.dart';

class NearContactScene extends StatelessWidget {
  const NearContactScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _NearContactScene(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _NearContactScene extends StatefulWidget {
  const _NearContactScene({Key? key}) : super(key: key);

  @override
  _NearContactSceneState createState() => _NearContactSceneState();
}

class _NearContactSceneState extends State<_NearContactScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            alignment: Alignment.center,
            child: const Text('Contacts',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30),
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:const [
                IconButton(onPressed: null,
                    icon: Icon(Icons.category_rounded,
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
          Expanded(child: ListView(
            children: const [
              NearContactsWidget(),
            ],
          ))
        ],
      ),
    );
  }
}

