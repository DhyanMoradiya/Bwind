import 'package:bwind/UI/Home/CouseList.dart';
import 'package:bwind/UI/Home/MyCoursePage.dart';
import 'package:flutter/material.dart';

class OngoingCourse extends StatefulWidget {
  OngoingCourse({super.key});

  State<OngoingCourse> createState() => _OngoingCourseState();
}

class _OngoingCourseState extends State<OngoingCourse> {
  List<Map<String, dynamic>> onGoingCourseList = [
    {
      "image": "assets/images/introToUIUXDesign.png",
      "course_name": "Intro to UI/UX Design",
      "duration": "2 hrs 4 mins",
      "conpleted": 80,
      "lessons": {}
    },
    {
      "image": "assets/images/3dDesignIllustration.png",
      "course_name": "3D Blender and UI/UX",
      "duration": "5 hrs 2 mins",
      "conpleted": 20
    },
    {
      "image": "assets/images/learnUXUserPersonal.png",
      "course_name": "Learn UX User Personal",
      "duration": "3 hrs 56 mins",
      "conpleted": 40
    },
    // {
    //   "image": "assets/images/course_image.png",
    //   "course_name": "Intro to UI/UX Design",
    //   "duration": "2 hrs 30 mins",
    //   "conpleted": 60
    // },
    // {
    //   "image": "assets/images/course_image.png",
    //   "course_name": "Intro to UI/UX Design",
    //   "duration": "2 hrs 30 mins",
    //   "conpleted": 80
    // },
    // {
    //   "image": "assets/images/course_image.png",
    //   "course_name": "Intro to UI/UX Design",
    //   "duration": "2 hrs 30 mins",
    //   "conpleted": 50
    // },
    // {
    //   "image": "assets/images/course_image.png",
    //   "course_name": "Intro to UI/UX Design",
    //   "duration": "2 hrs 30 mins",
    //   "conpleted": 10
    // },
    // {
    //   "image": "assets/images/course_image.png",
    //   "course_name": "Intro to UI/UX Design",
    //   "duration": "2 hrs 30 mins",
    //   "conpleted": 90
    // },
    // {
    //   "image": "assets/images/course_image.png",
    //   "course_name": "Intro to UI/UX Design",
    //   "duration": "2 hrs 30 mins",
    //   "conpleted": 80
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return CourseList(courselist: onGoingCourseList);
  }
}
