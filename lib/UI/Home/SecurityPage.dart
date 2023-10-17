import 'package:bwind/UI/Home/ChangePasswordScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecurityPage extends StatefulWidget {
  SecurityPage({super.key});

  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {

  bool? rememberMe;
  bool? faceId;
  bool? biometricId;

  @override
  void initState() {
    rememberMe = false;
    faceId = false;
    biometricId = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 0, left: 16, right: 16),
          child: Column(

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
                  "Security",
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      securityTile("Remember me", rememberMe,
                              (value) {
                            setState(() {
                              rememberMe = value;
                            });
                          }),
                      securityTile("Face ID", faceId,
                              (value) {
                            setState(() {
                              faceId = value;
                            });
                          }),
                      securityTile("Biometric ID", biometricId,
                              (value) {
                            setState(() {
                              biometricId = value;
                            });
                          }),
                      Container(
                        margin: EdgeInsets.only(top: 28,bottom: 9),
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
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 18.0),
                            child: Text(
                              "Change Pin",
                              style: TextStyle(
                                  color: Color(0xFF6F30C0),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 9),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 18.0),
                            child: Text(
                              "Change Password",
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
              ),
            )
          ]),
        ));
  }

  securityTile(title, value, void Function(bool)? onChange) {
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
