import 'package:flutter/material.dart';
import 'package:flutter_apinasa/views/home.dart';
import 'package:provider/provider.dart';
import 'view_models/nasa_image_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nasa Vision',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black12),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => NasaImageViewModel(),
        child: const Home(title: 'Nasa Vision'),
      ),
    );
  }
}

