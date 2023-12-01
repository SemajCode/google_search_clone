import 'dart:convert';

import 'package:google_search_clone/config/api_json.dart';
import 'package:google_search_clone/config/api_keys.dart';
import 'package:http/http.dart' as http;

class ApiService {
  bool isDummydata = true;

  Future<Map<String, dynamic>> fetchData(
      {required String queryTerm, String start = '0'}) async {
    try {
      if (!isDummydata) {
        String q = queryTerm.contains(' ')
            ? queryTerm.split(' ').join('%20')
            : queryTerm;

        final response = await http.get(
          Uri.parse(
              'https://www.googleapis.com/customsearch/vi?key=$apiKey&cx=$contextKey&q=$q&start=$start'),
        );
        if (response.statusCode == 200) {
          final jsonData = response.body;
          final resData = jsonDecode(jsonData);
          return resData;
        }
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
    return apiResponse;
  }
}
