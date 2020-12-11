import 'package:flutter/material.dart';

import 'dashboard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Color(0xFF4A00E0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF4A00E0))),
                            labelText: "Email:  ",
                            labelStyle: TextStyle(color: Color(0xFF4A00E0))),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.vpn_key,
                              color: Color(0xFF4A00E0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF4A00E0))),
                            labelText: "Password:  ",
                            labelStyle: TextStyle(color: Color(0xFF4A00E0))),
                      ),
                    ],
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DashboardPage()));
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
