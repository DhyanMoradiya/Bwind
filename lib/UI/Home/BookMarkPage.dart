import 'package:flutter/material.dart';

class BookMarkPage extends StatefulWidget{
  BookMarkPage({super.key});

  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Bookark page"));
  }
}