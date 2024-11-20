import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NasaApiService {
  final String _baseUrl = "https://api.nasa.gov/planetary/apod";
  final String _apiKey = "Ud3xp8NlBPpNk3Xf34ZZhztMlmNdyqjrk8xoY6iT";

  Future<Map<String, dynamic>> fetchImageOfDay(String? date) async {
    final url = date != null ?  '$_baseUrl?api_key=$_apiKey&date=$date' : '$_baseUrl?api_key=$_apiKey'; 
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Não foi possível carregar os dados da API');
      }  
    } catch (e) {
      throw Exception('Erro ao conectar à API: $e');
    }
    
  }
}