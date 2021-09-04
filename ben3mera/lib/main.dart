import 'package:ben3mera/views/azkar/azkar_widget.dart';
import 'package:ben3mera/views/convert-date/convert_date_widget.dart';
import 'package:ben3mera/views/home/home_widget.dart';
import 'package:ben3mera/views/master.dart';
import 'package:ben3mera/views/ngom/ngm_pdf.dart';
import 'package:ben3mera/views/ngom/ngom_widget.dart';
import 'package:ben3mera/views/pray/pray_widget.dart';
import 'package:ben3mera/views/weather/radar_widget.dart';
import 'package:ben3mera/views/weather/weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'controllers/location_controller.dart';

import 'views/news/news_widget.dart';
import 'views/weather/cities_widget.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final LocationController _locationController =
        Get.put(LocationController());

    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("d2e826fc-2b9e-4540-b980-9df164881b6a");

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ben3mera',
      color: Color(0xFFC5C3C3),
      textDirection: TextDirection.rtl,
      transitionDuration: Duration(milliseconds: 500),
      // onReady: () => _locationController.config(),
      theme: ThemeData(
        primaryColor: Color(0xFFC5C3C3),
        fontFamily: 'Tajawal',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // textDirection: TextDirection.rtl,
      initialRoute: 'home',
      getPages: [
        GetPage(
          name: 'ngom',
          page: () => Master(
            content: NgomWidget(),
            index: 0,
            title: 'التقويم',
          ),
        ),
        GetPage(
          name: 'news',
          page: () => Master(
            content: NewsWidget(),
            index: 1,
            title: 'الأخبار',
          ),
        ),
        GetPage(
          name: 'home',
          page: () => Master(
            content: HomeWidget(),
            index: 2,
            title: '',
          ),
        ),
        GetPage(
          name: 'weather',
          page: () => Master(
            content: WeatherWidget(),
            index: 3,
            title: 'الطقس',
          ),
        ),
        GetPage(
          name: 'weather-city',
          page: () => Master(
            content: CitiesWidget(),
            index: 3,
            title: 'عرض المدن',
          ),
        ),
        GetPage(
          name: 'radar',
          page: () => Master(
            content: RadarWidget(),
            index: 4,
            title: 'رادار الأمطار',
          ),
        ),
        GetPage(
          name: 'pray',
          page: () => Master(
            content: PrayWidget(),
            index: 5,
            title: 'مواقيت الصلاة',
          ),
        ),
        GetPage(
          name: 'azkar',
          page: () => Master(
            content: AzkarWidget(),
            index: 10,
            title: 'الأذكار',
          ),
        ),
        GetPage(
          name: 'convert-date',
          page: () => Master(
            content: ConvertDateWidget(),
            index: 11,
            title: 'تحويل التاريخ',
          ),
        ),
        GetPage(
          name: 'pdf',
          page: () => NgmPdf(),
        ),
      ],
    );
  }
}
