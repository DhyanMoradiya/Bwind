import 'package:bwind/Model/Message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import '../../Model/FireAuth.dart';

class ChattingPage extends StatefulWidget {
  Map<String, dynamic> receiverUser;

  ChattingPage({super.key, required this.receiverUser});

  State<ChattingPage> createState() => _ChattingPageState(this.receiverUser);
}

class _ChattingPageState extends State<ChattingPage> {
  final _msgController = TextEditingController();

  User? _currentUser;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {

    // _scrollController.addListener(() {
    //   _scrollController.animateTo(_scrollController.position.maxScrollExtent,
    //       duration: Duration(milliseconds: 750), curve: Curves.easeOut);
    // });


    _currentUser = FireAuth.auth.currentUser;
    super.initState();
  }


  List<Map<String, String>> msglist = [
    {
      "sender": "EMLk8styjwPDEP2bxcsGdWz3QQq2",
      "receiver": "V75LxRPvXhV64wRjr9bVxfov2rz1",
      "msg": "Hello! Good Morning",
      "time": "10.21 pm"
    },
    {
      "receiver": "EMLk8styjwPDEP2bxcsGdWz3QQq2",
      "sender": "V75LxRPvXhV64wRjr9bVxfov2rz1",
      "msg": "Hello! Good Morning",
      "time": "10.21 pm"
    },
    {
      "sender": "EMLk8styjwPDEP2bxcsGdWz3QQq2",
      "receiver": "V75LxRPvXhV64wRjr9bVxfov2rz1",
      "msg": "How was your UI/UX Design Course like?",
      "time": "10.21 pm"
    },
    {
      "receiver": "EMLk8styjwPDEP2bxcsGdWz3QQq2",
      "sender": "V75LxRPvXhV64wRjr9bVxfov2rz1",
      "msg":
          "Yes, I am still finishing the basic figma. I haven’t continued the course yet.",
      "time": "10.21 pm"
    },
  ];

  Map<String, dynamic> reciverUser;

  _ChattingPageState(this.reciverUser);

  @override
  Widget build(BuildContext context) {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   _scrollController.jumpTo(
    //     _scrollController.position.maxScrollExtent,
    //
    //   );
    // });
    // _scrollController.addListener(() {
    //   print(_scrollController.position);
    //   if(_scrollController.position != 0.0){
    //     _scrollController.animateTo(_scrollController.position.maxScrollExtent,
    //         duration: Duration(milliseconds: 750), curve: Curves.easeOut);
    //   }
    // });
    // _scrollController.addListener(() {
      // print(_scrollController.position.maxScrollExtent);
      // if (_scrollController.position.atEdge) {
      // if (_scrollController.position.pixels != 0) {
      //   _scrollController.jumpTo(
      //     _scrollController.position.maxScrollExtent,);
      //   // duration: Duration(milliseconds: 750),
      //   // curve: Curves.easeOut);
      // }
      // }
    // });
    return Scaffold(

      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.grey.shade300, blurRadius: 10)
            ]),
            padding:
                const EdgeInsets.only(top: 50, bottom: 11, left: 16, right: 16),
            child: Row(
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
                  reciverUser['name'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage("assets/images/call_icon.png"),
                    color: Color(0xFF6F30C0),
                    size: 25,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: _StreamBuilder(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 95,
                  child: TextFormField(
                    controller: _msgController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0xFFD1D1D1), width: 1),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 13),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: Color(0xFF6F30C0), width: 1),
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            padding: EdgeInsets.only(left: 7),
                            decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(color: Color(0xFFD1D1D1))),
                            ),
                            child: ImageIcon(
                              AssetImage("assets/images/image_icon.png"),
                              color: Color(0xFFD1D1D1),
                            ),
                          ),
                        ),
                        suffixIconConstraints: BoxConstraints(
                          minHeight: 22,
                          minWidth: 22,
                        ),
                        hintText: "Type Message...",
                        hintStyle: TextStyle(color: Color(0xFFD1D1D1))),
                    style: TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Message message = Message(
                        msg: _msgController.text,
                        sender: _currentUser!.uid,
                        receiver: reciverUser['uid'],
                        time: DateTime.now());
                    await Message.sendMessage(message.toMap(), _currentUser!.uid, reciverUser['uid']);
                    setState(() {
                      _msgController.text = "";
                    });
                    _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut);
                  },
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFF6F30C0),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage("assets/images/send_icon.png"),
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  msgListView(msgData) {
    if (_scrollController.hasClients)  {
      _scrollController.jumpTo(
          _scrollController.position.minScrollExtent,
         );
    }
    return  ListView.builder(
        controller: _scrollController,
        reverse:  true,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemCount: msgData.length,
        itemBuilder: (context, index) {

          return msgTile(
              msgData[index]["sender"],
              msgData[index]["receiver"],
              msgData[index]["msg"],
              DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(
                  msgData[index]['time'].seconds * 1000)));
        });
  }

  // DateFormat('hh:mm a').format(DateTime(msgData[index]['time']))
  // msgData[index]['time'].seconds.toString()
  // DateFormat('hh:mm a').format(DateTime(msgData[index]['time'].seconds))

  msgTile(sender, receiver, msg, time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: sender == _currentUser!.uid
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: sender == _currentUser!.uid
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: sender == _currentUser!.uid
                      ? Color(0xFF6F30C0)
                      : Color(0xFFD1D1D1),
                  borderRadius: sender == _currentUser!.uid
                      ? BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))
                      : BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                ),
                child: Text(
                  msg,
                  style: TextStyle(
                      color: sender == _currentUser!.uid
                          ? Colors.white
                          : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                time,
                style: TextStyle(
                    color: Color(0xFF979797),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _StreamBuilder() {

    return StreamBuilder(
        stream: Message.getMessage(
            _currentUser!.uid.toString(), reciverUser['uid']),
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            return msgListView(snapshot.data!.docs);
          }
            return Center(child: CircularProgressIndicator());

        }) ;
  }


}
