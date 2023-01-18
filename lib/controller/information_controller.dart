// ignore_for_file: avoid_print, unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/get_information.dart';
import 'package:http/http.dart' as http;


class InformationController with ChangeNotifier {
  final List<GetInformationModel?> _allInformation = [];

  List<GetInformationModel?> get allInformation => [..._allInformation];



  Future<void> getData() async {
    try {
      // var headers = {
      //   'Authorization': 'Basic PEJhc2ljIEF1dGggVXNlcm5hbWU+OjxCYXNpYyBBdXRoIFBhc3N3b3JkPg==',
      //   'Content-Type': 'application/json'
      // };
      // var request = http.Request('GET', Uri.parse('https://graph.vntel.vn/api/auth/users/'));
      // request.body = json.encode({
      //   "email": "hienhm@vntel.vn",
      //   "password": "Namdq@321"
      // });
      // request.headers.addAll(headers);
      //
      // http.StreamedResponse response = await request.send();
      //
      // if (response.statusCode == 200) {
      //   print(await response.stream.bytesToString());
      // }
      // else {
      //   print(response.reasonPhrase);
      // }
      var request = http.Request('GET', Uri.parse('https://jsonplaceholder.typicode.com/users'));


      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }



  GetInformationModel? findById(String? id) {
    // ignore: unrelated_type_equality_checks
    return _allInformation.firstWhere((prod) => prod?.id == id);
  }
}