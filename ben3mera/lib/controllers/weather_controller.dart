import 'package:ben3mera/controllers/location_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class WeatherController extends GetxController {

  final _locationController = Get.find<LocationController>();

  final dateNow = '--'.obs;
  final placeName = '--'.obs;
  final temp = '--'.obs;
  final tempMin = '--'.obs;
  final tempMax = '--'.obs;
  final sunrise = '--'.obs;
  final sunset = '--'.obs;
  final icon = '--'.obs;
  final windSpeed = '--'.obs;
  final weatherStatus = '--'.obs;
  final humidity = '--'.obs;
  final pressure = '--'.obs;
  final windGust = '--'.obs;
  final days = [].obs;
  final latitude = 21.2703.obs;
  final longitude = 40.4158.obs;

  Map arabicDays = {
    'Monday': 'الإثنين',
    'Tuesday': 'الثلاثاء',
    'Wednesday': 'الأربعاء',
    'Thursday': 'الخميس',
    'Friday': 'الجمعة',
    'Saturday': 'السبت',
    'Sunday': 'الأحد'
  };

  WeatherFactory _wf = new WeatherFactory("b19e82855653ad8be536a10e79c8ad3e",
      language: Language.ARABIC);

  @override
  void onInit() {

    this.latitude.value = _locationController.latitude.value;
    this.longitude.value = _locationController.longitude.value;

    HijriCalendar.setLocal('ar');



    getWeather();

    super.onInit();
  }

  void getWeather() async {
    List<Weather> _weatherFiveDay =
        await _wf.fiveDayForecastByLocation(latitude.value, longitude.value);

    Weather _weather = await _wf.currentWeatherByLocation(latitude.value, longitude.value);
    // config vars
    final double temVar =
        double.parse(_weather.tempFeelsLike.toString().split(' ')[0]);
    final double temMinVar =
        double.parse(_weather.tempMin.toString().split(' ')[0]);
    final double temMaxVar =
        double.parse(_weather.tempMax.toString().split(' ')[0]);

    var today = HijriCalendar.now();

    dateNow('${today.toFormat("DD dd MMMM ")}');

    placeName(_weather.areaName);
    temp('${(temVar).round()}');
    tempMax('${(temMaxVar).round()}');
    tempMin('${(temMinVar).round()}');
    sunrise(
        '${_weather.sunrise.hour > 12 ? _weather.sunrise.hour - 12 : _weather.sunrise.hour}:${_weather.sunrise.minute} ${_weather.sunrise.hour > 12 ? 'م' : 'ص'}');
    sunset(
        '${_weather.sunset.hour > 12 ? _weather.sunset.hour - 12 : _weather.sunset.hour}:${_weather.sunset.minute} ${_weather.sunset.hour > 12 ? 'م' : 'ص'}');
    icon('https://openweathermap.org/img/w/${_weather.weatherIcon}.png');
    windSpeed('${_weather.windSpeed}');
    weatherStatus('${_weather.weatherDescription}');
    humidity('${_weather.humidity}');
    pressure('${_weather.pressure}');
    windGust('${_weather.windGust}');

    final _list = [];
    // 5 days
    for (int i = 8; i < _weatherFiveDay.length; i += 8) {
      var date = _weatherFiveDay[i + 1].date;

      final _map = {
        'dayName': arabicDays[
            '${DateFormat('EEEE').format(_weatherFiveDay[i + 1].date)}'],
        'temMin': (double.parse(
                _weatherFiveDay[i + 1].tempMin.toString().split(' ')[0]))
            .round(),
        'temMax': (double.parse(
                _weatherFiveDay[i + 1].tempMax.toString().split(' ')[0]))
            .round(),
        'icon':
            'https://openweathermap.org/img/w/${_weatherFiveDay[i + 1].weatherIcon}.png',
        'date': '${date.month}/${date.day}',
      };

      _list.add(_map);
    }

    days(_list);
  }
}
