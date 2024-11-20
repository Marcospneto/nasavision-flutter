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
      final formattedDate = date ?? DateFormat('yyyy-MM-dd').format(DateTime.now());

      final data = await _apiService.fetchImageOfDay(formattedDate);
      String teste = 'Data nao disponivel';
      if (data['date'] != null) {
        DateTime parsedDate = DateTime.parse(data['date']);
        teste = DateFormat('d/MM/yyyy').format(parsedDate);
      }
      nasaImage = NasaImage(
        imageUrl: data['url'], 
        title: data['title'], 
        description: data['explanation'], 
        date: formattedDate,
        );
    } catch (e) {
      print('Erro ao carregar a imagemm: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}