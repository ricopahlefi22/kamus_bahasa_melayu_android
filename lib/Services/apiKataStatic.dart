import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kamus_bahasa_melayu/Model/kata.dart';

import 'package:kamus_bahasa_melayu/Services/config.dart';

class ApiKataStatic {
  static getHost() {
    return CONFIG.host;
  }

  static Future<List<Kata>> getKata() async {
    try {
      String url = getHost() + "/api/kata";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['kata'].cast<Map<String, dynamic>>();
        return parsed.map<Kata>((json) => Kata.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
