import 'package:flutter/material.dart';

class KIKDPage extends StatelessWidget {
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
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.indigo,
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  textTitle('Kompetensi Inti'),
                  SizedBox(
                    height: 20,
                  ),
                  text(
                      '1.  	Menghayati dan mengamalkan ajaran agama yang dianutnya.'),
                  SizedBox(
                    height: 20,
                  ),
                  text(
                      '2.	  Menghayati dan mengamalkan perilaku jujur, disiplin, santun, peduli (gotong royong, kerja sama, toleran, damai), bertanggung-jawab, responsif, dan proaktif melalui keteladanan, pemberian nasihat, penguatan, pembiasaan, dan pengkondisian secara berkesinambungan serta menunjukkan sikap sebagai bagian dari solusi atas berbagai permasalahan dalam berinteraksi secara efektif dengan lingkungan sosial dan alam serta dalam menempatkan diri sebagai cerminan bangsa dalam pergaulan dunia'),
                  SizedBox(
                    height: 20,
                  ),
                  text(
                      '3.  	Memahami, menerapkan, menganalisis, dan mengevaluasitentang pengetahuan faktual, konseptual, operasional dasar, dan metakognitif sesuai dengan bidang dan lingkup kajian matematikapada tingkat teknis, spesifik, detil, dan kompleks, berkenaan dengan ilmu pengetahuan, teknologi, seni, budaya, dan humaniora dalam konteks pengembangan potensi diri sebagai bagian dari keluarga, sekolah, dunia kerja, warga masyarakat nasional, regional, dan internasional.'),
                  SizedBox(
                    height: 20,
                  ),
                  text(
                      '4.	  Melaksanakan tugas spesifik dengan menggunakan alat, informasi, dan prosedur kerja yang lazim dilakukan serta memecahkan masalah sesuai dengan bidang kajian matematika.'),
                  SizedBox(
                    height: 20,
                  ),
                  text(
                      '5.  	Menampilkan kinerja di bawah bimbingan dengan mutu dan kuantitas yang terukur sesuai dengan standar kompetensi kerja.'),
                  SizedBox(
                    height: 20,
                  ),
                  text(
                      '6. Menunjukkan keterampilan menalar, mengolah, dan menyaji secara efektif, kreatif, produktif, kritis, mandiri, kolaboratif, komunikatif, dan solutif dalam ranah abstrak terkait dengan pengembangan dari yang dipelajarinya di sekolah, serta mampu melaksanakan tugas spesifik di bawah pengawasan langsung.'),
                  SizedBox(
                    height: 20,
                  ),
                  text(
                      '7.   Menunjukkan keterampilan mempersepsi, kesiapan, meniru, membiasakan, gerak mahir, menjadikan gerak alami dalam ranah konkret terkait dengan pengembangan dari yang dipelajarinya di sekolah, serta mampu melaksanakan tugas spesifik di bawah pengawasan langsung.'),
                  SizedBox(
                    height: 40,
                  ),
                  textTitle('Kompetensi Dasar'),
                  SizedBox(
                    height: 20,
                  ),
                  text('3.5   Menganalisis barisan dan deret aritmatika'),
                  SizedBox(
                    height: 20,
                  ),
                  text(
                      '4.8.  Menyelesaikan masalah kontekstual yang berkaitan dengan barisan dan deret aritmatika')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
