import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({super.key});

  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool? genralNotification;
  bool? sound;
  bool? vibrate;
  bool? specialOffer;
  bool? promoAndDiscount;
  bool? payment;
  bool? appUpdate;
  bool? newServiceAvailable;
  bool? newTipsAvailable;

  @override
  void initState() {
    genralNotification = false;
    sound = false;
    vibrate = false;
    specialOffer = false;
    promoAndDiscount = false;
    payment = false;
    appUpdate = false;
    newServiceAvailable = false;
    newTipsAvailable = false;
    super.initState();
  }

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
              "Notifications",
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
            padding: EdgeInsets.symmetric(vertical: 7),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  notificationTile("General Notification", genralNotification,
                      (value) {
                    setState(() {
                      genralNotification = value;
                    });
                  }),
                  notificationTile("Sound", sound, (value) {
                    setState(() {
                      sound = value;
                    });
                  }),
                  notificationTile("Vibrate", vibrate, (value) {
                    setState(() {
                      vibrate = value;
                    });
                  }),
                  notificationTile("Special Offer", specialOffer, (value) {
                    setState(() {
                      specialOffer = value;
                    });
                  }),
                  notificationTile("Promo and Discount", promoAndDiscount,
                      (value) {
                    setState(() {
                      promoAndDiscount = value;
                    });
                  }),
                  notificationTile("Payments", payment, (value) {
                    setState(() {
                      payment = value;
                    });
                  }),
                  notificationTile("App Update", appUpdate, (value) {
                    setState(() {
                      appUpdate = value;
                    });
                  }),
                  notificationTile("New Service Available", newServiceAvailable,
                      (value) {
                    setState(() {
                      newServiceAvailable = value;
                    });
                  }),
                  notificationTile("New Tips Available", newTipsAvailable,
                      (value) {
                    setState(() {
                      newTipsAvailable = value;
                    });
                  }),
                ],
              ),
            ),
          ),
        )
      ]),
    ));
  }

  notificationTile(title, value, void Function(bool)? onChange) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Color(0xFF4E4E4E),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 28,
              width: 38,
              child: Transform.scale(
                scale: .7,
                child: CupertinoSwitch(
                  value: value,
                  onChanged: onChange,
                  activeColor: Color(0xFF6F30C0),
                  trackColor: Color(0xFFD1D1D1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
