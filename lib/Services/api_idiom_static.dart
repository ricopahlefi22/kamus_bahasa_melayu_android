import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kamus_bahasa_melayu/Model/idiom.dart';

import 'package:kamus_bahasa_melayu/Services/config.dart';

class ApiIdiomStatic {
  static getHost() {
    return CONFIG.host;
  }

  static Future<List<Idiom>> getIdiom() async {
    try {
      String url = getHost() + "api/idiom";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['idiom'].cast<Map<String, dynamic>>();
        return parsed.map<Idiom>((json) => Idiom.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
