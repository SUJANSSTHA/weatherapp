import 'package:flutter/material.dart';
import 'package:weatherapp/service/weather_services.dart';
import 'weather.dart';


class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;

  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    notifyListeners();

    try {
      _weather = await WeatherService().fetchWeather(city);
    } catch (e) {
      _weather = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
