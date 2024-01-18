import 'package:flutter/material.dart';
import 'package:tugas_menu/main.dart';
import 'package:tugas_menu/style.dart';

class PesanPage extends StatelessWidget {
  final String nama;
  final int harga;
  final int qty;
  const PesanPage(this.nama, this.harga, this.qty, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text("Pesanan", style: header1),
              ),
              SizedBox(height: 200),
              Center(
                child: Text(nama, style: header3),
              ),
              Center(
                child: Text("${harga} x ${qty}", style: header3),
              ),
              SizedBox(height: 20),
              Center(
                child: Text("Pesanan Disimpan", style: header3),
              ),
              Center(
                child: Text("Total Bayar: Rp ${harga * qty}", style: header2),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ),
                    );
                  },
                  child: Text("Ke menu utama"))
            ],
          ),
        ),
      ),
    );
  }
}
