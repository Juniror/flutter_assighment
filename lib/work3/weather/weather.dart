import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'Model/weatherModel.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Weathermodel? weatherData;

  Color getAqiColor(int aqi) {
    if (aqi <= 50) return Colors.green;
    if (aqi <= 100) return Colors.yellow;
    if (aqi <= 150) return Colors.orange;
    if (aqi <= 200) return Colors.red;
    if (aqi <= 300) return Colors.purple;
    return Colors.brown;
  }

  String getAqiLevel(int aqi) {
    if (aqi <= 50) return 'Good';
    if (aqi <= 100) return 'Moderate';
    if (aqi <= 150) return 'Unhealthy for Sensitive Groups';
    if (aqi <= 200) return 'Unhealthy';
    if (aqi <= 300) return 'Very Unhealthy';
    return 'Hazardous';
  }

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );
  }

  Future<void> fetchData() async {
    try {
      final position = await getLocation();
      final double lat = position.latitude;
      final double lon = position.longitude;
      final weatherToken = dotenv.env['weather_token'];
      final response = await http.get(
        Uri.parse(
          "https://api.waqi.info/feed/geo:$lat;$lon/?token=$weatherToken",
        ),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['status'] == 'ok') {
          final data = json['data'];
          setState(() {
            weatherData = Weathermodel(
              aqi: data['aqi']?.toString() ?? 'N/A',
              city: data['city']?['name']?.toString() ?? 'Unknown',
              temperature: data['iaqi']?['t']?['v']?.toString() ?? 'N/A',
            );
          });
        }
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final int aqiValue = int.tryParse(weatherData?.getAqi() ?? '') ?? 0;
    final Color aqiColor = getAqiColor(aqiValue);
    final String aqiLevel = getAqiLevel(aqiValue);

    return Scaffold(
      appBar: AppBar(title: Text("Air Quality Index (AQI)"), centerTitle: true),
      body: Center(
        child: weatherData == null
            ? Text("กดปุ่มเพื่อโหลดข้อมูล", style: TextStyle(fontSize: 18))
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      weatherData!.getCity(),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      color: aqiColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      weatherData!.getAqi(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    aqiLevel,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: aqiColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "temperature: ${weatherData!.getTemperature()}°C",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: fetchData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text("Refresh", style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
      ),
    );
  }
}
