import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'location.dart';
import 'package:audioplayers/audioplayers.dart';

const apiKey = "3b76abda320c5c54c830f76da2fd8ed4";


class WeatherDisplayData{
  Icon weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData({required this.weatherIcon,required this.weatherImage});
}


class WeatherData{

  final sayac;

  WeatherData({required this.locationData,required this.sayac});

  LocationHelper locationData;
  double currentTemperature = 0;
  String currentCondition = '';
  String city = '';

  Future<void> getCurrentTemperature() async {

    if (sayac == 0) {

      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?"
              "lat=${locationData.latitude}"
              "&lon=${locationData.longitude}"
              "&appid=${apiKey}&units=metric"));

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
      }
      else {
        print("API den değer gelmiyor");
      }
    }

    else if(sayac == 34){

      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?"
              "lat=41.015137&"
              "lon=28.979530&"
              "appid=${apiKey}&units=metric"));

      if(response.statusCode == 200){
        String data = response.body;
        var currentWeather = jsonDecode(data);
        try{
          currentTemperature = currentWeather['main']['temp'];
          currentCondition = currentWeather['weather'][0]['main'];
          city = 'İstanbul';
        }catch(e){
          print(e);
        }
      }
      else{
        print("API den değer gelmiyor");
      }
    }

    else if(sayac == 6){

      Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=39.925533&lon=32.866287&appid=${apiKey}&units=metric"));
      if(response.statusCode == 200){
        String data = response.body;
        var currentWeather = jsonDecode(data);
        try{
          currentTemperature = currentWeather['main']['temp'];
          currentCondition = currentWeather['weather'][0]['main'];
          city = 'Ankara';
        }catch(e){
          print(e);
        }
      }
      else{
        print("API den değer gelmiyor");
      }
    }

    else if(sayac == 35){

      Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=38.423733&lon=27.142826&appid=${apiKey}&units=metric"));
      if(response.statusCode == 200){
        String data = response.body;
        var currentWeather = jsonDecode(data);
        try{
          currentTemperature = currentWeather['main']['temp'];
          currentCondition = currentWeather['weather'][0]['main'];
          city = 'İzmir';
        }catch(e){
          print(e);
        }
      }
      else{
        print("API den değer gelmiyor");
      }
    }

    else if(sayac == 16){

      Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=40.193298&lon=29.074202&appid=${apiKey}&units=metric"));
      if(response.statusCode == 200){
        String data = response.body;
        var currentWeather = jsonDecode(data);
        try{
          currentTemperature = currentWeather['main']['temp'];
          currentCondition = currentWeather['weather'][0]['main'];
          city = 'Bursa';
        }catch(e){
          print(e);
        }
      }
      else{
        print("API den değer gelmiyor");
      }
    }

    else if(sayac == 11){

      Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=40.142573&lon=29.979330&appid=${apiKey}&units=metric"));
      if(response.statusCode == 200){
        String data = response.body;
        var currentWeather = jsonDecode(data);
        try{
          currentTemperature = currentWeather['main']['temp'];
          currentCondition = currentWeather['weather'][0]['main'];
          city = 'Bilecik';
        }catch(e){
          print(e);
        }
      }
      else{
        print("API den değer gelmiyor");
      }
    }

    else{
      Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&units=metric"));
      if(response.statusCode == 200){
        String data = response.body;
        var currentWeather = jsonDecode(data);
        try{
          currentTemperature = currentWeather['main']['temp'];
          currentCondition = currentWeather['weather'][0]['main'];
          city = currentWeather['name'];
        }catch(e){
          print(e);
        }
      }
      else{
        print("API den değer gelmiyor");
      }
    }

  }

  WeatherDisplayData getWeatherDisplayData(){
    if(currentCondition == 'Snow' ){
      // karlı gece
      var now = new DateTime.now();
      if(now.hour >= 20 || now.hour <5){
        return WeatherDisplayData(weatherIcon: Icon(
          FontAwesomeIcons.snowflake,
          size: 75.0,
          color: Colors.white,
        ),
            weatherImage: AssetImage('assets/karlı_gece.jpg'));
      }
      else {
        // karlı
        return WeatherDisplayData(weatherIcon: Icon(
          FontAwesomeIcons.snowflake,
          size: 75.0,
          color: Colors.white,
        ),
            weatherImage: AssetImage('assets/kar4.jpg'));
      }
    }
    else if(currentCondition == 'Rain'){
      // yagmurlu
      final player = AudioCache();
      player.play('yagmur_sesi.mp3');
      return WeatherDisplayData(weatherIcon: Icon(
        FontAwesomeIcons.cloudRain,
        size: 75.0,
        color: Colors.white,
      ),
          weatherImage: AssetImage('assets/yagmur.jpg'));
      }
    else if(currentCondition == 'Clouds'){
      // bulutlu gece
      var now = new DateTime.now();
      if(now.hour >= 20 || now.hour <5){
        return WeatherDisplayData(weatherIcon: Icon(
          FontAwesomeIcons.cloud,
          size: 75.0,
          color: Colors.white,
        ),
            weatherImage: AssetImage('assets/bulutlu_gece.jpg'));
      }
      else{
        // bulutlu
        return WeatherDisplayData(weatherIcon: Icon(
          FontAwesomeIcons.cloud,
          size: 75.0,
          color: Colors.white,
        ),
            weatherImage: AssetImage('assets/bulutlu.jpg'));
      }
    }
    else if(currentCondition == 'Fog'){
      // sisli
      return WeatherDisplayData(weatherIcon: Icon(
        FontAwesomeIcons.eye,
        size: 75.0,
        color: Colors.white,
      ),
          weatherImage: AssetImage('assets/sis.jpg'));
    }
    else if(currentCondition == 'Clear'){
      // gece gündüz kontrolü
      var now = new DateTime.now();
      if(now.hour >= 20 || now.hour <5){
        return WeatherDisplayData(weatherIcon: Icon(
          FontAwesomeIcons.moon,
          size: 75.0,
          color: Colors.white,
        ),
            weatherImage: AssetImage('assets/gece.jpg'));
      }
      else{
        return WeatherDisplayData(weatherIcon: Icon(
          FontAwesomeIcons.sun,
          size: 75.0,
          color: Colors.white,
        ),
            weatherImage: AssetImage('assets/gunes.jpg'));
      }
    }
    else{
      var now = new DateTime.now();
      if(now.hour >= 20 || now.hour <5){
        return WeatherDisplayData(weatherIcon: Icon(
          FontAwesomeIcons.moon,
          size: 75.0,
          color: Colors.white,
        ),
            weatherImage: AssetImage('assets/gece.jpg'));
      }
      else {
        return WeatherDisplayData(weatherIcon: Icon(
          FontAwesomeIcons.sun,
          size: 75.0,
          color: Colors.white,
        ),
            weatherImage: AssetImage('assets/gunes.jpg'));
      }
    }
  }
}