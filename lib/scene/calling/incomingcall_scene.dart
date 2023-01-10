import 'package:flutter/material.dart';

class IncomingCallScene extends StatelessWidget {
  const IncomingCallScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _ImcomingCallScene(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _ImcomingCallScene extends StatefulWidget {
  const _ImcomingCallScene({Key? key}) : super(key: key);

  @override
  _ImcomingCallSceneState createState() => _ImcomingCallSceneState();
}

class _ImcomingCallSceneState extends State<_ImcomingCallScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 90,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                    child: SizedBox(
                        width: 150,
                        height: 150,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuBJT5wHCiGz1_ahHSkMCToJutWRc7_GtpEklerkC0wtu0zj9j0mRsCuUVCWRx4gtCQkc&usqp=CAU'),
                        )
                    )),
                Expanded(
                    child: Column(
                      children: const [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          '0000-000-000',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 420,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.call_end,
                                color: Colors.red,
                                size: 35,
                              ),
                              splashColor: Colors.red,
                              splashRadius: 50,
                            ),
                            Text('Decline',
                              style: TextStyle(
                                  color: Colors.red
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.call,
                                color: Colors.green,
                                size: 35,
                              ),
                              splashColor: Colors.green,
                              splashRadius: 50,
                            ),
                            Text('Accept',
                              style: TextStyle(
                                  color: Colors.green
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
