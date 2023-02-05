import 'package:flag_quiz/oyun.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  @override


  Widget build(BuildContext context) {

    var ekranBoyutu = MediaQuery.of(context).size;
    final double genislik = ekranBoyutu.width;
    final double yukseklik = ekranBoyutu.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Find the flag of the country"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.flag,
                size: genislik * 0.2,
                color: Colors.green),
              Padding(
                padding:  EdgeInsets.only(top : genislik / 10, bottom: genislik / 10),
                child: Text("Welcome to the quiz game",
                style: TextStyle(
                  fontSize: genislik / 15,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  minimumSize: Size(genislik / 1.4, yukseklik / 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => oyun()),
                  );
                },
                child: Text("Start"),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
