import 'package:flutter/material.dart';

import 'CouseList.dart';

class CompletedCourse extends StatefulWidget {
  CompletedCourse({super.key});

  State<CompletedCourse> createState() => _CompletedCourseState();
}

class _CompletedCourseState extends State<CompletedCourse> {
  List<Map<String, dynamic>> completedCourseList = [
    {
      "image": "assets/images/learnUIUXDesign.png",
      "course_name": "3D Blender and UI/UX",
      "duration": "2 hrs 30 mins",
      "conpleted": 100
    },
    {
      "image": "assets/images/CRMManagement.png",
      "course_name": "CRM Management",
      "duration": "1 hrs 52 mins",
      "conpleted": 100
    },
    {
      "image": "assets/images/flutterMobileApp.png",
      "course_name": "Flutter Mobile Application",
      "duration": "3 hrs 18 mins",
      "conpleted": 100
    },
    // {
    //   "image": "assets/images/course_image.png",
    //   "course_name": "Intro to UI/UX Design",
    //   "duration": "2 hrs 30 mins",
    //   "conpleted": 100
    // },
    // {
    //   "image": "assets/images/course_image.png",
    //   "course_name": "Intro to UI/UX Design",
    //   "duration": "2 hrs 30 mins",
    //   "conpleted": 100
    // },
    // {
    //   "image": "assets/images/course_image.png",
    //   "course_name": "Intro to UI/UX Design",
    //   "duration": "2 hrs 30 mins",
    //   "conpleted": 100
    // },
    // {
    //   "image": "assets/images/course_image.png",
    //   "course_name": "Intro to UI/UX Design",
    //   "duration": "2 hrs 30 mins",
    //   "conpleted": 100
    // },
    // {
    //   "image": "assets/images/course_image.png",
    //   "course_name": "Intro to UI/UX Design",
    //   "duration": "2 hrs 30 mins",
    //   "conpleted": 100
    // },
    // {
    //   "image": "assets/images/course_image.png",
    //   "course_name": "Intro to UI/UX Design",
    //   "duration": "2 hrs 30 mins",
    //   "conpleted": 100
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return CourseList(courselist: completedCourseList);
  }
}
