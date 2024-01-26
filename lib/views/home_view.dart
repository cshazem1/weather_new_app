import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_new_app/views/search_view.dart';
import '../cubit/get_weather_cubit/get_weather_cubit.dart';
import '../cubit/get_weather_cubit/get_weather_states.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ));
                },
                icon: const Icon(Icons.search)),
          ],
          title: const Text("Weather App"),
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            if (state is InitialWeatherState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadingStates) {
              return const WeatherInfoBody();
            } else {
              return const Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Error, please try again",
                    style: TextStyle(fontSize: 28),
                  ),
                  Text(
                    "⚠⚠⚠",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ));
            }
          },
        ));
  }
}
