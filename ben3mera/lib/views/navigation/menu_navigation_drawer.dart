import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';

class MenuNavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: Get.width / 1.3,
        height: Get.height,
        // padding: EdgeInsets.only(right: 20.0),
        margin: EdgeInsets.only(bottom: 100.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0)),
            color: Colors.blue[900]),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Container(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              child: Image.asset('assets/images/logo@3x.png'),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              color: Colors.white70.withOpacity(.3),
              margin: EdgeInsets.only(bottom: 15.0),
              child: ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.mosque,
                  color: Colors.white,
                ),
                title: Text(
                  'مواقيت الصلاة',
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.5,
                ),
                onTap: () => Get.toNamed('pray'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              color: Colors.white70.withOpacity(.3),
              child: ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.bookReader,
                  color: Colors.white,
                ),
                title: Text(
                  'الأذكار',
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.5,
                ),
                onTap: () => Get.toNamed('azkar'),
              ),
            ),
            Container(
              color: Colors.white70.withOpacity(.3),
              margin: EdgeInsets.only(bottom: 15.0),
              child: ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.calendarAlt,
                  color: Colors.white,
                ),
                title: Text(
                  'تحويل التاريخ',
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.5,
                ),
                onTap: () => Get.toNamed('convert-date'),
              ),
            ),
            Container(
              color: Colors.white70.withOpacity(.3),
              margin: EdgeInsets.only(bottom: 15.0),
              child: ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.filePdf,
                  color: Colors.white,
                ),
                title: Text(
                  'التقويم PDF',
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.5,
                ),
                onTap: () => Get.toNamed('pdf'),
              ),
            ),
            // Container(
            //   color: Colors.white70.withOpacity(.3),
            //   margin: EdgeInsets.only(bottom: 15.0),
            //   child: ListTile(
            //       leading: FaIcon(
            //         FontAwesomeIcons.smile,
            //         color: Colors.white,
            //       ),
            //       title: Text(
            //         'تقيم التطبيق',
            //         style: TextStyle(color: Colors.white),
            //         textScaleFactor: 1.5,
            //       ),
            //       onTap: () =>
            //           LaunchReview.launch(androidAppId: "com.ws4it.ben3Mera", iOSAppId: '1438356798')),
            // ),
          ],
        ),
      ),
    );
  }
}
