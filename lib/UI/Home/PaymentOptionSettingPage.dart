import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentOptionSettingPage extends StatefulWidget {
  PaymentOptionSettingPage({super.key});

  State<PaymentOptionSettingPage> createState() => _PaymentOptionSettingPageState();
}

class _PaymentOptionSettingPageState extends State<PaymentOptionSettingPage> {
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
                "Payment",
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
        ]),
      ),
    );
  }
}
