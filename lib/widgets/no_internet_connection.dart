import 'package:flutter/material.dart';

class InternetNotAvailable extends StatelessWidget {
  const InternetNotAvailable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width,
      alignment: FractionalOffset.bottomCenter,
      color: const Color(0xffdc143c),
      child:const Center(
        child:  Text(
          'No Internet Connection!!!',
          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
}