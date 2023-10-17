import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  String? docId;
  String? image;
  String? courseName;
  String? category;
  double? price;
  double? originalPrice;
  double? ratting;
  int? enrolledStudent;
  String? mentor;
  String? about;

  Course(
      {this.docId,
      this.image,
      this.courseName,
      this.category,
      this.price,
      this.ratting,
      this.about,
      this.enrolledStudent,
      this.mentor,
      this.originalPrice});

  factory Course.fromJson(String docId, Map<String, dynamic> json) {
    return Course(
        docId: docId,
        image: json['image'],
        courseName: json['courseName'],
        category: json['category'],
        price: json['price'].toDouble(),
        ratting: json['ratting'].toDouble(),
        about: json['about'],
        enrolledStudent: json['enrolledStudent'],
        mentor: json['mentor'],
    originalPrice: json['originalPrice'].toDouble()
    );
  }

  static Future<List<Course>> getCourse() async {
    List<Course>? courseList;
    await FirebaseFirestore.instance.collection('course').get().then((value) {
      courseList = List.generate(
          value.docs.length,
          (index) =>
              Course.fromJson(value.docs[index].id, value.docs[index].data()));
    });
    return courseList!;
  }
}
