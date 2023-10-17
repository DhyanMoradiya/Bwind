import 'package:bwind/Model/AuthResponse.dart';
import 'package:bwind/Model/FireAuth.dart';
import 'package:bwind/UI/Home/HomeScreen.dart';
import 'package:bwind/UI/Login/ForgotPasswordScreen.dart';
import 'package:bwind/Validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  bool isLogin;
  LoginScreen({super.key, required this.isLogin});

  State<LoginScreen> createState() => _LoginScreenState(this.isLogin);
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> _loginFormKey = GlobalKey();


  bool? isLoging;
  bool isLogin;
  bool? visible;
  String? titleText;
  String? buttonText;
  String? beforeLinkText;
  String? linkText;
  bool? passwordVisible;
  bool? isGoogleSigningIn;
  bool? isFacebookSigningIn;

  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordConroller = TextEditingController();

  _LoginScreenState(this.isLogin);

  @override
  void initState() {
    if (isLogin) {
      visible = false;
      titleText = "Welcome Back!";
      beforeLinkText = "Don't have on account?";
      buttonText = "Login";
      linkText = "Sign Up";
    } else {
      visible = false;
      titleText = "Create Account!";

      beforeLinkText = "Already have an account?";
      buttonText = "Login";
      linkText = "Sign In";
    }
    isLoging = false;
    passwordVisible = false;
    isGoogleSigningIn = false;
    isFacebookSigningIn = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _loginPage()
    );
  }

  Widget _loginPage(){
    return Padding(
      padding:
      const EdgeInsets.only(top: 60, bottom: 15, left: 16, right: 16),
      child: Form(
        key: _loginFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 520,
                // color: Colors.green,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          titleText!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 4),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  color: Color(0xFF4E4E4E),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                          TextFormField(
                            controller: _emailController,
                            validator: (String? value){
                              return Validator.validateEmail(email: value!);
                            },
                            decoration: InputDecoration(
                                enabledBorder : OutlineInputBorder(
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
                                    AssetImage("assets/images/email_icon.png"),
                                    color: Color(0xFF4E4E4E),
                                  ),
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  minHeight: 22,
                                  minWidth: 22,
                                ),
                                hintText: "Email"),

                            style: TextStyle(
                                color: Color(0xFF979797),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: !isLogin,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 4),
                              child: Text(
                                "Username",
                                style: TextStyle(
                                    color: Color(0xFF4E4E4E),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            ),
                            TextFormField(
                              controller: _usernameController,
                              validator: (String? value){
                                return Validator.validateUserame(username: value!);
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
                                      AssetImage("assets/images/profile_icon.png"),
                                      color: Color(0xFF4E4E4E),
                                    ),
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    minHeight: 22,
                                    minWidth: 22,
                                  ),
                                  hintText: "Username"),
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
                            margin: EdgeInsets.only(top: 15, bottom: 4),
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
                                  padding: EdgeInsets.symmetric(horizontal: 13),
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
                          Visibility(
                              visible: isLogin,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotPasswordScreen()));
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          color: Color(0xFFA069E5),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      Visibility(
                        visible: !isLogin,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 4),
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
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Color(0xFF6F30C0)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(75),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        if(_loginFormKey.currentState!.validate()){
                          FocusScope.of(context).requestFocus(FocusNode());
                          setState(() {
                            isLoging = true;
                          });
                          AuthResponse? authResponse;
                          if(isLogin){
                            authResponse = await FireAuth.signInUsingEmailPassword(email: _emailController.text , password: _passwordController.text);
                            Fluttertoast.showToast(
                                msg: authResponse.msg,
                                gravity: ToastGravity.BOTTOM,
                                toastLength: Toast.LENGTH_LONG
                            );
                          }else{
                            if(_passwordController.text == _rePasswordConroller.text){
                              authResponse = await FireAuth.registerUserUsingEmailPassword(name: _usernameController.text, email: _emailController.text , password: _passwordController.text);
                              Fluttertoast.showToast(
                                  msg: authResponse.msg,
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_LONG
                              );

                            }else{
                              Fluttertoast.showToast(
                                  msg: "Confirm password is not matching",
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_LONG
                              );
                            }
                          }
                          setState(() {
                            isLoging = false;
                          });
                          if(authResponse!.code){
                            await  preferences.setBool("isLogedin", true);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: !isLoging! ?  Text(
                          isLogin ? "Login" : "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )
                            :SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(color: Colors.white,)
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 18),
                      child: Text(
                        "OR",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FacebookSignInButton(context),
                          SizedBox(
                            width: 31,
                          ),
                          GoogleSignInButton(context),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          beforeLinkText!,
                          style: TextStyle(
                              color: Color(0xFF979797),
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        TextButton(
                            onPressed: () {
                              if (isLogin) {
                                setState(() {
                                  isLogin = false;
                                  visible = false;
                                  titleText = "Create Account!";
                                  beforeLinkText = "Already have an account?";
                                  buttonText = "Login";
                                  linkText = "Sign In";
                                });
                              } else {
                                setState(() {
                                  isLogin = true;
                                  visible = false;
                                  titleText = "Welcome Back!";
                                  beforeLinkText = "Don't have on account?";
                                  buttonText = "Login";
                                  linkText = "Sign Up";
                                });
                              }
                            },
                            child: Text(
                              linkText!,
                              style: TextStyle(
                                  color: Color(0xFF6F30C0),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  GoogleSignInButton(BuildContext context) {
    if (!isGoogleSigningIn!) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 1,
              backgroundColor: Colors.white,
              minimumSize: Size.zero,
              padding: EdgeInsets.all(10),
              shape: CircleBorder()),
          onPressed: () async{
            setState(() {
              isGoogleSigningIn = true;
            });

            SharedPreferences preferences = await SharedPreferences.getInstance();
            AuthResponse response = await FireAuth.signInUsingGoogle(context);

            setState(() {
              isGoogleSigningIn = false;
            });

            Fluttertoast.showToast(
                msg: response.msg,
                gravity: ToastGravity.BOTTOM,
                toastLength: Toast.LENGTH_LONG
            );

            if(response.code){
              await  preferences.setBool("isLogedin", true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            }
          },
          child: Image(
            image: AssetImage("assets/images/google_login_button_icon.png"),
            height: 40,
          ));
    } else {
      return CircularProgressIndicator(
        color: Color(0xFF6F30C0),
      );
    }
  }

  FacebookSignInButton(BuildContext context) {
    if (!isFacebookSigningIn!) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 1,
              backgroundColor: Colors.white,
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              shape: CircleBorder()),
          onPressed: () async{
            setState(() {
              isFacebookSigningIn = true;
            });
            SharedPreferences preferences = await SharedPreferences.getInstance();
            AuthResponse response = await FireAuth.signInUsingGoogle(context);

            setState(() {
              isFacebookSigningIn = false;
            });

            Fluttertoast.showToast(
                msg: response.msg,
                gravity: ToastGravity.BOTTOM,
                toastLength: Toast.LENGTH_LONG
            );

            if(response.code){
              await  preferences.setBool("isLogedin", true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            }
          },
          child: Image(
            image: AssetImage("assets/images/facebook_login_button_icon.png"),
            height: 58,
          ));
    } else {
      return CircularProgressIndicator(
        color: Color(0xFF6F30C0),
      );
    }
  }

}
