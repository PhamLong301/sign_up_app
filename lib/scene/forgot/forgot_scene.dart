import 'package:flutter/material.dart';
import 'package:sign_up_app/scene/main_scenes/login_scene.dart';

class ForgotScene extends StatelessWidget {
  static const routeName2 = '/forgot_scene';
  static const routeName = '/home_scene';

  const ForgotScene({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _ForgotScene(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _ForgotScene extends StatefulWidget {
  const _ForgotScene({Key? key}) : super(key: key);

  @override
  _ForgotSceneState createState() => _ForgotSceneState();
}

class _ForgotSceneState extends State<_ForgotScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
              ),
              const SizedBox(
                width: 90,
                height: 90,
                // ignore: prefer_const_constructors
                child: Image(
                    // ignore: prefer_const_constructors
                    image: AssetImage(
                  'assets/Lock-PNG-Download-Image.png',
                )),
                // child: Image.network(
                //   'https://www.pngall.com/wp-content/uploads/10/Lock-PNG-Download-Image.png',
                //   width: 50,
                //   height: 50,
                // ),
              ),
              const Text(
                'Bạn quên mất mật khẩu của mình ?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                    labelText: 'Enter your email !!!',
                    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(height: 5.0),
              Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 30,
                    child: OutlinedButton(
                      onPressed: null,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.grey,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Reset password',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 30,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScene()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.white,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Go back',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
