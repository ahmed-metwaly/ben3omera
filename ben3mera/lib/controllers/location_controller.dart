import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {
  bool serviceEnabled = false;

  bool permissionEnabled = false;

  final latitude = 24.690869.obs;
  final longitude = 46.7965879.obs;
  final configStatus = false.obs;


  LocationController() {
    config();
    getLatLong();
  }

  chickService() async {
    final service = await Geolocator.isLocationServiceEnabled();

    if (!service) {
      print('Location services are disabled.');

      return Future.error('Location services are disabled.');
    } else {
      print('Location services are enabled.');

      serviceEnabled = service;
      update();
    }
  }

  chickPermission() async {
    await Geolocator.checkPermission().then((permission) async {
      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission().then((permission) {
          if (permission == LocationPermission.denied) {
            print('Location permissions are denied');
            Get.dialog(AlertDialog(
              content: Text('يجب تفعيل خدمات الموقع'),
            ));
            return Future.error('Location permissions are denied');
          } else {
            print('Location permissions are enabled');
            permissionEnabled = true;
            update();
          }
        });
      } else {
        print('Location permissions are enabled');
        permissionEnabled = true;
        update();
      }
    });
  }

  // config geolocator plugin

  Future<bool> config() async {
    bool status = false;
    await chickService().then((res) async {
      if (serviceEnabled == true) {
        await chickPermission().then((res) {
          if (permissionEnabled == true) {
            status = true;
          }
          status = false;
        });
      }
      status = false;
    });

    return status;
  }

  getLatLong() async {
    final currentPosition = await Geolocator.getCurrentPosition();
     latitude(currentPosition.latitude);
     longitude(currentPosition.longitude);
  }
}
