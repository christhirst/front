import 'dart:html';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  Response response;

  bool get isAuth {
    return token != null;
  }

  String get userId {
    return _userId;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Dio dio = new Dio();

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url = 'http://localhost:8888/$urlSegment';
    try {
      final response = await dio.post(url, data: {
        'email': email,
        'password': password,
        'returnSecureToken': true
      });
      print(response.statusCode);

      if (response.statusCode != 200) {
        throw HttpException(response.statusMessage);
      }

      _token = response.data['idToken'];
      _userId = response.data['localId'];
      _expiryDate = DateTime.now().add(
        Duration(seconds: int.parse(response.data['expiresIn'])),
      );
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, "signup");
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, "login");
  }
}
