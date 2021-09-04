import 'package:ben3mera/controllers/ngm_pdf_controller.dart';
import 'package:flutter/material.dart';
import 'package:ben3mera/helpers/style/text_style.dart';
import 'package:get/get.dart';

class NgmPdf extends StatefulWidget {
  _NgmPdfState createState() => _NgmPdfState();
}

class _NgmPdfState extends State<NgmPdf> {
  NgmPdfController _controller = Get.put(NgmPdfController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.only(top: 20.0, left: 6, right: 6, bottom: 0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/appbar-pages-bg.png'),
              fit: BoxFit.none,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Expanded(
            child: Column(children: [
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
                      'عرض كتيب التقويم',
                      style: calinderHome22,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                    width: Get.width,
                    height: Get.height,
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                    ),
                    child: GetBuilder<NgmPdfController>(builder: (_controller) {
                      return _controller.loading.value == true
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : PageView.builder(
                              itemCount: _controller.data.length,
                              scrollDirection: Axis.horizontal,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              itemBuilder: (context, i) => Container(
                                width: Get.width,
                                height: Get.height,
                                child: Image.network(
                                  '${_controller.data[i].path}',
                                  fit: BoxFit.fill,
                                  height: Get.height,
                                ),
                              ),
                            );
                    })),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
