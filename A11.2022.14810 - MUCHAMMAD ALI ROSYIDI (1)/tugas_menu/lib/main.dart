import 'package:flutter/material.dart';
import 'package:tugas_menu/detail_page.dart';
import 'package:tugas_menu/makanan.dart';
import 'package:tugas_menu/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Makanan> dataMakanan = Makanan.dummyData;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                child: Text("Pilih Menu", style: header2),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: dataMakanan.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.asset("assets/${dataMakanan[index].gambar}",
                              width: 200),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    dataMakanan[index].nama,
                                    style: header3,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Center(
                                    child:
                                        Text("Rp ${dataMakanan[index].harga}")),
                                SizedBox(height: 10),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailPage(Makanan(
                                            dataMakanan[index].nama,
                                            dataMakanan[index].harga,
                                            deskripsi:
                                                dataMakanan[index].deskripsi,
                                            gambar: dataMakanan[index].gambar,
                                          )),
                                        ),
                                      );
                                    },
                                    child: Text("Lihat Detail"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
