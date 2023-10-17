import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CertificationPage.dart';
import 'LessonsPage.dart';


class CoursePage extends StatefulWidget{
  Map<String, dynamic> course;
  CoursePage({super.key, required this.course});

  State<CoursePage> createState() => _CoursePageState(this.course);
}

class _CoursePageState extends State<CoursePage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  Map<String, dynamic> course;

  _CoursePageState(this.course);

  @override
  void initState() {
    _tabController = TabController(length: 2 , vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = <Tab>[
      Tab(
        text: "Lessons",
      ),
      Tab(
        text: "Certification",
      )
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:50 ,bottom:0 ,left:16,right:16 ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(CupertinoIcons.back)
                ),
                Text(
                  course['course_name'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: TabBar(
                tabs: tabs,
                controller: _tabController,
                unselectedLabelColor: Color(0xFFD1D1D1),
                labelColor: Color(0xFF6F30C0),
                indicatorColor:Color(0xFF6F30C0),
              ),
            ),
            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: [
                    LessonsPage(course: course,),
                    CertificationPage(course: course,)
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}