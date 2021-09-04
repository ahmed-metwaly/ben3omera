import 'package:flutter_qiblah/flutter_qiblah.dart';
import '../../controllers/pray_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'qiblah/loading_indicator.dart';
import 'qiblah/qiblah_widget.dart';

class PrayWidget extends StatelessWidget {
  final PrayController _prayController = Get.put(PrayController());
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 237,
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: 250.0,
            margin: EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: FutureBuilder(
              future: _deviceSupport,
              builder: (_, AsyncSnapshot<bool> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return LoadingIndicator();
                if (snapshot.hasError)
                  return Center(
                    child: Text("Error: ${snapshot.error.toString()}"),
                  );
                return QiblahCompass();
                // if (snapshot.data)
                //   return QiblahCompass();
                // else
                //   return QiblahMaps();
              },
            ), //Image.asset('assets/images/ka3ba.png'),
          ),
          GetBuilder<PrayController>(
            builder: (_prayController) => Container(
              height:  400,
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: _prayController.prayers.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title:
                            Text(_prayController.prayers[index]['pray_name']),
                        trailing: Text(_prayController.prayers[index]['time']),
                      ),
                      Divider(height: 2, color: Colors.blue)
                    ],
                  );
                },
              ),
            ),
          ),
        ],

      ),
    );
  }
}
