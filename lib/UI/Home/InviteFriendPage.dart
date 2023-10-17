import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InviteFriendPage extends StatefulWidget {
  InviteFriendPage({super.key});

  State<InviteFriendPage> createState() => _InviteFriendPageState();
}

class _InviteFriendPageState extends State<InviteFriendPage> {
  List<Map<String, dynamic>> contactsList = [
    {
      "name": "Aman malik",
      "number": 4651133152,
      "image": "assets/images/profile10.png",
      "isInvited": false
    },
    {
      "name": "Jay Patel",
      "number": 8743113211,
      "image": "assets/images/profile9.png",
      "isInvited": true
    },
    {
      "name": "Ammar Multani",
      "number": 8645512231,
      "image": "assets/images/profile8.png",
      "isInvited": false
    },
    {
      "name": "Vraj donda",
      "number": 6853121326,
      "image": "assets/images/profile7.png",
      "isInvited": true
    },
    {
      "name": "Dhwani Kedar",
      "number": 8676413132,
      "image": "assets/images/profile13.png",
      "isInvited": true
    },
    {
      "name": "Tusha Mishra",
      "number": 8654165131,
      "image": "assets/images/profile12.png",
      "isInvited": true
    },
    {
      "name": "Dharmik Mali",
      "number": 6941321561,
      "image": "assets/images/profile11.png",
      "isInvited": true
    },
    {
      "name": "Jash Shah",
      "number": 4965166446,
      "image": "assets/images/profile6.png",
      "isInvited": false
    },
    {
      "name": "Kush Piter",
      "number": 7894512119,
      "image": "assets/images/profile11.png",
      "isInvited": false
    },
    {
      "name": "Kamal Hasan",
      "number": 7852131158,
      "image": "assets/images/profile7.png",
      "isInvited": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding:
                const EdgeInsets.only(top: 50, bottom: 0, left: 16, right: 16),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                  Text(
                    "Invite Friends",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 0,
                    width: 35,
                  )
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ContactsListView(),
                ),
              ),
            ])));
  }

  contactsListTile(image, name, number, bool isInvited) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      number.toString(),
                      style: TextStyle(
                          color: Color(0xFF979797),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
          isInvited
              ? InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(27)),
                        border: Border.all(color: Color(0xFF6F30C0), width: 1)),
                    child: Text(
                      "Invited",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF6F30C0),
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFF6F30C0),
                      borderRadius: BorderRadius.all(Radius.circular(27)),
                      border: Border.all(color: Color(0xFF6F30C0), width: 1)),
                  child: Text(
                    "Invite",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
        ],
      ),
    );
  }

  ContactsListView() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: contactsList.length,
        itemBuilder: (context, index) {
          return contactsListTile(
              contactsList[index]['image'],
              contactsList[index]['name'],
              contactsList[index]['number'],
              contactsList[index]['isInvited']);
        });
  }
}
