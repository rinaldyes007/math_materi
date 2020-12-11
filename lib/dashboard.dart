import 'package:flutter/material.dart';
import 'package:math_materi/evaluasi.dart';

import 'latihan.dart';
import 'materi.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
                      "Rinaldy Eka Saputra",
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
                      "assets/Latihan.png", 'Latihan', context, LatihanPage())
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  menuKotak(
                      'assets/evaluasi.png', 'Evaluasi', context, MateriPage()),
                  menuKotak(
                      'assets/profile.png', 'Profil', context, EvaluasiPage())
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  menuKotak('assets/KI:KD.png', 'KI/KD', context, MateriPage()),
                  menuKotak('assets/info.png', 'About', context, EvaluasiPage())
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
