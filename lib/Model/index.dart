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
    required this.deskripsi,
  });

  String namaKategori;
  int id;
  String namaKata;
  String deskripsi;

  factory Index.fromJson(Map<String, dynamic> json) => Index(
        namaKategori: json["nama_kategori"],
        id: json["id"],
        namaKata: json["nama_kata"],
        deskripsi: json["deskripsi"],
      );

  Map<String, dynamic> toJson() => {
        "nama_kategori": namaKategori,
        "id": id,
        "nama_kata": namaKata,
        "deskripsi": deskripsi,
      };
}
