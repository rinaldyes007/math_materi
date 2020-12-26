import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
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
          Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 160,
                        width: 160,
                        child: Image.asset(
                          'assets/orang.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        "Adis Sugianto",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Text(
                        'Mipatek',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                      Text(
                        '3201616076',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 350,
                color: Colors.indigo,
                child: Center(
                  child: Text(
                    'Dosen Pembimbing',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 220,
                width: 350,
                color: Colors.indigo,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
