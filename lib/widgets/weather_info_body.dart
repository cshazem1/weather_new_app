import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_weather_cubit/get_weather_cubit.dart';
import '../main.dart';
import '../models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var data = BlocProvider.of<GetWeatherCubit>(context).data!;
    return Scaffold(
        body: Center(
      child: SizedBox(
        height: 600,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return container(data[index], data[index].conditionText);
          },
        ),
      ),
    ));
  }
}

DateTime stringTodateTime(String value) {
  return DateTime.parse(value);
}

class container extends StatelessWidget {
  final WeatherModel weatherModel;
  final String condition;
  const container(this.weatherModel, this.condition, {super.key});
  @override
  Widget build(BuildContext context) {
    String max = weatherModel.maxTemp.round().toString();
    String min = weatherModel.minTemp.round().toString();
    String image = weatherModel.image;
    // TODO: implement build
    return Padding(
      padding:
          const EdgeInsets.only(top: 20.0, bottom: 20, right: 15, left: 10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            getThemColor(condition),
            getThemColor(condition).shade200,
            getThemColor(condition).shade100,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(60),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  weatherModel.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  weatherModel.history,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    weatherModel.temp.round().toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                      width: 150,
                      child: Image.network("https:$image", fit: BoxFit.cover)),
                  Column(
                    children: [
                      Text(
                        'Maxtemp:$max',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Mintemp:$min',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                weatherModel.conditionText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
