// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.message,
    required this.idiom,
  });

  String message;
  List<Idiom> idiom;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        message: json["message"],
        idiom: List<Idiom>.from(json["idiom"].map((x) => Idiom.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "idiom": List<dynamic>.from(idiom.map((x) => x.toJson())),
      };
}

class Idiom {
  Idiom({
    required this.namaKategori,
    required this.id,
    required this.namaKata,
    required this.pelafalan,
    required this.deskripsi,
    required this.audio,
  });

  String namaKategori;
  int id;
  String namaKata;
  String pelafalan;
  String deskripsi;
  String audio;

  factory Idiom.fromJson(Map<String, dynamic> json) => Idiom(
        namaKategori: json["nama_kategori"],
        id: json["id"],
        namaKata: json["nama_kata"],
        pelafalan: json["pelafalan"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "nama_kategori": namaKategori,
        "id": id,
        "nama_kata": namaKata,
        "deskripsi": deskripsi,
      };
}
