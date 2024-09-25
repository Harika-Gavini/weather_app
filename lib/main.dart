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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: WeatherScreen(),
      ),
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

    // Simulate fetching weather values
    setState(() {
      _cityName = city;
      _temperature = 'Temperature: --'; // Placeholder
      _weatherCondition = 'Condition: --'; // Placeholder
    });

    // Generate a random temperature between 15°C and 30°C (not displayed)
    final random = Random();
    final temperature = random.nextInt(16) + 15; // 15 to 30
    final conditions = ['Sunny', 'Cloudy', 'Rainy'];
    final weatherCondition = conditions[random.nextInt(conditions.length)];

    // Log the simulated values
    print('City: $city');
    print('Temperature: ${temperature}°C');
    print('Condition: $weatherCondition');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _cityController,
            decoration: InputDecoration(
              labelText: 'Enter City Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _fetchWeather,
            child: Text('Fetch Weather'),
          ),
          SizedBox(height: 32.0),
          Text(
            'City: $_cityName',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            _temperature,
            style: TextStyle(fontSize: 18),
          ),
          Text(
            _weatherCondition,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
