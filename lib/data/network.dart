import 'dart:convert';
import 'package:http/http.dart' as http;

class NetWork {
  final String url;
  final String url2;
  NetWork(this.url, this.url2);

  Future<dynamic> getJsonData() async {
    http.Response response =
        await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }

   Future<dynamic> getAirData() async {
    http.Response response =
        await http.get(Uri.parse(url2));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}
