import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather/models/weather_model.dart';

class WeatherServices {
  final String apikey = '7fb9eef340d261d9cf951a06329e28ad';

  Future<Weather> featchweather(String cityname) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey',
    );

    final response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
