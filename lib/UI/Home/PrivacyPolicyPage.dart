import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatefulWidget {
  PrivacyPolicyPage({super.key});

  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {

  String? _language;

  @override
  void initState() {
    _language = "English (US)";
    super.initState();
  }

  List<Map<String, String>> privacyPolicyList = [
    {
      "title" : "Types of Data We Collect",
      "description" : "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary."
    },
    {
      "title" : "Use of Your Personal Data",
      "description" : "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary."
    },{
      "title" : "Disclosure of Your Personal Data",
      "description" : "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words."
    }
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 0, left: 16, right: 16),
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
                  "Privacy Policy",
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
                child: privacyPolicyListView(),
              ),
            )
          ]),
        ));
  }

  privacyPolicyListTile(index, title, description){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              (index+1).toString() + " " + title,
              style: TextStyle(
                  color: Color(0xFF6F30C0),
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),
            ),
          ),Text(
           description,
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Color(0xFF979797),
                fontWeight: FontWeight.w400,
                fontSize: 12
            ),
          ),
        ],
      ),
    );
  }

  privacyPolicyListView(){
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 12),
        itemCount: privacyPolicyList.length,
        itemBuilder: (context, index){
          return privacyPolicyListTile(index, privacyPolicyList[index]['title'], privacyPolicyList[index]['description']);
        }
    );
  }
}
