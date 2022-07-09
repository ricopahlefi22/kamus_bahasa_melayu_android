// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.message,
    required this.index,
  });

  String message;
  List<Index> index;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        message: json["message"],
        index: List<Index>.from(json["index"].map((x) => Index.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "index": List<dynamic>.from(index.map((x) => x.toJson())),
      };
}

class Index {
  Index({
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

  factory Index.fromJson(Map<String, dynamic> json) => Index(
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
        "pelafalan": pelafalan,
        "deskripsi": deskripsi,
        "audio": audio,
      };
}
