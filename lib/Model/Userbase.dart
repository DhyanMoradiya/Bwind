import 'package:bwind/Model/AuthResponse.dart';
import 'package:bwind/Model/FireAuth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'PaymentCard.dart';

class Userbase {
  String? uid;
  String? image;
  String? name;
  String? email;
  String? password;
  DateTime? createTime;
  DateTime? DOB;
  String? gender;
  bool? isMentor;
  String? about;
  PaymentCard? card;
  Userbase(
      {this.uid,
      this.image,
      this.name,
      this.email,
      this.password,
      this.createTime,
      this.DOB,
      this.gender,
      this.isMentor,
      this.about,
      this.card});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': this.uid,
      'image': this.image,
      'name': this.name,
      'email': this.email,
      'password': this.password,
      "createTime": this.createTime,
      "DOB": this.DOB,
      "gender": this.gender,
      "isMentor": this.isMentor != null ? this.isMentor : false,
      "about": this.about
    };
  }

  static Future<void> insertUser(
      Map<String, dynamic> userMap, String uid) async {
    await FirebaseFirestore.instance.collection('user').doc(uid).set(userMap);
  }

  static Future<bool> isEmailRegistered(String email) async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .where('email', isEqualTo: email)
          .get()
          .then((value) {
        print(value.docs[0].data());
        if (value.docs[0].data() == null) {
          return false;
        } else {
          return true;
        }
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<Userbase> getUserBaseByEmail(String email) async {
    try {
      var value = await FirebaseFirestore.instance
          .collection('user')
          .where('email', isEqualTo: email)
          .orderBy('createTime', descending: true)
          .get();
      var userMap = value.docs[0].data();
      return Userbase(
          name: userMap['name'],
          email: userMap['email'],
          password: userMap['password']);
    } catch (e) {
      print(e);
      return Userbase(name: "", email: "", password: "");
    }
  }

  static changePassword(Map<String, dynamic> userMap, String uid) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .update(userMap);
  }

  static Future<Userbase> getUserBaseByUid(String uid) async {
    var value = await await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .get();
    var userMap = value.data();
    return Userbase(
        name: userMap!['name'],
        email: userMap['email'],
        password: userMap['password'],
        DOB: userMap['DOB'] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                userMap!['DOB'].seconds * 1000)
            : null,
        gender: userMap['gender'] ?? null);
  }

  static Future<bool> updateUserInfo(
      Map<String, dynamic> userMap, String uid) async {
    print(userMap);
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .update(userMap);
      AuthResponse response = await FireAuth.updateDisplayName(userMap['name']);
      if (response.code) {
        await FirebaseFirestore.instance
            .collection('user')
            .doc(uid)
            .update(userMap);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<List> getBookmarksList(String uid) async {
    List bookmarksList = [];
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .get()
        .then((value) {
      bookmarksList = value.data()!['bookmarkCourse'];
    });
    return bookmarksList;
  }

  static updateBookmarksList(String uid, List bookmarkedCourse) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .update({'bookmarkCourse': bookmarkedCourse});
  }

  static Future<List<Userbase>> getMentor() async {
    List<Userbase>? mentorList;
    await FirebaseFirestore.instance
        .collection('user')
        .where('isMentor', isEqualTo: true)
        .get()
        .then((value) {
      mentorList = List.generate(
          value.docs.length,
          (index) => Userbase(
              uid: value.docs[index].id,
              image: value.docs[index]['image'],
              name: value.docs[index]['name'],
              about: value.docs[index]['about']));
    });
    return mentorList!;
  }

  static Future<Userbase?> getCourseMentor(String mentorUid) async {
    Userbase? mentor;
    await FirebaseFirestore.instance
        .collection("user")
        .doc(mentorUid)
        .get()
        .then((value) {
      mentor = Userbase(
          uid: value.id,
          image: value.data()!['image'],
          name: value.data()!['name'],
          about: value.data()!['about']);
    });
    return mentor;
  }

  static Future<CardResponse> addCard(
      String uid, Map<String, dynamic> cardMap) async {
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(uid)
          .collection("card")
          .add(cardMap);
      return CardResponse(msg: "Card entered successfully", code: true);
    } catch (e) {
      print(e);
      return CardResponse(msg: "Somthing is wrong", code: false);
    }
  }

  static Future<List<PaymentCard>?> getPaymantCard(String uid) async {
    List<PaymentCard>? paymentCards;
    await FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .collection("card")
        .get()
        .then((value) {
      paymentCards = List.generate(
          value.docs.length,
          (index) => PaymentCard(
              cardHolderName: value.docs[index]["cardHolderName"],
              cardNumber: value.docs[index]["cardNumber"],
              expiryDate: DateTime.fromMillisecondsSinceEpoch(
                  value.docs[index]["expiryDate"].seconds * 1000),
              cvv: value.docs[index]["cvv"]));
    });
    return paymentCards;
  }
}
