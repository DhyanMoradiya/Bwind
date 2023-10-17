import 'package:bwind/Model/AuthResponse.dart';
import 'package:bwind/Model/FireAuth.dart';
import 'package:bwind/UI/Login/LoginScreen.dart';
import 'package:bwind/Validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({super.key});

  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  GlobalKey<FormState> _resetPasswordFormKey = GlobalKey();

  bool? passwordVisible;
  final _passwordController = TextEditingController();
  final _rePasswordConroller = TextEditingController();
  bool? isCreateing;

  @override
  void initState() {
    isCreateing = false;
    passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding:
            const EdgeInsets.only(top: 60, bottom: 38, left: 16, right: 16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              splashRadius: 25,
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_outlined,
                                color: Colors.black,
                                size: 30,
                              ))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 35, bottom: 5),
                        child: Text(
                          "Reset Password!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        "Create new password",
                        style: TextStyle(
                          color: Color(0xFF979797),
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                        ),
                      ),
                      Form(
                        key: _resetPasswordFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20, bottom: 4),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    color: Color(0xFF4E4E4E),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            ),
                        TextFormField(
                          controller: _passwordController,
                          validator: (String? value){
                            return Validator.validatePassword(password: value!);
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Color(0xFFD1D1D1), width: 1),
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 13),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Color(0xFF6F30C0), width: 1),
                              ),
                              prefixIcon: Padding(
                                padding:EdgeInsets.symmetric(horizontal: 10.0),
                                child: ImageIcon(
                                  AssetImage("assets/images/password_icon.png"),
                                  color: Color(0xFF4E4E4E),
                                ),
                              ),
                              prefixIconConstraints: BoxConstraints(
                                minHeight: 22,
                                minWidth: 22,
                              ),
                              suffix: IconButton(
                                onPressed: () {
                                  if (passwordVisible!) {
                                    setState(() {
                                      passwordVisible = false;
                                    });
                                  } else {
                                    setState(() {
                                      passwordVisible = true;
                                    });
                                  }
                                },
                                icon: Icon(
                                  passwordVisible!
                                      ? CupertinoIcons.eye_fill
                                      : CupertinoIcons.eye_slash_fill,
                                  color: Color(0xFF6F30C0),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                constraints: BoxConstraints(),
                              ),
                              hintText: "Password "),
                          obscureText: !passwordVisible!,
                          obscuringCharacter: '●',
                          style: TextStyle(
                              color: Color(0xFF979797),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 4),
                            child: Text(
                              "Confirm Password",
                              style: TextStyle(
                                  color: Color(0xFF4E4E4E),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                          TextFormField(
                            controller: _rePasswordConroller,
                            validator: (String? value){
                              return Validator.validatePassword(password: value!);
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Color(0xFFD1D1D1), width: 1),
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(vertical: 13),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Color(0xFF6F30C0), width: 1),
                                ),
                                prefixIcon: Padding(
                                  padding:EdgeInsets.symmetric(horizontal: 10.0),
                                  child: ImageIcon(
                                    AssetImage("assets/images/password_icon.png"),
                                    color: Color(0xFF4E4E4E),
                                  ),
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  minHeight: 22,
                                  minWidth: 22,
                                ),
                                suffix: IconButton(
                                  onPressed: () {
                                    if (passwordVisible!) {
                                      setState(() {
                                        passwordVisible = false;
                                      });
                                    } else {
                                      setState(() {
                                        passwordVisible = true;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    passwordVisible!
                                        ? CupertinoIcons.eye_fill
                                        : CupertinoIcons.eye_slash_fill,
                                    color: Color(0xFF6F30C0),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  constraints: BoxConstraints(),
                                ),
                                hintText: "Confirm Password "),
                            obscureText: !passwordVisible!,
                            obscuringCharacter: '●',
                            style: TextStyle(
                                color: Color(0xFF979797),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 70),
                    child: OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color(0xFF6F30C0)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(75),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if(_resetPasswordFormKey.currentState!.validate()){
                            setState(() {
                              isCreateing = true;
                            });
                            if(_passwordController.text == _rePasswordConroller.text){
                              AuthResponse authReaponse = await FireAuth.resetPassword(_passwordController.text);
                              Fluttertoast.showToast(
                                  msg: authReaponse.msg,
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_LONG
                              );
                              if(authReaponse.code){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen(isLogin: true)));
                              }
                            }else{
                              Fluttertoast.showToast(
                                  msg: "Confirm password is not matching",
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_LONG
                              );
                            }
                            setState(() {
                              isCreateing = false;
                            });
                          }

                        },
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 18.0),
                          child: !isCreateing! ?  Text(
                            "Create",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                              :SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(color: Colors.white,)
                          ),
                        )),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}