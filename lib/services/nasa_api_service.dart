import 'dart:convert';
import 'package:http/http.dart' as http;

class NasaApiService {
  final String _baseUrl = "https://api.nasa.gov/planetary/apod";
  final String _apiKey = "Ud3xp8NlBPpNk3Xf34ZZhztMlmNdyqjrk8xoY6iT";

  Future<Map<String, dynamic>> fetchImageOfDay() async {
    final response = await http.get(Uri.parse('$_baseUrl?api_key=$_apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erro ao carregar dados da API');
    }
  }
}