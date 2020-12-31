import 'dart:io';

import 'package:flutter/material.dart';
import 'package:math_materi/hogrider.dart';

import 'package:math_materi/login2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/slider.dart';

int initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  initScreen = await pref.getInt('initScreen');
  await pref.setInt('initScreen', 1);
  runApp(MyApp());
  //runApp(QuizPage());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Barisan & Deret",
      initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : 'home',
      routes: {
        'home': (context) => HomePage(),
        'onboard': (context) => Home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isLCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isLCurrentPage ? 10.0 : 6.0,
      width: isLCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: isLCurrentPage ? Colors.blue : Colors.grey[300],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
        itemBuilder: (context, index) {
          return SliderTile(
            imageAssetPath: slides[index].getImageAssetPath(),
            title: slides[index].getTitle(),
            desc: slides[index].getDesc(),
          );
        },
        onPageChanged: (val) {
          setState(() {
            currentIndex = val;
          });
        },
      ),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              height: Platform.isIOS ? 70 : 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Text("SKIP"),
                    onTap: () {
                      pageController.animateToPage(slides.length - 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false)
                    ],
                  ),
                  GestureDetector(
                    child: Text("NEXT"),
                    onTap: () {
                      pageController.animateToPage(currentIndex + 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                  ),
                ],
              ),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              color: Colors.blue,
              height: Platform.isIOS ? 70 : 60,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.amber,
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Center(
                    child: Text(
                      "AYO MULAI BELAJAR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

class SliderTile extends StatelessWidget {
  String imageAssetPath, title, desc;
  SliderTile({this.imageAssetPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            width: 500,
            child: Image.asset(
              imageAssetPath,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(title),
          SizedBox(
            height: 12,
          ),
          Text(desc)
        ],
      ),
    );
  }
}
