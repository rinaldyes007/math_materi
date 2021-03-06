import 'package:flutter/material.dart';
import 'package:math_materi/evaluasi.dart';
import 'package:math_materi/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'about.dart';
import 'kikd.dart';
import 'latihann.dart';
import 'materi.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String namaUser = 'loading';

  Future<String> getNama() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('nama') ?? null;
  }

  @override
  void initState() {
    getNama().then((value) {
      namaUser = value;
      print(namaUser);
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            color: Colors.transparent,
            child: Material(
              color: Colors.blue,
              elevation: 10,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.height * 0.15,
                        child: Image.asset(
                          "assets/orang.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      namaUser,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  menuKotak(
                      "assets/materi.png", 'Materi', context, MateriPage()),
                  menuKotak(
                      "assets/Latihan.png", 'Latihan', context, QuizPage())
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  menuKotak('assets/evaluasi.png', 'Evaluasi', context,
                      EvaluasiPage()),
                  menuKotak(
                      'assets/profile.png', 'Profil', context, ProfilPage())
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  menuKotak('assets/KI:KD.png', 'KI/KD', context, KIKDPage()),
                  menuKotak('assets/info.png', 'About', context, AboutPage())
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}

menuKotak(String imageUrl, String title, BuildContext context, Widget widget) {
  return Container(
    width: 180,
    height: 180,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.transparent,
    ),
    child: Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      color: Colors.blue,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => widget));
        },
        splashColor: Colors.amberAccent,
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                width: 110,
                height: 110,
                child: Image.asset(imageUrl, fit: BoxFit.cover),
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
