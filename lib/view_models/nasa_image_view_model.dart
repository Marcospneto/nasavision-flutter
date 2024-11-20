import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/nasa_api_service.dart';
import '../models/nasaimage.dart';

class NasaImageViewModel extends ChangeNotifier {
  final NasaApiService _apiService = NasaApiService();
  NasaImage? nasaImage;
  bool isLoading = false;

  Future<void> fetchImage({String? date}) async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await _apiService.fetchImageOfDay(date);

      String formattedDate = 'Data não disponível';
      if (data['date'] != null) {
        DateTime parsedDate = DateTime.parse(data['date']);
        formattedDate = DateFormat('d/MM/yyyy').format(parsedDate);
      }
      nasaImage = NasaImage(
        imageUrl: data['url'], 
        title: data['title'], 
        description: data['explanation'], 
        date: formattedDate,
        );
    } catch (e) {
      print('Erro ao carregar a imagem: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}