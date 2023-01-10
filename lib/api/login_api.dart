import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class LoginApi extends ChangeNotifier{
  postData(data) async {
    var fullUrl = Uri.parse('https://graph.vntel.vn/api/auth/login/');
    return await http.post(
      fullUrl,
      body: data,
    );
  }
}