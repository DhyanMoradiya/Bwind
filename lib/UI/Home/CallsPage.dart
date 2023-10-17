import 'package:flutter/material.dart';

class CallsPage extends StatefulWidget{
  CallsPage({super.key});

  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
 @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Calles"),
    );
  }
}