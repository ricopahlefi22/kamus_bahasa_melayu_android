import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kamus_bahasa_melayu/Model/index.dart';

import 'package:kamus_bahasa_melayu/Services/config.dart';

class ApiIndexStatic {
  static getHost() {
    return CONFIG.host;
  }

  static Future<List<Index>> getIndex() async {
    try {
      String url = getHost() + "/api/index";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['index'].cast<Map<String, dynamic>>();
        return parsed.map<Index>((json) => Index.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
