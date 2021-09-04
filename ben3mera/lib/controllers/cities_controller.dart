import 'package:get/get.dart';
import 'package:weather/weather.dart';

class CitiesController extends GetxController {
  WeatherFactory _wf = new WeatherFactory("b19e82855653ad8be536a10e79c8ad3e",
      language: Language.ARABIC);


  @override
  void onInit() {
    cityLocation();
    super.onInit();
  }

  final load = false.obs;
  final citiesWeather = [].obs;

  final cities = [
    {
      'name': 'عرعر',
      'latitude': 30.9753,
      'longitude': 41.0381,
    },
    {
      'name': 'سكاكا',
      'latitude': 29.9697,
      'longitude': 40.2064,
    },
    {
      'name': 'الرياض',
      'latitude': 24.688,
      'longitude': 46.722,
    },
    {
      'name': 'نجران',
      'latitude': 17.4924,
      'longitude': 44.1277,
    },
    {
      'name': 'تبوك',
      'latitude': 28.3833,
      'longitude': 36.5833,
    },
    {
      'name': 'مكة المكرمة',
      'latitude': 21.4267,
      'longitude': 39.8261,
    },
    {
      'name': 'حائل',
      'latitude': 27.5219,
      'longitude': 41.6907,
    },
    {
      'name': 'المدينة المنورة',
      'latitude': 25.6667,
      'longitude': 39.6667,
    },
    {
      'name': 'الدمام',
      'latitude': 26.4344,
      'longitude': 50.1033,
    },
    {
      'name': 'جازان',
      'latitude': 16.8892,
      'longitude': 42.5511,
    },
    {
      'name': 'ابها',
      'latitude': 18.2164,
      'longitude': 42.5053,
    },
    {
      'name': 'بريده',
      'latitude': 26.3317,
      'longitude': 43.9717,
    },
    {
      'name': 'الباحة',
      'latitude': 20.0129,
      'longitude': 41.4677,
    },
    {
      'name': 'الطائف',
      'latitude': 21.2703,
      'longitude': 40.4158,
    },
  ];



  cityLocation() async {

    final List _list = [];

    for(int i = 0; i < cities.length; i++) {
      Map _map = {};

      Weather _weather = await _wf.currentWeatherByLocation(cities[i]['latitude'], cities[i]['longitude']);

      _map['name'] = cities[i]['name'];
      _map['latitude'] = cities[i]['latitude'];
      _map['longitude'] = cities[i]['longitude'];
      _map['icon'] = 'https://openweathermap.org/img/w/${_weather.weatherIcon}.png';
      _map['min'] = double.parse(_weather.tempMin.toString().split(' ')[0]);
      _map['max'] = double.parse(_weather.tempMax.toString().split(' ')[0]);

      _list.add(_map);


    }

    citiesWeather(_list);

    load(true);

  }



}
