import 'package:flutter/material.dart';
import '../models/nasaimage.dart';
import '../widgets/date_picker.dart';

class ImageDetails extends StatelessWidget{
  final NasaImage nasaImage;  
  const ImageDetails({Key? key, required this.nasaImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2E2E2E),
        appBar: AppBar(
          title: const Text(
            'Nasa Vision',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue[900],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            DatePicker(
              returnToHome: true
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  nasaImage.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text('Erro ao carregar a imagem'),
                    );
                  },
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Title: ${nasaImage.title}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Date: ${nasaImage.date}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ), 
                ),
              
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Description: ${nasaImage.description}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ); 
  }
}