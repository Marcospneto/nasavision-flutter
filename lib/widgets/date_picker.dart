import 'package:flutter/material.dart';
import 'package:flutter_apinasa/views/home.dart';
import 'package:provider/provider.dart';
import '../view_models/nasa_image_view_model.dart';

class DatePicker extends StatelessWidget {
  final bool returnToHome;
  const DatePicker({Key? key, this.returnToHome = false}) : super(key: key);
  
  Future<void> _showDatePicker(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), 
      firstDate: DateTime(2000), 
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      String formattedDate = "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
       await Provider.of<NasaImageViewModel>(context, listen: false).fetchImage(date: formattedDate);

      if (returnToHome) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home(title: 'Nasa Vision')),
          (route) => false,
        );
      }
    }
  }
   @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.calendar_today),
      color: Colors.white,
      tooltip: 'Filtrar por data',
      onPressed: () {
        _showDatePicker(context);
      },
    );
  }
}