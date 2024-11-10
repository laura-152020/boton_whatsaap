import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppSender extends StatelessWidget {
  final String phoneNumber; // Número de teléfono en formato internacional
  final String message; // Mensaje a enviar

  WhatsAppSender({required this.phoneNumber, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enviar Mensaje por WhatsApp'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.teal[100],
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Comunícate con nosotros',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[800],
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: Text(
                    'Enviar Mensaje a WhatsApp',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.teal, // Color del texto
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sendMessage() async {
    final Uri url = Uri.parse('https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}');
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'No se pudo abrir $url';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: WhatsAppSender(
      phoneNumber: '+573143183567', // Reemplaza con el número de teléfono
      message: 'Hola, ¿cómo estás?', // Reemplaza con tu mensaje
    ),
    theme: ThemeData(primarySwatch: Colors.teal),
  ));
}
