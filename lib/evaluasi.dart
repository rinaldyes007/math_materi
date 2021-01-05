import 'package:flutter/material.dart';

class EvaluasiPage extends StatelessWidget {
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
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.90,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.indigo,
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  textTitle('POST - TEST'),
                  SizedBox(
                    height: 20,
                  ),
                  text(
                      '1.	Pada bulan Januari, Asep di minta ibunya untuk mulai menyisihkan uang sakunya dan disimpan dalam sebuah tabungan. Mula-mula ia menyimpan Rp2.000,00, kemudian Februari Rp2.500,00, Maret Rp3.000,00, dan seterusnya. Bantulah Asep untuk menghitung jumlah uang yang disimpan selama satu tahun pertama dan tentukan apakah permasalahan tersebut merupakan barisan atau deret aritmatika !'),
                  SizedBox(
                    height: 60,
                  ),
                  text(
                      '2.	Jumlah produksi suatu pabrik gula pada setiap bulannya membentuk deret aritmetika. Jika perusahaan A mendapatkan pesanan dari perusahaan B, dengan banyak produksi pada bulan keempat 17 ton dan jumlah produksi selama empat bulan pertama 44 ton, maka banyak produksi gula pada bulan kelima adalah ⋯⋯ ton.'),
                  SizedBox(
                    height: 60,
                  ),
                  text(
                      "3.	Sukardi mempunyai ternak ayam yang di percayakan ayahnya untuk ia kelola. Selama 30 hari, Sukardi berhasil mengumpulkan telur ayam sebanyak 19.050 butir. Jika banyak telur ayam yang dapat ia kumpulkan pada setiap harinya membentuk suatu barisan aritmetika, dan pada hari pertama ia hanya mendapatkan 20 butir telur. Ayah nya ingin mengetahui banyak telur yang ia kumpulkan pada hari terakhir. Bantulah Sukardi mengitung banyak telur yang ia dapatkan pada hari terakhir dan tentukan apakah masalah tersebut merupakan barisan atau deret aritmatika, berikan alasannya !"),
                  SizedBox(
                    height: 60,
                  ),
                  text(
                      '4.	Hasil produksi pakaian berupa kain tenun yang dibuat oleh masyarakat adat Rumah Betang Sahamk kabupaten Sintang pada bulan pertama menghasilkan 80 setel. Demi mempromosikan serta menumbuhkan rasa kecintaan terhadap produk lokal, pemerintah daerah meminta masyarakatnya memproduksi lebih banyak lagi. Setiap bulan berikutnya, hasil produksi meningkat sebanyak 10 setel. Hitunglah banyak setel pakaian hasil produksi selama 6 bulan pertama!'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
