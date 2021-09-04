import 'package:ben3mera/helpers/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OneAzkarWidget extends StatelessWidget {

  final data;

  const OneAzkarWidget({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: 300.0,
              padding:
                  EdgeInsets.only(top: 20.0, left: 10, right: 6, bottom: 0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/appbar-pages-bg.png'),
                  fit: BoxFit.none,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Container(
                // height: maxHeight,
                child: Wrap(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          '${data.title}',
                          style: calinderHome22,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        // child: Icon(
                        //   Icons.notifications,
                        //   color: Colors.white,
                        // ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0, top: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      shape: BoxShape.rectangle,
                    ),
                    child: Image.asset('assets/images/azcar-baner-bg@2x.png'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ]),
              ),
            ),
            Flexible(
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                // print(constraints.maxHeight);

                final boxHeight = Get.height;

                // var listHeight = boxHeight - maxHeight;

                return Container(
                    height: constraints.maxHeight,
                    padding: EdgeInsets.only(
                      left: 5.0,
                      right: 5.0,
                    ),
                    margin: EdgeInsets.only(bottom: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      shape: BoxShape.rectangle,
                      color: Color(0xffFBFBFB),
                    ),
                    child: ListView(
                      // scrollDirection: Axis.vertical,

                      children: [
                        SizedBox(height: 20.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${data.text}",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            textScaleFactor: 1.3,
                            style: TextStyle(letterSpacing: 1.3, height: 2.3),
                          ),
                        ),
                      ],
                    ));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
