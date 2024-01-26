import '../widgets/weather_info_body.dart';

class WeatherModel {
  final String name;
  final DateTime date;
  final String image;
  final double temp;
  final String history;

  final double maxTemp;
  final double minTemp;
  final String conditionText;

  WeatherModel(
      {required this.history,
      required this.name,
      required this.date,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.conditionText});
  factory WeatherModel.jasonData(jason, data) {
    return WeatherModel(
        name: data["location"]["name"],
        date: stringTodateTime(data['current']['last_updated']),
        image: jason['day']['condition']['icon'],
        temp: jason['day']['avgtemp_c'],
        maxTemp: jason['day']['maxtemp_c'],
        minTemp: jason['day']['mintemp_c'],
        conditionText: jason['day']['condition']['text'],
        history: jason['date']);
  }
}
