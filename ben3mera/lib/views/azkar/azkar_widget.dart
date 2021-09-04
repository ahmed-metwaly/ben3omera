import 'package:ben3mera/controllers/azkar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'one_azkar_widget.dart';

class AzkarWidget extends StatelessWidget {
  AzkarController _controller = Get.put(AzkarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AzkarController>(
      builder: (_controller) {
        return Expanded(
          child: _controller.loading.value == true
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                width: Get.width,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Image.asset('assets/images/azcar-baner-bg@2x.png'),
              ),
              Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                    crossAxisSpacing: 10,
                    shrinkWrap: true,
                    controller: new ScrollController(keepScrollOffset: false),
                    scrollDirection: Axis.vertical,
                    childAspectRatio: 3,
                    children: _controller.data
                        .map(
                          (zekr) =>
                          InkWell(
                            onTap: () =>
                                Get.to(OneAzkarWidget(
                                  data: zekr,
                                )),
                            child: Container(
                              height: 40.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/azkar-bg@2x.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              child: Text('${zekr.title}'),
                            ),
                          ),
                    )
                        .toList()),
              ),
            ],
          ),
        );
      },
    );
  }
}
