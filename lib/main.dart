import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi primera app Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 212, 7, 7)),
        useMaterial3: true,
        fontFamily: 'Courier', 
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 22, color: Colors.indigo, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.w900, color: Colors.red),
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      home: const MyHomePage(title: 'Desarrollo y Personalización de Aplicación con Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _mostrarMensaje() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¡hola, Me gusto esta tarea!', style: TextStyle(color: Colors.indigo)),
          content: Text('Has dado like $_counter veces.', style: const TextStyle(color: Colors.black87)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF), 
      appBar: AppBar(
        backgroundColor: Colors.redAccent, 
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Veces que has tocado el botón:',
              style: TextStyle(fontSize: 20, color: Colors.blueGrey, fontWeight: FontWeight.bold),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 72),
            ElevatedButton.icon(
              onPressed: _mostrarMensaje,
              icon: const Icon(Icons.info_outline),
              label: const Text('Mostrar mensaje'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.indigo, 
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: _resetCounter,
              child: const Text(
                'Reiniciar los likes :)',
                style: TextStyle(color: Colors.red, fontSize: 16), 
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Sumar uno',
        backgroundColor: Colors.red, 
        foregroundColor: Colors.white,
        child: const Icon(Icons.thumb_up),
      ),
    );
  }
}