abstract class WeatherState{}
class WeatherInitial extends WeatherState{}

class Loading extends WeatherState{}
class WeatherSuccess extends WeatherState{}
class WeatherFailure extends WeatherState{}