import 'package:flutter/material.dart';

class MateriPage extends StatefulWidget {
  @override
  _MateriPageState createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  text(String str) {
    return Text(
      str,
      textAlign: TextAlign.justify,
      style: TextStyle(fontWeight: FontWeight.w600, height: 1.5),
    );
  }

  textMotivasi(String str) {
    return Text(
      str,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          height: 1.5,
          fontStyle: FontStyle.italic),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: Image.asset(
                'assets/backmateri.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(50),
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      Image.asset('assets/pray.jpg'),
                      SizedBox(height: 10),
                      Text(
                        'Sebelum memulai pelajaran, marilah berdoa terlebih dahulu!',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Barisan & Deret',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '1. Pengertian Artitmatika',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Image.asset('assets/buah.png'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Gambar 1.1',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      text(
                          'Setiap hari libur Ave selalu membantu bapaknya berjualan sayur di pasar, hingga pada suatu hari ibunya meminta Ave untuk membeli buah-buahan ketika pulang dari pasar. Saat sedang memilih buah-buahan yang ingin di beli, tak sengaja Ave menyenggol  tumpukan buah jeruk yang sudah tersusun rapi hingga berserakan.  Bapaknya pun meminta Ave untuk merapikan dan menghitung kembali jeruk yang ia jatuhkan seperti gambar di atas.'),
                      SizedBox(height: 15),
                      Image.asset('assets/bocil.png'),
                      SizedBox(height: 15),
                      text(
                          'Bagaimanakah cara Ave menentukan atau menduga banyak buah dalam satu tumpukan? Bantulah!'),
                      SizedBox(
                        height: 5,
                      ),
                      textMotivasi(
                          'Disiplin diri merupakan senjata ampuh yang harus dimiliki setiap orang yang mau sukses.')
                    ],
                  ),
                  ListView(
                    children: [
                      text(
                          'Dilihat dari Gambar 1.1, jeruk tersebut disusun berbentuk sebuah piramida. Jumlah jeruk pada bawah tumpukan akan lebih banyak dibandingkan pada susunan paling atas. Misalnya susunan jeruk tersebut disederhanakan menjadi sebuah susunan segitiga seperti Gambar 1.2. '),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/buah2.png',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      text(
                          'Banyaknya bulatan yang tersusun dari setiap kelompok dapat dituliskan dengan bilangan 1, 3, 6, 10. Bilangan tersebut membentuk barisan berpola. Setiap bilangan berurutan pada pola ini mempunyai jarak yang sama yaitu 1 satuan. '),
                      text(
                          'Jarak antar bilangan berurutan menunjukkan selisih antar bilangan.. Barisan bilangan seperti ini disebut barisan aritmatika, dengan selisih setiap dua suku berurutannya yang disebut beda.'),
                      text(
                          'Jadi, Barisan Aritmatika adalah suatu barisan dengan selisih antara dua suku yang berurutan selalu tetap.'),
                      SizedBox(
                        height: 15,
                      ),
                      textMotivasi(
                          'Kedewasaan tak datang dengan bertambahnya usia, melainkan dengan sikap menerima tanggung jawab.')
                    ],
                  ),
                  ListView(
                    children: [
                      text('Bentuk umum :'),
                      SizedBox(
                        height: 5,
                      ),
                      Image.asset('assets/m1.png'),
                      SizedBox(
                        height: 5,
                      ),
                      text('Pada barisan aritmatika berlaku :'),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/m2.png',
                            height: 30,
                          ),
                          text('Sehingga'),
                          Image.asset(
                            'assets/m3.png',
                            height: 30,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      text('Contoh  :'),
                      SizedBox(
                        height: 5,
                      ),
                      text('Tentukan beda dari siku-siku di bawah ini :'),
                      text('a.	4, 7, 10, 13, ...'),
                      text('b.	-10, -6, -2, 2, ...'),
                      text('Jawab :'),
                      text('1)	Beda = 7 – 4 = 3'),
                      text('2)	Beda = -6 – (-10) = 4'),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '1. Rumus Suku ke-n Barisan Aritmatika',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      text('Suku ke-n Barisan Aritmatika adalah :'),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset('assets/m4.png'),
                      text('Keterangan  :'),
                      text('Un	= Suku ke-n'),
                      text('a	  = Suku pertama'),
                      text('b 	 = Beda'),
                      text('n	  = Banyaknya suku'),
                      text('Contoh  :'),
                      text(
                          'Tentukan suku pertama, beda, dan suku ke-10 dari barisan 4, 7, 10, 13,...?'),
                      text('Jawab :'),
                      text('a = 4'),
                      text('b = 7 – 4 = 3'),
                      text('Un  = a + (n – 1)b'),
                      text('U10 = 4 + (10 – 1)3'),
                      text('U10 = 31'),
                      SizedBox(
                        height: 15,
                      ),
                      textMotivasi(
                          'Orang yang tidak jujur mengungkapkan kesalahannya dari diri mereka sendiri, sementara orang yang jujur tahu akan kesalahannya dan mengakuinya.')
                    ],
                  ),
                  ListView(
                    children: [
                      Text(
                        '2. Suku Tengah Barisan Aritmatika(Uk)',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      text('Barisan U1 , U2 , U3 , … , Un untuk n ganjil '),
                      text('Maka dapat di rumuskan sebagai berikut  :'),
                      Image.asset('assets/m5.png'),
                      text('Contoh  :'),
                      text(
                          'Diketahui barisan aritmatika 3, 9, 15, 21, ..., 117. Tentukan suku tengahnya ?'),
                      text('Jawab :'),
                      text('Uk = (Un+a)/2'),
                      text('Uk = (117+3)/2 = 60'),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '3. Sisipan Pada Barisan Aritmatika',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      text(
                          'Jika di antara 2 bilangan a dan Un di sisipkan bilangan '),
                      text('a,…,…,…,Un/k bilangan'),
                      text(
                          'Maka setelah disisipi k bilangan, banyaknya suku pada barisan ada (k + 2) = n'),
                      Center(
                        child: text('Un = a + (n – 1) b'),
                      ),
                      text('Pada barisan baru berlaku :'),
                      Center(
                        child: Column(
                          children: [
                            text('Un = a + (k + 2 – 1) b'),
                            text('Un = a + (k + 1) b')
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      text('Contoh  :'),
                      text(
                          'Di antara bilangan 6 dan 24 di sisipkan 8 bilangan sehingga membentuk  barisan aritmatika. Tentukan bedanya ?'),
                      text('Jawab :'),
                      text('a     = 6'),
                      text('Un  = 24'),
                      text('k     = 8'),
                      text('b     = (Un- a)/(k+1) = (24 - 6)/(8+1) = 18/9 = 2'),
                      SizedBox(
                        height: 15,
                      ),
                      textMotivasi(
                          'Selalu ada harapan bagi mereka yang berdoa dan selalu ada jalan bagi mereka yang teus berusaha.'),
                    ],
                  ),
                  ListView(
                    children: [
                      Text(
                        '2. Pengertian Deret Aritmatika',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      text(
                          'Deret Aritmatika adalah bentuk penjumlahan barisan aritmatika. Jika U1 , U2 , U3 , … , Un  adalah barisan aritmatika, maka U1 + U2 + U3 + … , Un merupakan deret aritmatika. Jumlah n suku pertama disimbolkan dengan Sn.'),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: text('Sn = U1 + U2 + U3 + … , Un'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      text('Rumus jumlah n suku pertama adalah :'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/m6.png',
                            height: 35,
                          ),
                          Image.asset(
                            'assets/m7.png',
                            height: 35,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      text('Contoh'),
                      text('Diketahui deret aritmatika 4 + 8 + 12 + 16 + ...'),
                      text('Hitung jumlah 25 suku pertama ?'),
                      text('Jawab :'),
                      text('Sn =  1/2  n [( 2a + (n - 1 )b]'),
                      text('S25 =  1/2  25 [( 2 . 4 + (25 - 1 )4]'),
                      SizedBox(
                        height: 15,
                      ),
                      textMotivasi(
                          'Hargai usaha anda, hargai diri anda. Penghargaan kepada diri sendiri akan membawa anda menuju disiplin diri.')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
