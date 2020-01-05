import 'package:flutter/material.dart';

class User {
  final String id, name, avatar;
  User({@required this.id, @required this.name, @required this.avatar});
}

class Comment {
  final User user;
  final String id, date, message;
  final List<Comment> replies;
  Comment({@required this.id, @required this.user, @required this.date, @required this.message, this.replies});
  //
  String toString() => message;
}
