import 'package:bwind/Model/FireAuth.dart';
import 'package:bwind/Model/Userbase.dart';
import 'package:bwind/Validator.dart';
import 'package:bwind/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Model/RefreshBloc.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});

  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  GlobalKey<FormState> _editProfileFormKey = GlobalKey();

  final _nameController = TextEditingController();
  final _DOBController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();

  User? _currentUser;
  Userbase? userbase;
  DateTime? pickedDate;
  String? _password;

  @override
  void initState() {
    // TODO: implement initState
    _currentUser = FireAuth.auth.currentUser;
    getUserbase();
    super.initState();
  }

  getUserbase() async {
    userbase = await Userbase.getUserBaseByUid(_currentUser!.uid);
    _nameController.text =
        userbase!.name != null ? userbase!.name.toString() : "";

    pickedDate = userbase!.DOB != null ? userbase!.DOB : null;
    _DOBController.text = userbase!.DOB != null
        ? userbase!.DOB!.day.toString() +
            "/" +
            userbase!.DOB!.month.toString() +
            "/" +
            userbase!.DOB!.year.toString()
        : "";
    _emailController.text =
        userbase!.email != null ? userbase!.email.toString() : "";
    _genderController.text =
        userbase!.gender != null ? userbase!.gender.toString() : "";
    _password = userbase!.password;
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
              "Edit Profile",
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Form(
                      key: _editProfileFormKey,
                      child: Column(
                        children: [
                          Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xFF6F30C0),
                                  radius: 65,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/profile_picture.png"),
                                    radius: 62,
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 10,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 32,
                                      width: 32,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF6F30C0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: Center(
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/images/edit_icon.png"),
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15, bottom: 4),
                                child: Text(
                                  "Name",
                                  style: TextStyle(
                                      color: Color(0xFF4E4E4E),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                controller: _nameController,
                                validator: (String? value) {
                                  return Validator.validateUserame(
                                      username: value!);
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color: Color(0xFFD1D1D1), width: 1),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 13, horizontal: 11),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color: Color(0xFF6F30C0), width: 1),
                                    ),
                                    hintText: "Name"),
                                style: TextStyle(
                                    color: Color(0xFF979797),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15, bottom: 4),
                                child: Text(
                                  "Date Of Birth",
                                  style: TextStyle(
                                      color: Color(0xFF4E4E4E),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                controller: _DOBController,
                                validator: (String? value) {
                                  return Validator.validateDOB(DOB: value!);
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xFFD1D1D1), width: 1),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 11),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Color(0xFF6F30C0), width: 1),
                                  ),
                                  hintText: "DOB",
                                  suffixIcon: Icon(Icons.calendar_month,
                                      color: Color(0xFF6F30C0)),
                                ),
                                readOnly: true,
                                onTap: () async {
                                  pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now());
                                  _DOBController.text =
                                      pickedDate!.day.toString() +
                                          "/" +
                                          pickedDate!.month.toString() +
                                          "/" +
                                          pickedDate!.year.toString();
                                },
                                style: TextStyle(
                                    color: Color(0xFF979797),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15, bottom: 4),
                                child: Text(
                                  "Email Address",
                                  style: TextStyle(
                                      color: Color(0xFF4E4E4E),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                controller: _emailController,
                                validator: (String? value) {
                                  return Validator.validateEmail(email: value!);
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color: Color(0xFFD1D1D1), width: 1),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 13, horizontal: 11),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color: Color(0xFF6F30C0), width: 1),
                                    ),
                                    hintText: "Email "),
                                style: TextStyle(
                                    color: Color(0xFF979797),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15, bottom: 4),
                                child: Text(
                                  "Gender",
                                  style: TextStyle(
                                      color: Color(0xFF4E4E4E),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                controller: _genderController,
                                validator: (String? value) {
                                  return Validator.validateGender(
                                      gender: value!);
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color: Color(0xFFD1D1D1), width: 1),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 13, horizontal: 11),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color: Color(0xFF6F30C0), width: 1),
                                    ),
                                    hintText: "Gender"),
                                style: TextStyle(
                                    color: Color(0xFF979797),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(flex: 0, child: SizedBox()),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: OutlinedButton(
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
                          if (_editProfileFormKey.currentState!.validate()) {
                            Userbase updatedUserbase = Userbase(
                                name: _nameController.text.trim(),
                                DOB: pickedDate,
                                email: _emailController.text.trim(),
                                gender: _genderController.text
                                    .trim()
                                    .toCapitalized(),
                                password: _password,
                                createTime: DateTime.now());
                            bool response = await Userbase.updateUserInfo(
                                updatedUserbase.toMap(), _currentUser!.uid);
                            if (response) {
                              await refreshBloc.refreshData();
                              Fluttertoast.showToast(
                                  msg: "Info Updated",
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_LONG);
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Somthing is wrong, can't upadte",
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_LONG);
                            }
                          }
                        },
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: Text(
                              "Update",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ))),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
