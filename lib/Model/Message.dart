
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message{
  String msg;
  String sender;
  String receiver;
  DateTime time;

  Message({required this.msg, required this.sender, required this.receiver, required this.time });

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      "msg" : this.msg,
      "sender" : this.sender,
      "receiver" : this.receiver,
      "time" : this.time
    };
  }

  static Future<void> sendMessage(Map<String, dynamic> messageMap, String sender, String receiver) async{
    await FirebaseFirestore.instance.collection('user').doc(sender).collection(sender+receiver).add(messageMap);
    await FirebaseFirestore.instance.collection('user').doc(receiver).collection(receiver+sender).add(messageMap);
  }

  static Stream getMessage(String sender, String receiver,)  {

    return FirebaseFirestore.instance.collection('user').doc(sender).collection(sender+receiver).orderBy('time', descending: true).snapshots();
  }


  // static Future<void> updatePerson(docId,Map<String, dynamic> personMap) async{
  //   await FirebaseFirestore.instance.collection('person').doc(docId).update(personMap);
  // }

  // static Future<void> deletePerson(docId) async {
  //   await FirebaseFirestore.instance.collection('person').doc(docId).delete();
  // }

  // static Stream selectPersons(String author){
  //   return FirebaseFirestore.instance.collection('person').where('author',isEqualTo: author).snapshots();
  // }

}