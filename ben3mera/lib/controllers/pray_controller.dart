import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PrayController extends GetxController {
  // data container
  var prayers = [];

  // riyadh location
  final _latitude = 24.690869.obs;
  final _longitude = 46.7965879.obs;

  @override
  onInit() {
    _getCurrentPosition();

    _getprayersTime();

    super.onInit();
  }

  void _getCurrentPosition() async {
    final currentPosition = await Geolocator.getCurrentPosition();

    _latitude(currentPosition.latitude);
    _longitude(currentPosition.longitude);
  }

  void _getprayersTime() async {
    await Geolocator.checkPermission().then((permission) async {
      if (permission == LocationPermission.denied) {}
    });

    final location = await Geolocator.getCurrentPosition();

    final myCoordinates = Coordinates(_latitude.value,
        _longitude.value); // Replace with your own location lat, lng.
    final params = CalculationMethod.umm_al_qura.getParameters();
    params.madhab = Madhab.shafi;
    final prayerTimes =
        PrayerTimes.today(myCoordinates, params, utcOffset: Duration(hours: 3));

/*
    // final qibla = Qibla(myCoordinates);
    /// Qibla direction degree (Compass/Clockwise)
    // qibla.direction;
*/

    var pray = [];

    pray.add({
      'pray_name': 'الفجر',
      'time':
          '${DateFormat('h:m').format(prayerTimes.fajr)} ${DateFormat('a').format(prayerTimes.fajr) == 'AM' ? 'ص' : 'م'}'
    });

    pray.add({
      'pray_name': 'الشروق',
      'time':
          '${DateFormat('h:m').format(prayerTimes.sunrise)} ${DateFormat('a').format(prayerTimes.sunrise) == 'AM' ? 'ص' : 'م'}'
    });

    pray.add({
      'pray_name': 'الظهر',
      'time':
          '${DateFormat('h:m').format(prayerTimes.dhuhr)} ${DateFormat('a').format(prayerTimes.dhuhr) == 'AM' ? 'ص' : 'م'}'
    });

    pray.add({
      'pray_name': 'العصر',
      'time':
          '${DateFormat('h:m').format(prayerTimes.asr)} ${DateFormat('a').format(prayerTimes.asr) == 'AM' ? 'ص' : 'م'}'
    });

    pray.add({
      'pray_name': 'المغرب',
      'time':
          '${DateFormat('h:m').format(prayerTimes.maghrib)} ${DateFormat('a').format(prayerTimes.maghrib) == 'AM' ? 'ص' : 'م'}'
    });

    pray.add({
      'pray_name': 'العشاء',
      'time':
          '${DateFormat('h:m').format(prayerTimes.isha)} ${DateFormat('a').format(prayerTimes.isha) == 'AM' ? 'ص' : 'م'}'
    });

    prayers = pray;

    update();

  }
  
  

  
}
