import 'package:flag_quiz/VeritabaniYardimcisi.dart';

import 'Bayraklar.dart';


class Bayraklardao {

Future<List<Bayraklar>> random17Getir() async {
  var db = await VeritabaniYardimcisi.veritabaniErisim();

  List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 17");

  return List.generate(maps.length, (i) {
    var satir = maps[i];
    return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
  });
  }

  // yalnis cevaplar icin

  Future<List<Bayraklar>> random3Getir(int bayrak_id) async {
  var db = await VeritabaniYardimcisi.veritabaniErisim();

List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT * FROM bayraklar WHERE bayrak_id != $bayrak_id ORDER BY RANDOM() LIMIT 3");

  return List.generate(maps.length, (i) {
    var satir = maps[i];
    return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
  });
  }
  }
