import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'location.dart';
import 'package:audioplayers/audioplayers.dart';

const apiKey = "3b76abda320c5c54c830f76da2fd8ed4";

class WeatherDisplayData {
  Icon weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData({required this.weatherIcon, required this.weatherImage});
}

class WeatherData {
  WeatherData({required this.locationData});

  LocationHelper locationData;
  double currentTemperature = 0;
  String currentCondition = '';
  String city = '';

  Future<void> getCurrentTemperature() async {
    Response response =
        await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?"
            "lat=${locationData.latitude}"
            "&lon=${locationData.longitude}"
            "&appid=$apiKey&units=metric"));

    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['main'];
        city = currentWeather['name'];
      } catch (e) {
        print(e);
      }
    } else {
      print("API den değer gelmiyor");
    }
  }

  WeatherDisplayData getWeatherDisplayData() {
    if (currentCondition == 'Snow') {
      // karlı gece
      var now = DateTime.now();
      if (now.hour >= 20 || now.hour < 5) {
        return WeatherDisplayData(
            weatherIcon: const Icon(
              FontAwesomeIcons.snowflake,
              size: 75.0,
              color: Colors.white,
            ),
            weatherImage: const AssetImage('assets/karlı_gece.jpg'));
      } else {
        // karlı
        return WeatherDisplayData(
            weatherIcon: const Icon(
              FontAwesomeIcons.snowflake,
              size: 75.0,
              color: Colors.white,
            ),
            weatherImage: const AssetImage('assets/kar4.jpg'));
      }
    } else if (currentCondition == 'Rain') {
      // yagmurlu
      final player = AudioCache();
      player.play('yagmur_sesi.mp3');
      return WeatherDisplayData(
          weatherIcon: const Icon(
            FontAwesomeIcons.cloudRain,
            size: 75.0,
            color: Colors.white,
          ),
          weatherImage: const AssetImage('assets/yagmur.jpg'));
    } else if (currentCondition == 'Clouds') {
      // bulutlu gece
      var now = DateTime.now();
      if (now.hour >= 20 || now.hour < 5) {
        return WeatherDisplayData(
            weatherIcon: const Icon(
              FontAwesomeIcons.cloud,
              size: 75.0,
              color: Colors.white,
            ),
            weatherImage: const AssetImage('assets/bulutlu_gece.jpg'));
      } else {
        // bulutlu
        return WeatherDisplayData(
            weatherIcon: const Icon(
              FontAwesomeIcons.cloud,
              size: 75.0,
              color: Colors.white,
            ),
            weatherImage: const AssetImage('assets/bulutlu.jpg'));
      }
    } else if (currentCondition == 'Fog') {
      // sisli
      return WeatherDisplayData(
          weatherIcon: const Icon(
            FontAwesomeIcons.eye,
            size: 75.0,
            color: Colors.white,
          ),
          weatherImage: const AssetImage('assets/sis.jpg'));
    } else if (currentCondition == 'Clear') {
      // gece gündüz kontrolü
      var now = DateTime.now();
      if (now.hour >= 20 || now.hour < 5) {
        return WeatherDisplayData(
            weatherIcon: const Icon(
              FontAwesomeIcons.moon,
              size: 75.0,
              color: Colors.white,
            ),
            weatherImage: const AssetImage('assets/gece.jpg'));
      } else {
        return WeatherDisplayData(
            weatherIcon: const Icon(
              FontAwesomeIcons.sun,
              size: 75.0,
              color: Colors.white,
            ),
            weatherImage: const AssetImage('assets/gunes.jpg'));
      }
    } else {
      var now = DateTime.now();
      if (now.hour >= 20 || now.hour < 5) {
        return WeatherDisplayData(
            weatherIcon: const Icon(
              FontAwesomeIcons.moon,
              size: 75.0,
              color: Colors.white,
            ),
            weatherImage: const AssetImage('assets/gece.jpg'));
      } else {
        return WeatherDisplayData(
            weatherIcon: const Icon(
              FontAwesomeIcons.sun,
              size: 75.0,
              color: Colors.white,
            ),
            weatherImage: const AssetImage('assets/gunes.jpg'));
      }
    }
  }
}