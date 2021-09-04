import 'dart:ui';

import 'package:ben3mera/controllers/comments_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:ben3mera/helpers/style/text_style.dart';

class OneNewsWidget extends StatefulWidget {
  final data;

  OneNewsWidget(this.data);

  @override
  _OneNewsWidgetState createState() => _OneNewsWidgetState();
}

class _OneNewsWidgetState extends State<OneNewsWidget> {
  CommentsController _commentsController = Get.put(CommentsController());
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  void initState() {
    _commentsController.getComments(widget.data.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${widget.data.name}',
                  style: newsScreenTitle,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(height: 10.0),
              Image.network('${widget.data.file}'),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${widget.data.description}',
                  style: ngmScreenText,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 5.0, right: 5.0, bottom: 20.0),
                child: Divider(
                  height: 1,
                  color: Color(0xFFC0C0C0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 5.0, right: 5.0, bottom: 20.0),
                    child: Text(
                      'التعليقات',
                      style: TextStyle(
                          color: Color(0xff4B5BF9),
                          fontFamily: 'Droid-Sans-Arabic',
                          fontSize: 20.0),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.bottomSheet(
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        height: Get.height + 50,
                        // width: Get.width,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                            ),
                            color: Colors.white),
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: FormBuilder(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('اسم الكريم'),
                                  FormBuilderTextField(
                                    name: 'username',
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context),
                                    ]),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabled: true,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text('البريد الالكتروني'),
                                  FormBuilderTextField(
                                    name: 'email',
                                    keyboardType: TextInputType.emailAddress,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context),
                                      FormBuilderValidators.email(context),
                                    ]),
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabled: true,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text('التعليق'),
                                  FormBuilderTextField(
                                    name: 'comment',
                                    maxLines: 5,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context),
                                    ]),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();

                                      final validationStatus =
                                          _formKey.currentState.validate();

                                      if (validationStatus) {
                                        _formKey.currentState.save();

                                        Get.back();

                                        _commentsController.username(_formKey
                                            .currentState
                                            .fields['username']
                                            .value);
                                        _commentsController.email(_formKey
                                            .currentState
                                            .fields['email']
                                            .value);
                                        _commentsController.comment(_formKey
                                            .currentState
                                            .fields['comment']
                                            .value);

                                        _commentsController
                                            .newsId(widget.data.id);

                                        _commentsController.addComment();
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('اضافة التعليق'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 5.0, right: 5.0, bottom: 20.0),
                      child: Text(
                        'أضف تعليق',
                        style: TextStyle(
                            fontFamily: 'Droid-Sans-Arabic',
                            fontSize: 13.0,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() {
                return _commentsController.loading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Wrap(
                        children: [
                          for (int i = 0;
                              i < _commentsController.comments.length;
                              i++)
                            ListTile(
                              contentPadding: EdgeInsets.all(0),
                              minLeadingWidth: 10.0,
                              leading: Icon(
                                Icons.person_rounded,
                                color: Color(0xff4B5BF9),
                                size: 30.0,
                              ),
                              title: Text(
                                '${_commentsController.comments[i].userName}',
                                textScaleFactor: 1.2,
                                style: ngmScreenText,
                              ),
                              trailing: Container(
                                margin: EdgeInsets.only(
                                    top: 0.0, bottom: 20.0, left: 5.0),
                                child: Text(
                                  '${_commentsController.comments[i].createdAt}',
                                  textScaleFactor: 1,
                                ),
                              ),
                              subtitle: Container(
                                margin: EdgeInsets.only(top: 5.0),
                                child: Text(
                                    '${_commentsController.comments[i].comment}'),
                              ),
                              selected: false,
                            ),
                          Divider(
                            height: 20.0,
                          ),
                        ],
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
