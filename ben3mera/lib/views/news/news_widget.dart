import 'package:ben3mera/controllers/news_controller.dart';
import 'package:ben3mera/views/master.dart';
import 'package:ben3mera/views/news/one_news_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NewsWidget extends StatelessWidget {
  final NewsController _controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: Get.width,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        constraints: BoxConstraints(
            minHeight: 50.0, minWidth: Get.width, maxHeight: Get.height - 257),
        // color: Colors.white,
        child: GetBuilder<NewsController>(
          builder: (_controller) {
            return ListView.builder(
                itemCount: _controller.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.to(Master(
                        content: OneNewsWidget(_controller.data[index]),
                        index: 1,
                    title: '',)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width,
                          height: 250.0,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              color: Colors.grey),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                            '${_controller.data[index].file}',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${_controller.data[index].name}',
                            style: TextStyle(
                                color: Colors.blue[900], fontSize: 18.0),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 10.0, right: 5.0),
                                  // padding: const EdgeInsets.only(
                                  //     bottom: 10.0, right: 5.0),
                                  child: Text(
                                      '${_controller.data[index].commentsCount}',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 2.0),
                                  child: Text(
                                    'تعليق',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 30.0),
                            // Wrap(
                            //   children: [
                            //     Container(
                            //       margin: const EdgeInsets.only(
                            //           bottom: 10.0, right: 5.0),
                            //       // padding: const EdgeInsets.only(
                            //       //     bottom: 10.0, right: 5.0),
                            //       child: Text(
                            //           '${_controller.data[index].shareCount}',
                            //           style: TextStyle(
                            //               color: Colors.grey[600],
                            //               fontWeight: FontWeight.bold)),
                            //     ),
                            //     Padding(
                            //       padding: const EdgeInsets.only(right: 2.0),
                            //       child: Text(
                            //         'مشاركة',
                            //         style: TextStyle(color: Colors.grey),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 5.0, right: 5.0, bottom: 20.0),
                          child: Divider(
                            height: 1,
                            color: Color(0xFFC0C0C0),
                          ),
                        )
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
