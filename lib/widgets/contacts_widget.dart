// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:sign_up_app/model/get_information.dart';


class ContactWidget extends StatefulWidget {
  const ContactWidget({Key? key}) : super(key: key);

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 3),
      color: Colors.grey[300],
      child: const ListTile(
        leading: SizedBox(
          height: 40,
          width: 40,
          child: Icon(
            Icons.account_circle,
          ),
        ),
        title: Text('Contacts',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        ),
        subtitle: Text(
          'Phone Number'
        ),
      ),
    );
  }
}
