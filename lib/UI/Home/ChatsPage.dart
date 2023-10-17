import 'package:bwind/UI/Home/ChattingPage.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  ChatsPage({super.key});

  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  List<Map<String, dynamic>> chatsList = [
    {
      "uid": "hiIKkPT2BoW7ualY4hE7sYgPvEz2",
      "name": "Aayush",
      "image": "assets/images/profile1.png"
    },
    {
      "uid": "UI5aaHg9cjW7iBhfK49t2OjTiLp2",
      "name": "Rushal",
      "image": "assets/images/profile2.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: chatsListView(),
    );
  }

  chatsListView() {
    return ListView.builder(
        itemCount: chatsList.length,
        itemBuilder: (context, index) {
          return chatsListViewTile(chatsList[index]['image'],
              chatsList[index]['name'], chatsList[index]);
        });
  }

  chatsListViewTile(image, name, Map<String, dynamic> receiverUser) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChattingPage(
                      receiverUser: receiverUser,
                    )));
      },
      borderRadius: BorderRadius.all(Radius.circular(40)),
      child: Container(
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
                        "Wow! this is really epic",
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
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                      color: Color(0xFF6F30C0),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Text(
                  "13:55",
                  style: TextStyle(
                      color: Color(0xFF979797),
                      fontSize: 11,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
