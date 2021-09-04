import 'package:ben3mera/controllers/home_controller.dart';
import 'package:ben3mera/helpers/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ngm_calendar_wigdet.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeController _controller = Get.put(HomeController());

  PageController _pageController = PageController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<HomeController>(
        builder: (_controller) {
          if (_controller.loading.value == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            _pageController =
                PageController(initialPage: _controller.initialPage.value);

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 350,
                    child: PageView.builder(
                      itemCount: _controller.data.length,
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: (i) {
                        _controller.setDataOnPageChanged(
                            _controller.data[i].ngmName,
                            _controller.data[i].ngmDescription);
                        _controller.initialPage.value = i;
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30.0),
                              margin: const EdgeInsets.only(
                                  left: 8.0, right: 9.0, top: 20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(27.0),
                                  topRight: const Radius.circular(27.0),
                                ),
                                color: Colors.white,
                              ),
                              height: 70.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${_controller.data[index].gYear} م',
                                    style: calinderHome30,
                                    textDirection: TextDirection.rtl,
                                  ),
                                  Text('${_controller.data[index].hYear} هـ',
                                      style: calinderHome30,
                                      textDirection: TextDirection.rtl),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 30.0,
                                right: 30.0,
                                top: 20.0,
                                bottom: 20.0,
                              ),
                              margin:
                                  const EdgeInsets.only(left: 8.0, right: 9.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/clender-bg.png'),
                                  fit: BoxFit.none,
                                  alignment: Alignment.centerLeft,
                                ),
                                border: Border.all(color: Color(0xff0F0B8F)),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: const Radius.circular(27.0),
                                  bottomRight: const Radius.circular(27.0),
                                ),
                                color: Color(0xff0F0B8F),
                              ),
                              // height: 100.0,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${_controller.data[index].gDay}',
                                        style: calinderHome27,
                                        textDirection: TextDirection.rtl,
                                      ),
                                      Text(
                                        '${_controller.data[index].hDay}',
                                        style: calinderHome27,
                                        // textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${_controller.data[index].gMonth}',
                                          style: calinderHome22,
                                          textDirection: TextDirection.rtl,
                                        ),
                                        Text(
                                          '${_controller.data[index].hMonth}',
                                          style: calinderHome22,
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12.0, bottom: 10.0),
                                    child: Divider(
                                      height: 1,
                                      color: Color(0xff2137BC),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () =>
                                            _pageController.previousPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.decelerate),
                                        child: Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.0)),
                                            color: Colors.white,
                                          ),
                                          child: Icon(
                                            Icons.arrow_back,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                              ' ${_controller.data[index].dayString}  ${_controller.data[index].ngmDay}',
                                              style: calinderHome24),
                                          SizedBox(height: 6.0),
                                          Text(
                                              '${_controller.data[index].ngmName.length > 20 ? _controller.data[index].ngmName.substring(0, 20) + '.' : _controller.data[index].ngmName}',
                                              style: calinderHome22),
                                          SizedBox(height: 10.0),
                                          Text(
                                              '${_controller.data[index].season}',
                                              style: calinderHome22),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () => _pageController.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.decelerate),
                                        child: Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.0)),
                                            color: Colors.white,
                                          ),
                                          child: Icon(
                                            Icons.arrow_forward,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Text(
                    '${_controller.ngmName.value}',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Color(0xff0019B2),
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        fontFamily: 'GE-Dinar'),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      '${_controller.ngmDescription.value}',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
