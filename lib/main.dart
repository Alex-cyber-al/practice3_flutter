import 'package:flutter/material.dart';
import 'contact_card.dart'; // Імпортуємо наш віджет картки контакту

void main() {
  runApp(const BusinessCardApp());
}

class BusinessCardApp extends StatefulWidget {
  const BusinessCardApp({super.key});

  @override
  State<BusinessCardApp> createState() => _BusinessCardAppState();
}

class _BusinessCardAppState extends State<BusinessCardApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Візитівка розробника',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Візитівка'),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: _toggleTheme,
            ),
          ],
        ),
        body: const SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.blueGrey,
                child: Icon(Icons.person, size: 50.0, color: Colors.white),
              ),
              Text(
                'Олександр Юрасов',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(fontSize: 18.0, color: Colors.grey, letterSpacing: 1.5),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(color: Colors.grey),
              ),
              ContactCard(icon: Icons.phone, text: '+380 98 456 61 96'),
              ContactCard(icon: Icons.email, text: 'o.yurasov@istu.edu.ua'),
              ContactCard(icon: Icons.code, text: 'https://github.com/Alex-cyber-al'),
            ],
          ),
        ),
      ),
    );
  }
}
