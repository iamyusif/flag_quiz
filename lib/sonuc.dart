// coder : @iamyusifh (instagram)

import 'package:flutter/material.dart';

class sonuc extends StatefulWidget {

  int corect;

  sonuc({required this.corect});

  State<sonuc> createState() => _sonucState();
}

class _sonucState extends State<sonuc> {
  @override
  Widget build(BuildContext context) {
    var ekranBoyutu = MediaQuery.of(context).size;
    final double genislik = ekranBoyutu.width;
    final double yukseklik = ekranBoyutu.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: genislik / 2,
            ),
            Padding(
              padding:  EdgeInsets.only(top: yukseklik / 20,bottom: yukseklik / 20),
              child: Text("Correct : ${widget.corect}",
              style: TextStyle(
                fontSize: genislik / 15,
                fontWeight: FontWeight.bold,
                color: Colors.green
              ),),
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: yukseklik / 20),
              child: Text("Wrong : ${17 - widget.corect}",
              style: TextStyle(
                fontSize: genislik / 15,
                fontWeight: FontWeight.bold,
                color: Colors.red
              ),),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Play Again"),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                minimumSize: Size(genislik / 2, yukseklik / 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
