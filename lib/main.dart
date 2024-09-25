import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
          secondary: Colors.blueAccent,
        ),
        useMaterial3: true,
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();

  String _cityName = '';
  String _temperature = 'Temperature: --';
  String _weatherCondition = 'Condition: --';

  void _fetchWeather() {
    final city = _cityController.text;
    final random = Random();
    final temperature = random.nextInt(16) + 15; // 15 to 30
    final conditions = ['Sunny', 'Cloudy', 'Rainy'];
    final weatherCondition = conditions[random.nextInt(conditions.length)];

    setState(() {
      _cityName = city;
      _temperature = 'Temperature: ${temperature}°C';
      _weatherCondition = 'Condition: $weatherCondition';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.pexels.com/photos/1118873/pexels-photo-1118873.jpeg?cs=srgb&dl=pexels-jplenio-1118873.jpg&fm=jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'Enter City Name',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8), // Slightly transparent background
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _fetchWeather,
                child: Text('Fetch Weather'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 32.0),
              Text(
                'City: $_cityName',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                _temperature,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                _weatherCondition,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
