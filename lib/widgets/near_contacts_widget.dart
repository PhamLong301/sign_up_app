import 'package:flutter/material.dart';

class NearContactsWidget extends StatelessWidget {
  const NearContactsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: Column(
        children: [
          const Text('dd/MM/yy',
            textAlign: TextAlign.left,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
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
              trailing: Text('00:00'),
            ),
          )
        ],
      ),
    );
  }
}
