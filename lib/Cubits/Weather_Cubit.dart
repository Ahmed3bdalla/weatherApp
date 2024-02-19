import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Cubits/Weather_States.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

class WeahterCubit extends Cubit<WeatherState> {
  WeahterCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  WeatherModel? weatherData;
  String? cityName;

  getWeatherData({required String cityName}) async {
    try {
      emit(Loading());
      weatherData = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
