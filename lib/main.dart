import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Cubits/Weather_Cubit.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/services/weather_service.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeahterCubit(WeatherService());
      },
      child:const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:
            BlocProvider.of<WeahterCubit>(context).weatherData == null
                ? Colors.blue
                : BlocProvider.of<WeahterCubit>(context)
                    .weatherData!
                    .getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
