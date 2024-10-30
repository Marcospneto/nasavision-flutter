import 'package:flutter/material.dart';
import 'package:flutter_apinasa/views/image_details.dart';
import 'package:provider/provider.dart';
import '../view_models/nasa_image_view_model.dart';

class Home extends StatelessWidget {
  final String title;
  const Home({super.key, required this.title});

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NasaImageViewModel()..fetchImage(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue[900],
          actions: [
            IconButton(
              icon: const Icon(Icons.calendar_today),
              color: Colors.white,
              tooltip: 'Filtrar por data',
              onPressed: () {
                print('Botão de filtro pressionado');
              },
            )
          ],
        ),
        body: Consumer<NasaImageViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (viewModel.nasaImage != null) {
              return Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => ImageDetails(nasaImage: viewModel.nasaImage!),
                          ),
                        );
                      },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          viewModel.nasaImage!.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Text('Erro ao carregar a imagem')
                            );
                          },
                        ),
                      ),
                    ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Color(0xFF2E2E2E),
                    padding: const EdgeInsets.all(14),
                    child: Text(
                      viewModel.nasaImage!.date ?? 'Data não disponível',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ); 
            } else {
              return const Text('Erro ao carregar a imagem');
            }
          },
        ),
      ),
    );
  }
}