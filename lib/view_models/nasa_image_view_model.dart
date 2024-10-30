import 'package:flutter/material.dart';
import '../services/nasa_api_service.dart';
import '../models/nasaimage.dart';

class NasaImageViewModel extends ChangeNotifier {
  final NasaApiService _apiService = NasaApiService();
  NasaImage? nasaImage;
  bool isLoading = false;

  Future<void> fetchImage() async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await _apiService.fetchImageOfDay();
      nasaImage = NasaImage(
        imageUrl: data['url'], 
        title: data['title'], 
        description: data['explanation'], 
        date: data['date'] ?? 'Data não disponível',
        );
    } catch (e) {
      print('Erro ao carregar a imagem: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}