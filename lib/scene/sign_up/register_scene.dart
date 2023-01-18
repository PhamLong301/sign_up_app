import 'package:flutter/material.dart';
import '../../model/register_model.dart';
import '../main_scenes/login_scene.dart';

class RegisterScene extends StatelessWidget {
  static const routeName3 = '/register_scene';
  static const routeName = '/home_scene';
  const RegisterScene({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Register(),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State {
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      controller: emailcontroller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email Here",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    final name = TextField(
      obscureText: false,
      controller: namecontroller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name Here",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    final mobile = TextField(
      obscureText: false,
      controller: mobilecontroller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Mobile Here",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      controller: passcontroller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password Here",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    final submitButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
        onPressed: () {
          User user = User();
          user.email = "Email:${emailcontroller.text}";
          user.name = "Name:${namecontroller.text}";
          user.mobile = "Mobile:${mobilecontroller.text}";
          user.pass = "Pass:${passcontroller.text}";
          showAlertDialog(context, user);
        },
        child: const Text(
          "Submit",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    final goBack = OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScene()),
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
    );
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Sign up Form",
                    style: TextStyle(color: Colors.blue)),
                const SizedBox(height: 45.0),
                emailField,
                const SizedBox(height: 25.0),
                name,
                const SizedBox(height: 25.0),
                mobile,
                const SizedBox(height: 25.0),
                passwordField,
                const SizedBox(
                  height: 35.0,
                ),
                submitButon,
                const SizedBox(
                  height: 15.0,
                ),
                goBack,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, User user) {
  Widget gotIt = ElevatedButton(
    child: const Text("Got It"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('alert');
    },
  );
  AlertDialog alert = AlertDialog(
    title: const Text("My title"),
    content: Text("${user.email}\n${user.name}\n${user.mobile}\n${user.pass}"),
    actions: [
      gotIt,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
//model class
