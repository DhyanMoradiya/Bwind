import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CertificationPage extends StatefulWidget{
  Map<String, dynamic> course;
  CertificationPage({super.key, required this.course});

  State<CertificationPage> createState() => _CertificationPageState(this.course);
}

class _CertificationPageState extends State<CertificationPage>{
  Map<String, dynamic> course;
  _CertificationPageState(this.course);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Certification"),
    );
  }

}