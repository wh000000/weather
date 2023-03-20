import 'dart:convert';
import 'package:http/http.dart' as http;
 
Future<Map<String, dynamic>> getCurrentLocationWeather(String lat, String lon) async {
  const apiKey = '0ede74d30db711b4178a68e848c008e1';
  final url = 'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}
