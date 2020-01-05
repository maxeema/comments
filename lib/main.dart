import 'package:comments/data.dart';
import 'package:flutter/material.dart';

import 'comments_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: Scaffold(
        body: SafeArea(
          child: CommentsPage(CommentsSource.data),
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
