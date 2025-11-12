import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;
  const WeatherCard({super.key, required this.weather});

  String formateTime(int timestemp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestemp * 1000);
    return DateFormat('hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color.fromARGB(182, 33, 149, 243),
            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset(
  weather.description.toLowerCase().contains('rain')
      ? 'assets/rain.json'
      : weather.description.toLowerCase().contains('clear')
          ? 'assets/sunny.json'
          : 'assets/cloudy.json',
  height: 150,
  width: 150,
),

              Text(
                weather.cityname,
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              SizedBox(height: 10),

              Text(
                ' ${weather.temperature.toStringAsFixed(1)}° C ',
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              Text(
                weather.description,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'humidity:${weather.humidity}%',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  Text(
                    'wind:${weather.windspeed} m/s',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.wb_sunny_outlined, color: Colors.orange),
                      Text(
                        'sunrise',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      Text(
                        formateTime(weather.sunrise),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Icon(Icons.nights_stay_outlined, color: Colors.purple),
                      Text(
                        'sunset ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      Text(
                        formateTime(weather.sunset),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
