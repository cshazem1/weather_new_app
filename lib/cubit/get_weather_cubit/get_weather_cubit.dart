import 'package:bloc/bloc.dart';

import '../../models/weather_model.dart';
import '../../service/weather_service.dart';
import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  List<WeatherModel>? data;
  GetWeatherCubit() : super(InitialWeatherState());

  getWeather({required String nameCity}) async {
    try {
      data = await WeatherService().getWeather(location: nameCity);
      emit(WeatherLoadingStates());
    } catch (e) {
      emit(WeatherFailedStates());
    }
  }
}
