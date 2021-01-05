import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  text(String str) {
    return Text(
      str,
      textAlign: TextAlign.justify,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w600, height: 1.5),
    );
  }

  textTitle(String str) {
    return Text(
      str,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Image.asset(
              'assets/backgro.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(30),
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.indigo,
              ),
              child: Column(
                children: [
                  Center(
                    child: textTitle("List Sumber Resource"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  text('www.pngtree.com'),
                  text('www.flaticon.com'),
                  text('www.freepik.com'),
                  text('www.icon8.com'),
                  text('etc..')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
