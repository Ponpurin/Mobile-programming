import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:w8_2/open_weather_apikey.dart';
import '../data_classes/weather_data/weather_data.dart';

class OpenWeather {
  static Future<WeatherData> fetchWeatherDataFromCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest);
    String lat = position.latitude.toStringAsFixed(3);
    String lon = position.longitude.toStringAsFixed(3);
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$kApikey';
    return await _fetch(url);
  }

  static Future<WeatherData> fetchWeatherDataFromCity(
      {required cityName}) async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kApikey';
    try {
      return await _fetch(url);
    } catch (e) {
      return Future.error(e);
    }
  }
}

//Method
Future<WeatherData> _fetch(String url) async {
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return WeatherData.fromJson(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}
