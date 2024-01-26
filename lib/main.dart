import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_new_app/views/home_view.dart';

import 'cubit/get_weather_cubit/get_weather_cubit.dart';
import 'cubit/get_weather_cubit/get_weather_states.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const CustomMaterialApp(),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        return Builder(builder: (context) {
          return MaterialApp(
            theme: ThemeData(
                appBarTheme: AppBarTheme(
                    backgroundColor: getThemColor(
                            BlocProvider.of<GetWeatherCubit>(context)
                                .data?[0]
                                .conditionText)
                        .shade100)),
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          );
        });
      },
    );
  }
}

MaterialColor getThemColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  } else {
    switch (condition) {
      case "Sunny":
        return Colors.orange;
      case 'Partly cloudy':
        return Colors.blue;
      case 'Clear':
      case 'Cloudy':
        return Colors.grey;
      case 'Overcast':
        return Colors.grey;
      case 'Mist':
        return Colors.red;
      case 'Patchy rain possible':
      case 'Patchy snow possible':
      case 'Patchy sleet possible':
      case 'Patchy freezing drizzle possible':
        return Colors.lightBlue;
      case 'Thundery outbreaks possible':
        return Colors.deepPurple;
      case 'Blowing snow':
      case 'Blizzard':
        return Colors.amber;
      case 'Fog':
        return Colors.grey;
      case 'Freezing fog':
        return Colors.grey;
      case 'Patchy light drizzle':
      case 'Light drizzle':
      case 'Freezing drizzle':
      case 'Heavy freezing drizzle':
      case 'Patchy light rain':
      case 'Light rain':
      case 'moderate rain at times':
      case 'moderate rain':
      case 'heavy rain at times':
      case 'heavy rain':
      case 'light freezing rain':
      case 'moderate or heavy freezing rain':
      case 'light sleet':
      case 'moderate or heavy sleet':
      case 'patchy light snow':
      case 'light snow':
      case 'patchy moderate snow':
      case 'moderate snow':
      case 'patchy heavy snow':
      case 'heavy snow':
        return Colors.lightBlue;
      case 'Ice pellets':
        return Colors.grey;
      case 'light rain shower':
      case 'moderate or heavy rain shower':
      case 'torrential rain shower':
      case 'light sleet showers':
      case 'moderate or heavy sleet showers':
      case 'light snow showers':
      case 'moderate or heavy snow showers':
      case 'light showers of ice pellets':
      case 'moderate or heavy showers of ice pellets':
        return Colors.lightBlue;
      case 'Patchy light rain with thunder':
      case 'Moderate or heavy rain with thunder':
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy snow with thunder':
        return Colors.deepPurple;
      default:
        {
          return Colors.amber;
        }
    }
  }
}
