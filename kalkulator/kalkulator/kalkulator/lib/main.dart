import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biaya BBM ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BBMCalculator(),
    );
  }
}

class BBMCalculator extends StatefulWidget {
  @override
  _BBMCalculatorState createState() => _BBMCalculatorState();
}

class _BBMCalculatorState extends State<BBMCalculator> {
  // Controller untuk input teks
  TextEditingController kotaTujuanController = TextEditingController();
  TextEditingController jarakController = TextEditingController();

  // Variabel untuk menyimpan nilai pilihan
  String selectedBBM = 'Pertalite';
  String selectedKendaraan = 'Avanza';

  // Daftar pilihan BBM dan Kendaraan
  List<String> bbmOptions = ['Pertalite', 'Pertamax', 'Solar'];
  List<String> kendaraanOptions = ['Avanza', 'Xenia', 'Sigra', 'Brio'];

  // Harga BBM dan Rasio Konsumsi BBM
  Map<String, double> bbmPrices = {
    'Pertalite': 100000,
    'Pertamax': 125000,
    'Solar': 90000,
  };
  Map<String, double> konsumsiBBM = {
    'Avanza': 10,
    'Xenia': 12,
    'Sigra': 15,
    'Brio': 14
  };

  // Variabel hasil
  double totalBiaya = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biaya BBM '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: kotaTujuanController,
              decoration: InputDecoration(labelText: 'Kota Tujuan'),
            ),
            TextField(
              controller: jarakController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Jarak (km)'),
            ),
            DropdownButton<String>(
              value: selectedBBM,
              onChanged: (String? newValue) {
                setState(() {
                  selectedBBM = newValue!;
                });
              },
              items: bbmOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('Pilih BBM'),
            ),
            DropdownButton<String>(
              value: selectedKendaraan,
              onChanged: (String? newValue) {
                setState(() {
                  selectedKendaraan = newValue!;
                });
              },
              items: kendaraanOptions
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('Pilih Kendaraan'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Hitung biaya BBM
                  double jarak = double.tryParse(jarakController.text) ?? 0;
                  double hargaBBM = bbmPrices[selectedBBM] ?? 0;
                  double rasioKonsumsi = konsumsiBBM[selectedKendaraan] ?? 0;

                  totalBiaya = (jarak / rasioKonsumsi) * hargaBBM;
                });
              },
              child: Text('Hitung BBM'),
            ),
            SizedBox(height: 16),
            Text('Total Biaya BBM: ${totalBiaya.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
