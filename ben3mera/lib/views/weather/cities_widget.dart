import 'package:ben3mera/controllers/cities_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../master.dart';
import 'weather_widget.dart';

class CitiesWidget extends StatelessWidget {
  final _controller = Get.put(CitiesController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: _controller.load.value == false
            ? Center(child: CircularProgressIndicator())
            : GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.all(20.0),
                childAspectRatio: Get.width / Get.height,
                mainAxisSpacing: 20,
                shrinkWrap: true,
                controller: new ScrollController(keepScrollOffset: false),
                scrollDirection: Axis.vertical,
                children: _controller.citiesWeather
                    .map((city) => InkWell(
                          onTap: () => Get.to(
                            Master(
                              content: WeatherWidget(
                                latitude: city['latitude'],
                                longitude: city['longitude'],
                              ),
                              index: 3,
                              title: 'الطقص',
                            ),
                          ),
                          child: Container(
                            // padding: const EdgeInsets.only(top: 20.0),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${city['name']}',
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1.2,
                                ),
                                SizedBox(
                                  height: 10.00,
                                ),
                                Image.network(
                                  '${city['icon']}',
                                  scale: 1,
                                  width: 40.0,
                                  height: 40.0,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  '${city['min']}',
                                  textScaleFactor: 1.5,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  '${city['max']}',
                                  textScaleFactor: 1.5,
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
      ),
    );
  }
}
