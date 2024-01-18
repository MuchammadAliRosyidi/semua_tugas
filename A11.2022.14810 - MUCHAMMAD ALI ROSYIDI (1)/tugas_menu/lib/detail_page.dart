import 'package:flutter/material.dart';
import 'package:tugas_menu/makanan.dart';
import 'package:tugas_menu/pesan_page.dart';
import 'package:tugas_menu/style.dart';

class DetailPage extends StatefulWidget {
  final Makanan makanan;

  const DetailPage(this.makanan, {super.key});
  @override
  State<DetailPage> createState() => _DetailPageState(makanan);
}

class _DetailPageState extends State<DetailPage> {
  final Makanan makanan;
  _DetailPageState(this.makanan);

  TextEditingController qtyCtrl = TextEditingController(text: "0");
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset("assets/${makanan.gambar}"),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  makanan.nama,
                  style: header1,
                ),
              ),
              Center(
                child: Text(
                  makanan.deskripsi ?? '',
                ),
              ),
              Center(
                child: Text(
                  "Harga : Rp ${makanan.harga.toString()}",
                  style: header4,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text("Tentukan jumlah pesanan"),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if (qty > 1) {
                                      qty--;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 16,
                                )),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.white),
                              child: Text(
                                qty.toString(),
                                style: header4,
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    qty++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 16,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 50),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Total Bayar: Rp ${qty * makanan.harga}",
                  style: header3,
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PesanPage(makanan.nama, makanan.harga, qty),
                      ),
                    );
                  },
                  child: Text("PESAN"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
