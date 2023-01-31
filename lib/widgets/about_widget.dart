// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  GradientText(
                    'This app is under developing!!!!!',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                    colors: [
                      Colors.blue,
                      Colors.red,
                      Colors.teal,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
