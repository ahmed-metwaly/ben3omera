import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import './navigation/bottom_navigation_bar_widget.dart';
import './navigation/menu_navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Master extends StatefulWidget {
  final Widget content;
  var index;
  final title;

  Master(
      {Key key,
      @required this.content,
      @required this.index,
      @required this.title})
      : super(key: key);

  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {

  notificationPermission() async {
    var status = await Permission.notification.status;
    var location = await Permission.locationAlways.status;
    var locationWhenInUse = await Permission.locationWhenInUse.status;

    if (status.isDenied) {
      await Permission.notification.request().isGranted;
    }
    if (location.isDenied) {
      await Permission.locationAlways.request().isGranted;
    }
    if (locationWhenInUse.isDenied) {
      await Permission.locationWhenInUse.request().isGranted;
    }
  }

  @override
  void initState() {

    notificationPermission();


    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      // print("Accepted permission: $accepted");
    });

    super.initState();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print('from build method....');

    return Scaffold(
      key: scaffoldKey,
      drawer: MenuNavigationDrawer(),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/appbar-bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.index == 1 && widget.title == ''
                      ? InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue[900].withOpacity(
                                      .5), // Color(0xff8A1C7D).withOpacity(.5),
                                  spreadRadius: 3.0,
                                  blurRadius: 3.0,
                                  // offset: Offset(3, 3),
                                ),
                                BoxShadow(
                                  color: Colors.blue[900].withOpacity(
                                      .5), //Color(0xff2D235D).withOpacity(.5),
                                  spreadRadius: 3.0,
                                  blurRadius: 3.0,
                                  // offset: Offset(3, 3),
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                              gradient: LinearGradient(colors: [
                                // Color(0xff8A1C7D),
                                // Color(0xff2D235D),
                                Colors.white70,
                                Colors.blue[900]
                              ])),
                          child: InkWell(
                            onTap: () {
                              scaffoldKey.currentState.openDrawer();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 12.0,
                                  bottom: 12.0,
                                  right: 20.0,
                                  left: 20.0),
                              child: FaIcon(
                                FontAwesomeIcons.stream,
                                textDirection: TextDirection.ltr,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                  Container(
                    width: Get.width - 128,
                    margin: const EdgeInsets.only(top: 20.0),
                    alignment: AlignmentDirectional.center,
                    child: widget.index == 2
                        ? Image.asset(
                            'assets/images/logo.png',
                            width: 80.0,
                          )
                        : Text(
                            '${widget.title}',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 15.0),
                  //   alignment: Alignment.center,
                  //   // child: _controllerScreen.index.value == 2
                  //   //     ? GestureDetector(
                  //   //         child: FaIcon(
                  //   //           FontAwesomeIcons.bell,
                  //   //           textDirection: TextDirection.ltr,
                  //   //           color: Colors.white,
                  //   //         ),
                  //   //       )
                  //   //     : GestureDetector(
                  //   //         onTap: () => Get.back(),
                  //   //         child: FaIcon(
                  //   //           FontAwesomeIcons.arrowRight,
                  //   //           textDirection: TextDirection.ltr,
                  //   //           color: Colors.white,
                  //   //         ),
                  //   //       ),
                  // ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(27.0),
                        topRight: Radius.circular(27.0),
                      ),
                      color: Colors.white70,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue[900],
                          spreadRadius: 3.0,
                          blurRadius: 3.0,
                          // offset: Offset(3, 3),
                        ),
                      ]),
                  child: Column(
                    children: [
                      this.widget.content,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(index: widget.index),
    );
  }
}
