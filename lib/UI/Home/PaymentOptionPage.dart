import 'package:bwind/Model/FireAuth.dart';
import 'package:bwind/Model/Userbase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/Course.dart';
import '../../Model/PaymentCard.dart';
import 'AddNewCardPage.dart';

class PaymentOptionPage extends StatefulWidget {
  Course course;
  PaymentOptionPage({super.key,required this.course});

  State<PaymentOptionPage> createState() => _PaymentOptionPageState(this.course);
}

class _PaymentOptionPageState extends State<PaymentOptionPage> {
  Course course;
  _PaymentOptionPageState(this.course);
  String paymentMethod = "";
  List<PaymentCard>? paymentcardList;
  List<Widget> paymentCardWidgetList = [];

  @override
  void initState() {
    // TODO: implement initState
    getpaymentcard();
    paymentMethod = "";
    super.initState();
  }

  getpaymentcard() async{
    paymentcardList = await Userbase.getPaymantCard(FireAuth.auth.currentUser!.uid);
    paymentCardWidgetList = [];
    setState(() {
      for(PaymentCard paymentCard in paymentcardList!){
        paymentCardWidgetList.add(paymentTile("assets/images/mastercard_icon.png",  "**** **** **** " + paymentCard.cardNumber.substring(12), paymentCard.cardNumber , paymentMethod, (value) {
          setState(() {
            paymentMethod = value;
          });
        }));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 50, bottom: 0, left: 16, right: 16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    "Enroll Course",
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Select the Payment method you want to use",
                  style: TextStyle(
                      color: Color(0xFF979797),
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 260,
                width: MediaQuery.of(context).size.width - 32,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      paymentTile("assets/images/paypal.png", "PayPal", "PayPal", paymentMethod, (value) {
                        setState(() {
                          paymentMethod = value;
                        });
                      }),
                      paymentTile("assets/images/google_pay.png", "Google Pay", "Google Pay", paymentMethod, (value) {
                        setState(() {
                          paymentMethod = value;
                        });
                      }),paymentTile("assets/images/apple.png", "Apple Pay", "Apple Pay", paymentMethod, (value) {
                        setState(() {
                          paymentMethod = value;
                        });
                      }),
                      Column(
                        children: paymentCardWidgetList,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xFFCFBAE3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(75),
                              ),
                              side: BorderSide(
                                  color:  Color(0xFFCFBAE3),
                                  width: 1,
                                  style: BorderStyle.solid
                              )
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewCardPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 18.0),
                            child: Text(
                              "Add New Card",
                              style: TextStyle(
                                  color: Color(0xFF6F30C0),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
        Positioned(
          bottom: 20,
          width: MediaQuery.of(context).size.width - 32,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            onTap: () {},
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 18.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Color(0xFF6F30C0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          spreadRadius: 10,
                          blurRadius: 150,
                          offset: Offset(0, 50))
                    ]),
                child: Center(
                  child: Text(
                    "Enroll Course - \$${course.price}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                )),
          ),
        ),
      ]),
    );
  }

  paymentTile(image, title, value, groupValue, void Function(dynamic)? onChange) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 9),
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Image(
                      image: AssetImage(image),
                    height: 20,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Color(0xFF4E4E4E),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 28,
              width: 38,
              child: Transform.scale(
                  scale: 1.2,
                  child:Radio(
                      value: value,
                      groupValue: groupValue,
                      onChanged: onChange
                  )
              ),
            )

          ],
        ),
      ),
    );
  }
}
