// ignore_for_file: non_constant_identifier_names

import 'dart:convert' ;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sign_up_app/model/login_model.dart';

class LoginController extends ChangeNotifier{

  String? email = "";
  String? password = "";

  Future<Login> UserLogin(String email, String password) async {
    final response = await http.post(Uri.https('https://graph.vntel.vn/api/auth/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Basic PEJhc2ljIEF1dGggVXNlcm5hbWU+OjxCYXNpYyBBdXRoIFBhc3N3b3JkPg=='
      },
      body: jsonEncode(<String, String>{
          'email': email,
          'password': password
        }),
    );

    if (response.statusCode == 201) {
      return Login.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }


}



