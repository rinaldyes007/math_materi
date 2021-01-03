import 'package:flutter/material.dart';
//import 'package:flutter_launch/flutter_launch.dart';

class ProfilPage extends StatelessWidget {
  // void whatsappOpen() async {
  //   await FlutterLaunch.launchWathsApp(phone: '6285753117906', message: null);
  // }

  text(String str) {
    return Text(
      str,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
    );
  }

  // floatButton(String imgUrl) {
  //   return FloatingActionButton(
  //     onPressed: () {},
  //     backgroundColor: Colors.transparent,
  //     child: Image.asset(imgUrl),
  //   );
  // }

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
                height: 60,
              ),
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 10,
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
                          'Mipatek Matematika',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        Text(
                          '211610046',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                width: 350,
                color: Colors.indigo,
                child: Material(
                  color: Colors.transparent,
                  elevation: 10,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/whatsapp.png'),
                      Image.asset('assets/faceboo.png'),
                      Image.asset('assets/instag.png')
                    ],
                  )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 220,
                width: 350,
                color: Colors.indigo,
                child: Material(
                  color: Colors.transparent,
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Center(
                          child: Row(
                            children: [
                              text('Pembimbing 1'),
                              SizedBox(
                                width: 90,
                              ),
                              text('Yudi Darma, M.Pd')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            text('Pembimbing 2'),
                            SizedBox(
                              width: 90,
                            ),
                            text('Marhadi Saputro, M.Pd'),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                            child: Text(
                          'Motto',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child:
                              text("Jangan berjanji saat kamu sedang bahagia."),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            'Jangan membalas omongan orang ketika kamu marah.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            'Jangan mengambil keputusan saat sedang merasa sedih.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
