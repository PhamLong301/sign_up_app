import 'package:flutter/material.dart';

class SuggestContact extends StatelessWidget {
  const SuggestContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children:  [
          SizedBox(
            width: 50,
            height: 40,
            child: Image.network('http://cdn.onlinewebfonts.com/svg/img_162044.png'),
          ),
          SizedBox(
            width: 120,
            height: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Expanded(
                    flex: 1,
                    child: Text('Name',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                ),
                Expanded(
                  flex: 1,
                    child: Text('Phone Number',
                    style: TextStyle(
                      fontSize: 15,
                    ),),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
