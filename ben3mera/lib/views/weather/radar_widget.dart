import 'package:ben3mera/controllers/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:webviewx/webviewx.dart';
import 'dart:io';

class RadarWidget extends StatefulWidget {
  @override
  _RadarWidgetState createState() => _RadarWidgetState();
}

class _RadarWidgetState extends State<RadarWidget> {
  final _locationController = Get.find<LocationController>();
  WebViewXController webviewController;
  var url = '';

  Widget content = Center(
    child: CircularProgressIndicator(),
  );

  @override
  initState() {
    _locationController.getLatLong().then((e) {
      print(e);

      setState(() {
        url =
            'https://www.rainviewer.com/map.html?loc=${_locationController.latitude}%2C${_locationController.longitude}%2C6&oFa=0&oC=0&oU=0&oCUB=0&oCS=0&oF=0&oAP=0&rmt=0';
        content = _buildWebViewX(url);
      });
    });

    super.initState();
  }

  Widget _buildWebViewX(_url) {
    return WebViewX(
      key: ValueKey('webviewx'),
      initialContent: _url,
      initialSourceType: SourceType.URL,
      onWebViewCreated: (controller) => webviewController = controller,
      onPageStarted: (url) => print('A new page has started loading...\n'),
      onPageFinished: (url) => print('The page has finished loading.\n'),
      jsContent: {
        EmbeddedJsContent(
          js: "function testPlatformIndependentMethod() { console.log('Hi from JS') }",
        ),
        EmbeddedJsContent(
          webJs:
              "function testPlatformSpecificMethod(msg) { TestDartCallback('Web callback says: ' + msg) }",
          mobileJs:
              "function testPlatformSpecificMethod(msg) { TestDartCallback.postMessage('Mobile callback says: ' + msg) }",
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: content);
  }
}
