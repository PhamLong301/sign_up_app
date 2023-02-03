// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sign_up_app/model/login_model.dart';
import 'dart:convert';
import 'package:sign_up_app/scene/forgot/forgot_scene.dart';
import 'package:sign_up_app/scene/sign_up/register_scene.dart';
import '../../widgets/no_internet_connection.dart';
import 'home_scene.dart';
import 'package:provider/provider.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LoginScene extends StatelessWidget {
  const LoginScene({Key? key}) : super(key: key);
  static const routeName = '/home_scene';
  static const routeName2 = '/forgot_scene';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _LoginScene(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _LoginScene extends StatefulWidget {
  @override
  _LoginSceneState createState() => _LoginSceneState();
}

class _LoginSceneState extends State<_LoginScene> {
  bool visible = false;
  final usertext = TextEditingController();
  final passwordtext = TextEditingController();
  var client = HttpClient();
  signIn(String email, password) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Basic PEJhc2ljIEF1dGggVXNlcm5hbWU+OjxCYXNpYyBBdXRoIFBhc3N3b3JkPg=='
      };
      var request = http.Request(
          'POST', Uri.parse('https://graph.vntel.vn/api/auth/login/'));
      request.body = json.encode({"email": email, "password": password});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        if (usertext.text == email && passwordtext.text == password) {
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScene()),
          );
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Đăng nhập thành công!'),
            duration: Duration(seconds: 3),
          ));
        }
        print(await response.stream.bytesToString());
        return Login.fromJson(json.decode(request.body));
      } else {
        print(response.reasonPhrase);
        if (usertext.text.isEmpty || passwordtext.text.isEmpty) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Bạn chưa nhập tài khoản'),
            duration: Duration(seconds: 3),
          ));
        } else {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Kiểm tra lại tài khoản và mật khẩu của bạn!'),
            duration: Duration(seconds: 3),
          ));
          throw Exception('Wrong Account! Failed to load post');
        }
      }
    } catch (excute) {
      print("Error: $excute");
    }
  }

  @override
  Widget build(BuildContext context) {
    //logo
    // ignore: prefer_const_constructors
    final logo = Hero(
      tag: 'hero',
      child: const CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image(image: AssetImage('assets/user_account.png')),
        // child: Image.network(
        //     'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/768px-Microsoft_Account.svg.png'),
      ),
    );
    //username
    final username = TextField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: '',
      controller: usertext,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email !',
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          )),
    );
    //password
    final password = TextField(
      autofocus: false,
      //initialValue: '',
      obscureText: true,
      controller: passwordtext,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password !',
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          )),
    );
    //login button
    final loginButton = TextButton(
      onPressed: () {
        signIn(usertext.text, passwordtext.text);
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue[700],
        minimumSize: const Size(50, 35),
        elevation: 10,
      ),
      child: const Text(
        'Sign In',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
    final forgotLabel = OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForgotScene()),
        );
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(
            color: Colors.white,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Text('Forgot password?')],
      ),
    );
    final signupLable = OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterScene()),
        );
      },
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(
            color: Colors.white,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Text('Sign Up')],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              children: [
                // const SizedBox(height: 180.0),
                // logo,
                // const SizedBox(height: 30.0),
                // username,
                // const SizedBox(height: 5.0),
                // password,
                // const SizedBox(height: 5.0),
                // loginButton,
                // forgotLabel,
                // signupLable,
                // const SizedBox(height: 205.0),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: logo,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  child: Column(
                    children: [
                      Expanded(flex: 1, child: username),
                      Expanded(flex: 1, child: password),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0),
                loginButton,
                // forgotLabel,
                // signupLable,
              ],
            ),
            const SizedBox(
              height: 278,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Visibility(
                visible: Provider.of<InternetConnectionStatus>(context) ==
                    InternetConnectionStatus.disconnected,
                child: const InternetNotAvailable(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
