import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContectUsPage extends StatefulWidget {
  ContectUsPage({super.key});

  State<ContectUsPage> createState() => _ContectUsPageState();
}

class _ContectUsPageState extends State<ContectUsPage> {

  List<Map<String, String>> contactList = [
    {
  "contact_title" : "Customer Service",
     "image" : "assets/images/headphone_icon.png",
      "link" : "tel:+917405353884"
    },{
      "contact_title" : "WhatsApp",
      "image" : "assets/images/whatsapp_icon.png",
      "link" : "https://wa.me/+917405353884"
    },{
      "contact_title" : "Website",
      "image" : "assets/images/chrome_icon.png",
      "link" : "http://www.viprak.com/"
    },{
      "contact_title" : "Facebook",
      "image" : "assets/images/facebook_icon.png",
      "link" : "https://www.facebook.com/viprakweb/"
    },{
      "contact_title" : "Twitter",
      "image" : "assets/images/twitter_icon.png",
      "link" : "https://twitter.com/viprakweb?lang=en"
    },{
      "contact_title" : "Instagram",
      "image" : "assets/images/instagram_icon.png",
      "link" : "https://www.instagram.com/viprakwebsolutions/"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child:  ContactListView(),
      ),
    );
  }

  contactListTile(image, title, link){
    return  InkWell(
      onTap: () async {
        Uri uri = Uri.parse(link);
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      },
        borderRadius: BorderRadius.all(Radius.circular(16)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        child: Row(
          children: [
            Image(
                image: AssetImage(image),
              height: 28,
              width: 28,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:19),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ContactListView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: contactList.length,
        itemBuilder: (context, index){
          return contactListTile(contactList[index]['image'], contactList[index]['contact_title'], contactList[index]['link']);
        }
    );
  }
}
