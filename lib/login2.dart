import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum LoginStatus { notSignIn, signIn }

class _HomePageState extends State<HomePage> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String username, password;
  final _key = new GlobalKey<FormState>();
  bool _secureText = true;
  int id;
  String nama;

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();

      login();
    }
  }

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setInt('idd', id);
    pref.setString('nama', nama);
  }

  Future<int> getId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt('idd') ?? null;
  }

  login() async {
    final response = await http.post(
        "https://quizsma.000webhostapp.com/api/login",
        body: {"email": username, "password": password});
    final data = jsonDecode(response.body);
    bool value = data['status'];
    id = data['data']['id'];
    nama = data['data']['name'];

    // if (data['id'] != null && data['name'] != null) {
    //   if (value == true) {
    //     setState(() {
    //       _loginStatus = LoginStatus.signIn;
    //     });
    //   } else {
    //     print('password salah');
    //   }
    // }
    if (response.statusCode == 200) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
      });
    } else {
      AlertDialog(
        title: Text(data['status']),
      );
    }

    saveData();
  }

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  var value;
  Future<bool> getValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    value = pref.getBool("status");
    return value;
  }

  void gotValue() {
    setState(() {
      getValue().then((a) => value = a);
      _loginStatus = value == true ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  void initState() {
    super.initState();
    gotValue();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height * 0.1, 0, 0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/ikip.png",
                      height: 150,
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 260, 0, 0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Barisan & Deret",
                      style: TextStyle(
                          color: Color(0xFF4A00E0),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 300, 20, 10),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (e) {
                                if (e.isEmpty) {
                                  return "Isi Emailnya Dahulu";
                                }
                              },
                              onSaved: (e) => username = e,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.email,
                                    color: Color(0xFF4A00E0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF4A00E0))),
                                  labelText: "Email:  ",
                                  labelStyle:
                                      TextStyle(color: Color(0xFF4A00E0))),
                            ),
                            TextFormField(
                              onSaved: (e) => password = e,
                              obscureText: _secureText,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.vpn_key,
                                    color: Color(0xFF4A00E0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF4A00E0))),
                                  labelText: "Password:  ",
                                  labelStyle:
                                      TextStyle(color: Color(0xFF4A00E0)),
                                  suffixIcon: IconButton(
                                    icon: Icon(_secureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: showHide,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: Container(
                    //     margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                    //     child: Text(
                    //       "FORGOT PASSWORD",
                    //       style: TextStyle(color: Color(0xFFFF4891)),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 40,
                        child: Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              splashColor: Colors.amber,
                              onTap: () {
                                check();
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => DashboardPage()));
                              },
                              child: Center(
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "DONT HAVE AN ACCOUNT? ",
                    //       style: TextStyle(
                    //           fontSize: 11,
                    //           color: Colors.grey,
                    //           fontWeight: FontWeight.w500),
                    //     ),
                    //     Text(
                    //       "SIGN UP ",
                    //       style: TextStyle(
                    //           fontSize: 11,
                    //           color: Color(0XFFFF4891),
                    //           fontWeight: FontWeight.w500),
                    //     ),
                    //   ],
                    // )
                    Center(
                        child: Text(
                      'Jika terjadi masalah ketika login harap cek kembali email & password',
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
              ),
            ],
          ),
        );
        break;
      case LoginStatus.signIn:
        return DashboardPage();
    }
  }
}
