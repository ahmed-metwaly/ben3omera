import 'package:ben3mera/controllers/weather_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

class WeatherWidget extends StatelessWidget {
  final _controller = Get.put(WeatherController());

  WeatherWidget({latitude, longitude}) {
    print(latitude);
    print(longitude);

    if (latitude != null && longitude != null) {
      _controller.latitude(latitude);
      _controller.longitude(longitude);
      _controller.getWeather();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            // gradient: LinearGradient(colors: [
            //   // Colors.white12.withOpacity(.9),
            //   // // Colors.blue[900].withOpacity(.5),
            //   Colors.blue[900].withOpacity(1),
            //   Colors.blue[900].withOpacity(1),
            // ], begin: Alignment.center, end: Alignment.bottomCenter, ),
            color: Colors.white.withOpacity(.2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(27.0),
              topRight: Radius.circular(27.0),
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(children: [
                          InkWell(
                            onTap: () => Get.toNamed('weather-city'),
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 20.0, left: 50),
                              alignment: Alignment.center,
                              width: 50.0,
                              height: 50.0,
                              child: Icon(
                                Icons.settings_rounded,
                                color: Colors.black54,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                color: Colors.blue.withOpacity(.5),
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width,
                            margin: const EdgeInsets.only(top: 10.0),
                            alignment: Alignment.center,
                            child: Obx(
                              () => Text(
                                '${_controller.placeName.value}',
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 40.0,
                      left: 30.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 50.0),
                                    alignment: Alignment.bottomRight,
                                    child: Obx(
                                      () => Text(
                                        _controller.tempMax.value,
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 50.0,
                                            height: .8,
                                            fontFamily: 'ArabicTwo'),

                                        // textScaleFactor: 5.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                      height: 50.0,
                                      child: FaIcon(
                                        FontAwesomeIcons.circle,
                                        color: Colors.blue[900],
                                        size: 12,
                                      )),
                                ],
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(right: 35.0),
                                width: 55.0,
                                height: 5.0,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.blue),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomRight,
                                          child: Obx(
                                            () => Text(
                                              _controller.tempMin.value,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30.0,
                                                  fontFamily: 'ArabicTwo'),
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: 25.0,
                                            alignment: Alignment.topLeft,
                                            child: FaIcon(
                                              FontAwesomeIcons.circle,
                                              color: Colors.black,
                                              size: 8,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomRight,
                                          child: Obx(
                                            () => Text(
                                              _controller.temp.value,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30.0,
                                                  fontFamily: 'ArabicTwo'),
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: 25.0,
                                            alignment: Alignment.topLeft,
                                            child: FaIcon(
                                              FontAwesomeIcons.circle,
                                              color: Colors.black,
                                              size: 8,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: SizedBox(
                          width: 10.0,
                        )),
                        Expanded(
                          child: Container(
                            height: 165.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(0.0),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Obx(
                                    () => Image.network(
                                      '${_controller.icon.value}',
                                      width: 100.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    _controller.weatherStatus.value,
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: Center(
                      child: Obx(
                        () => Text(
                          _controller.dateNow.value,
                          style: TextStyle(
                              color: Colors.blue[600],
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),

                  // row of days
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(27.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < _controller.days.length; i++)
                            Expanded(
                              child: Column(
                                children: [
                                  Text('${_controller.days[i]['dayName']}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '${_controller.days[i]['date']}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'ArabicTwo',
                                    ),
                                  ),
                                  Image.network(
                                    '${_controller.days[i]['icon']}',
                                    width: 50.0,
                                    height: 50.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '${_controller.days[i]['temMin']} ْ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'ArabicTwo',
                                    ),
                                  ),
                                  Text('${_controller.days[i]['temMax']} ْ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'ArabicTwo',
                                      )),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),

                  // Sunrise and sunset
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'الشروق',
                                style: TextStyle(
                                    color: Colors.blue[900], fontSize: 16.0),
                              ),
                              Obx(
                                () => Text(
                                  _controller.sunrise.value,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontFamily: 'ArabicTwo',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Image.asset(
                              'assets/images/sunrisesunset.png',
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'الغروب',
                                style: TextStyle(
                                    color: Colors.blue[900], fontSize: 16.0),
                              ),
                              Obx(
                                () => Text(
                                  _controller.sunset.value,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontFamily: 'ArabicTwo',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 50.0),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/windspeed.png',
                                width: 50.0,
                                height: 50.0,
                                color: Colors.blue[900],
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                'سرعة الرياح',
                                style: TextStyle(
                                  color: Colors.blue[800],
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Obx(
                                () =>
                                    Text('${_controller.windSpeed.value}  كم/س',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'ArabicTwo',
                                          fontWeight: FontWeight.w800,
                                        )),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 1.0,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/windgust.png',
                                  width: 50.0,
                                  height: 50.0,
                                  color: Colors.blue[900]),
                              SizedBox(height: 20.0),
                              Text(
                                'اتجاه الرياح',
                                style: TextStyle(
                                    color: Colors.blue[800],
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20.0),
                              Obx(
                                () => Text('${_controller.windGust.value != 'null' ? _controller.windGust.value : '--' }',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'ArabicTwo',
                                      fontWeight: FontWeight.w800,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 50.0),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/Humidity.png',
                                  width: 50.0,
                                  height: 50.0,
                                  color: Colors.blue[900]),
                              SizedBox(height: 20.0),
                              Text(
                                'الرطوبة',
                                style: TextStyle(
                                    color: Colors.blue[800],
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20.0),
                              Obx(
                                () => Text('${_controller.humidity.value}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      fontFamily: 'ArabicTwo',
                                      fontWeight: FontWeight.w800,)),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 1.0,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/pressure.png',
                                  width: 50.0,
                                  height: 50.0,
                                  color: Colors.blue[900]),
                              SizedBox(height: 20.0),
                              Text(
                                'الضغط',
                                style: TextStyle(
                                    color: Colors.blue[800],
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20.0),
                              Obx(
                                () => Text(
                                  '${_controller.pressure.value}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    fontFamily: 'ArabicTwo',
                                    fontWeight: FontWeight.w800,),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 50.0), // 87576772
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
