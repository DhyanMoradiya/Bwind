import 'package:firebase_auth/firebase_auth.dart';

class AuthResponse{
  User? user;
  String msg;
  bool code;

  AuthResponse({this.user, required this.msg, required this.code});
}