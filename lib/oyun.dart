import 'dart:collection';

import 'package:flag_quiz/Bayraklar.dart';
import 'package:flag_quiz/Bayraklardao.dart';
import 'package:flag_quiz/sonuc.dart';
import 'package:flutter/material.dart';

class oyun extends StatefulWidget {
  const oyun({Key? key}) : super(key: key);

  @override
  State<oyun> createState() => oyunState();
}

class oyunState extends State<oyun> {

// questions start
  var questions = <Bayraklar>[];
  var wrongQuestions = <Bayraklar>[];
  late Bayraklar correctQuestion;
  var allSections = HashSet<Bayraklar>();
// questions end

// counter for questions start

  int counter = 0;
  int correct = 0;
  int wrong = 0;

// counter for questions end

  // questions page start
  String flagPhoto = "placeholder.png";
  String buttonA = "";
  String buttonB = "";
  String buttonC = "";
  String buttonD = "";
  // questions page end

  @override
  void initState() {
    super.initState();
    sorulariAl();

  }

  Future<void>sorulariAl() async {

    questions = await Bayraklardao().random17Getir();
    soruYukle();
  }

  Future<void>soruYukle() async {
    correctQuestion = questions[counter];
    flagPhoto = correctQuestion.bayrak_resim;

    wrongQuestions = await Bayraklardao().random3Getir(correctQuestion.bayrak_id);
    allSections.clear();
    allSections.add(correctQuestion);
    allSections.add(wrongQuestions[0]);
    allSections.add(wrongQuestions[1]);
    allSections.add(wrongQuestions[2]);

    buttonA = allSections.elementAt(0).bayrak_ad;
    buttonB = allSections.elementAt(1).bayrak_ad;
    buttonC = allSections.elementAt(2).bayrak_ad;
    buttonD = allSections.elementAt(3).bayrak_ad;

    setState(() {

    });
  }

  void soruSayac() {
    counter = counter + 1;
    if (counter != 17) {
      soruYukle();
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => sonuc(corect: correct,)));
    }
  }

  void dogruKontrol(String buttonName) {
    if (buttonName == correctQuestion.bayrak_ad) {
      correct = correct + 1;
    } else {
      wrong = wrong + 1;
    }
  }


  @override
  Widget build(BuildContext context) {
// size of screen start
    var ekranBoyutu = MediaQuery.of(context).size;
    final double genislik = ekranBoyutu.width;
    final double yukseklik = ekranBoyutu.height;
// size of screen end

    return Scaffold(
      appBar: AppBar(
        title: Text("Game"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children : [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Correct : $correct",
              style: TextStyle(
                fontSize: genislik / 20,
                fontWeight: FontWeight.bold,
                color: Colors.green
              ),),
              Text("Wrong : $wrong",
              style: TextStyle(
                fontSize: genislik / 20,
                fontWeight: FontWeight.bold,
                color: Colors.red
              ),
              ),
            ],
          ),
          Text("Which country's flag is this?",
          style: TextStyle(
            fontSize: genislik / 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),),
          counter !=17 ? Text("${counter+1} . Question",
            style: TextStyle(
                fontSize: genislik / 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),) :Text("17 . Question",
            style: TextStyle(
                fontSize: genislik / 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),),
          Image(
            image: AssetImage("photos/$flagPhoto"),
            width: genislik / 2,
            height: yukseklik / 3,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  dogruKontrol(buttonA);
                  soruSayac();
                },
                child: Text(buttonA),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  minimumSize: Size(genislik / 2.5, yukseklik / 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  dogruKontrol(buttonB);
                  soruSayac();
                },
                child: Text(buttonB),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  minimumSize: Size(genislik / 2.5, yukseklik / 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  dogruKontrol(buttonC);
                  soruSayac();
                },
                child: Text(buttonC),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  minimumSize: Size(genislik / 2.5, yukseklik / 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  dogruKontrol(buttonD);
                  soruSayac();

                },
                child: Text(buttonC),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  minimumSize: Size(genislik / 2.5, yukseklik / 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),


        ]
      )
    );
  }
}
