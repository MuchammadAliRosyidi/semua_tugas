import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController judul = TextEditingController();
  TextEditingController catatan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Catatan Pagi"),
        ),
        body: Column(
          children: [
            TextField(controller: judul),
            TextField(controller: catatan),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        judul.text = '';
                        catatan.text = '';
                      });
                    },
                    child: Text("Clear")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text("Submit")),
              ],
            ),
            SizedBox(height: 10),
            Text(
              judul.text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Text(catatan.text),
            ),
          ],
        ),
      ),
    );
  }
}
