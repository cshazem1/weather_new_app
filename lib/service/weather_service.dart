import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  WeatherService();
  String baseUrl = 'https://api.weatherapi.com/v1';
  String apiKey = 'f9688b43cb2f4d90b35205411231705';
  Dio dio = Dio();
  List<WeatherModel> article = [];
  Future<List<WeatherModel>> getWeather({required String location}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$location&days=10");
      Map<String, dynamic> jason = response.data;
      List<dynamic> list = jason['forecast']['forecastday'];

      for (var list in list) {
        WeatherModel weatherModel = WeatherModel.jasonData(list, jason);
        article.add(weatherModel);
      }
      return article;
    } on DioException catch (e) {
      String error =
          e.response?.data['error']['message'] ?? "ops there was an error";
      throw Exception(error);
      // TODO
    } catch (e) {
      log(e.toString());
      throw Exception("ops");
    }
  }
}
