import 'package:ben3mera/controllers/ngom_controller.dart';
import 'package:ben3mera/helpers/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class NgomWidget extends StatefulWidget {
  @override
  _NgomWidgetState createState() => _NgomWidgetState();
}

class _NgomWidgetState extends State<NgomWidget> {
  NgomController _controller = Get.put(NgomController());
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: 10.0, bottom: 20.0, right: 10.0, left: 10.0),
              child: Image.asset('assets/images/bg@3x.png'),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: Get.height - 480,
                maxHeight: Get.height - 480,
              ),
              child: GetBuilder<NgomController>(
                builder: (_controller) {
                  if (_controller.loading.value == true) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    pageController =
                        PageController(initialPage: _controller.isNow.value);

                    return PageView.builder(
                      itemCount: _controller.data.length,
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index) => print(index),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      pageSnapping: true,
                      itemBuilder: (data, i) => Column(
                        children: [
                          Center(
                            child: Text(
                              '${_controller.data[i].name}',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('عدد ايامة : ${_controller.data[i].dateCalc}',
                              style: ngmScreenText),
                          SizedBox(height: 10.0),
                          Text(
                              'بدايته : ${_controller.data[i].startDate} / ${_controller.data[i].hijriStart} ',
                              style: ngmScreenText),
                          SizedBox(height: 10.0),
                          Text(
                              'نهايته : ${_controller.data[i].endDate} / ${_controller.data[i].hijriEnd} ',
                              style: ngmScreenText),
                          SizedBox(height: 10.0),
                          Text(
                            '${_controller.data[i].text}',
                            style: ngmScreenText,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            Container(
              width: Get.width,
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => pageController.previousPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.fastLinearToSlowEaseIn),
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Color(0xff4B5BF9),
                        ),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 35.0,
                        ),
                      ),
                      Text('السابق', style: ngmScreenTitle)
                    ]),
                  ),
                  InkWell(
                    onTap: () =>
                        pageController.jumpToPage(_controller.isNow.value),
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Icon(
                          Icons.star_outline_rounded,
                          color: Color(0xff4B5BF9),
                          size: 35.0,
                        ),
                      ),
                      Text('الحالى', style: ngmScreenTitle)
                    ]),
                  ),
                  InkWell(
                    onTap: () => pageController.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.fastLinearToSlowEaseIn),
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Color(0xff4B5BF9),
                        ),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 35.0,
                        ),
                      ),
                      Text('التالى', style: ngmScreenTitle)
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
