import 'package:flutter/material.dart';

class ErrorModal extends StatelessWidget {
  final String message;
  final VoidCallback onClose;

  const ErrorModal({
    Key? key,
    required this.message,
    required this.onClose,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          color: Colors.black.withOpacity(0.6),
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: const Text(
                  'ATENÇÃO',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(message),
                      const SizedBox(height: 16),
                      const Text(
                        'FALHA AO CARREGAR IMAGEM REFERENTE A ESSA DATA',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
