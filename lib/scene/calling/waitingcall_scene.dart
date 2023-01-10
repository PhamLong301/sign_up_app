import 'package:flutter/material.dart';

class WaitingCallScene extends StatelessWidget {
  const WaitingCallScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _WaitingCallScene(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class _WaitingCallScene extends StatefulWidget {
  const _WaitingCallScene({Key? key}) : super(key: key);

  @override
  _WaitingCallSceneState createState() => _WaitingCallSceneState();
}

class _WaitingCallSceneState extends State<_WaitingCallScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 90,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                'Calling.....',
                                style: TextStyle(
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
                      Expanded(
                        child: SizedBox(
                          width: 300,
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        onPressed: () {
                                          print('Mic Off');
                                        },
                                        icon: Image.network('https://img.icons8.com/material-rounded/24/null/microphone.png')

                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: IconButton(
                                          onPressed: () {
                                            print('Dialpad');
                                          },
                                          icon: Image.network('https://img.icons8.com/material-two-tone/24/null/keypad.png')
                                      )),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        onPressed: () {
                                          print('Loudspeaker');
                                        },
                                        style: IconButton.styleFrom(
                                          backgroundColor: Colors.white,
                                        ),
                                        icon: Image.network('https://img.icons8.com/material-rounded/24/null/medium-volume.png')
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        onPressed: () {
                                          print('Mic Off');
                                        },
                                        icon: Image.network('https://img.icons8.com/material-sharp/24/null/add-phone.png')

                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: IconButton(
                                          onPressed: () {
                                            print('Hold');
                                          },
                                          icon: Image.network('https://img.icons8.com/windows/32/null/pause--v1.png')
                                      )),
                                  const Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
              width: 70,
              height: 70,
              decoration: const ShapeDecoration(
                  color: Colors.red,
                  shape: CircleBorder (
                      side: BorderSide(
                          width: 10,
                          color: Colors.red
                      )
                  )
              ),
              child: const Center(
                  child: Icon(
                    Icons.call_end,
                    color: Colors.white,
                  )
              )
          )
        ],
      ),
    );
  }
}
