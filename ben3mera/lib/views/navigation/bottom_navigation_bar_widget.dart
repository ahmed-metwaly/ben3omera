import 'package:ben3mera/helpers/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final index;

  const BottomNavigationBarWidget({Key key, this.index}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  List<String> labels = ['التقويم', 'الأخبار', 'الرئيسية', 'الطقس', 'الرادار'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      // margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
            )
          ],
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white70,
                Colors.white10,
              ]),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Colors.white70),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Container(
              // color: Colors.red,
              child: FaIcon(
                FontAwesomeIcons.solidSun,
                color: Colors.blue[900],
              ),
            ),
            label: labels[0],
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.newspaper,
              color: Colors.blue[900],
            ),
            label: labels[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.blue[900],
            ),
            label: labels[2],
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.cloudSun,
              color: Colors.blue[900],
            ),
            label: labels[3],
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.cloudSunRain,
              color: Colors.blue[900],
            ),
            label: labels[4],
          )
        ],

        selectedItemColor:
            widget.index > 4 ? Colors.blue[900] : Colors.blueAccent,
        unselectedItemColor: Colors.blue[900],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white70,

        currentIndex: widget.index > 4 ? 0 : widget.index,

        selectedLabelStyle: TextStyle(color: Colors.blue[900]),
        unselectedLabelStyle:
            TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),

        // on clicked

        onTap: (index) {
          // setState(() {
          //   currentIndex = index;
          // });

          Get.toNamed(menu[index]['name']);
        },
      ),
    );
  }
}
