 class WeatherModel {
  final String cityname;
  final double temperature;
  final String description;
  final int humidity;
  final double windspeed;
  final int sunrise;
  final int sunset;

  WeatherModel({
    required this.cityname,
    required this.description,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
    required this.temperature,
    required this.windspeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityname: json['name'],
    description: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      temperature: (json['main']['temp'] - 273.15),
      windspeed: (json['wind']['speed'])
    );
  }
}
