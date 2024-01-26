import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_weather_cubit/get_weather_cubit.dart';
import '../main.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: const Text("Search City")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: TextField(
                keyboardType: TextInputType.text,
                onSubmitted: (value) async {
                  var getWeatherCuibt =
                      BlocProvider.of<GetWeatherCubit>(context);
                  getWeatherCuibt.getWeather(nameCity: value);
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    hintText: "Enter city name ",
                    label: const Text(
                      "Search",
                      style: TextStyle(fontSize: 20),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 36, horizontal: 18),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: getThemColor(
                                    BlocProvider.of<GetWeatherCubit>(context)
                                        .data?[0]
                                        .conditionText)
                                .shade100)))),
          ),
        ));
  }
}
