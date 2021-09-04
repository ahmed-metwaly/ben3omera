import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class ConvertDateWidget extends StatefulWidget {
  const ConvertDateWidget({Key key}) : super(key: key);

  @override
  _ConvertDateWidgetState createState() => _ConvertDateWidgetState();
}

class _ConvertDateWidgetState extends State<ConvertDateWidget>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  final _formKey = GlobalKey<FormBuilderState>();
  final _formKey2 = GlobalKey<FormBuilderState>();
  String _rHDay = '0', _rHMonth = '0', _rHYear = '0';
  String _rMDay = '0', _rMMonth = '0', _rMYear = '0';

  @override
  void initState() {
    _controller = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Image.asset('assets/images/convert-date-bg.png'),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            height: 400.0,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Container(
                  height: 50.0,
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TabBar(
                    onTap: (value) => print(value),
                    controller: _controller,
                    tabs: [
                      Tab(
                        child: Text('ميلادى الى هجرى'),
                      ),
                      Tab(
                        child: Text('هجرى الى ميلادى'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            // input fields
                            FormBuilder(
                              key: _formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 50.0,
                                      child: FormBuilderTextField(
                                        name: 'mday',

                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          labelText: 'يوم',
                                        ),
                                        // onChanged: _onChanged,
                                        valueTransformer: (val) {
                                          return int.parse(val);
                                        },
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                        ]),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Container(
                                      height: 50.0,
                                      child: FormBuilderTextField(
                                        name: 'mmonth',

                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          labelText: 'شهر',
                                        ),
                                        // onChanged: _onChanged,
                                        valueTransformer: (val) {
                                          return int.parse(val);
                                        },
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                        ]),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Container(
                                      height: 50.0,
                                      child: FormBuilderTextField(
                                        name: 'myear',

                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          labelText: 'سنة',
                                        ),
                                        // onChanged: _onChanged,
                                        valueTransformer: (val) {
                                          return int.parse(val);
                                        },
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                        ]),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 50),

                            // submit button
                            Center(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xff4B5BF9)),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.symmetric(
                                                vertical: 15,
                                                horizontal: 20.0)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side: BorderSide(
                                                color: Color(0xff4B5BF9)))),
                                  ), // 4B5BF9
                                  child: Text(
                                    'تحويل الأن',
                                    textScaleFactor: 1.3,
                                  ),
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();

                                    final validationStatus =
                                        _formKey.currentState.validate();

                                    if (validationStatus) {
                                      _formKey.currentState.save();

                                      final _md = int.tryParse(_formKey
                                          .currentState.fields['mday'].value);
                                      final _mm = int.tryParse(_formKey
                                          .currentState.fields['mmonth'].value);
                                      final _my = int.tryParse(_formKey
                                          .currentState.fields['myear'].value);

                                      var hDate = new HijriCalendar.fromDate(
                                          new DateTime(_my, _mm, _md));

                                      final fDate = hDate.toString().split('/');

                                      // print(fDate);

                                      setState(() {
                                        _rHDay = fDate[2];
                                        _rHMonth = fDate[1];
                                        _rHYear = fDate[0];


                                      });
                                    }
                                    //
                                  }),
                            ),
                            //
                            SizedBox(
                              height: 50.0,
                            ),
                            // // result text
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'يوم',
                                      textScaleFactor: 1.2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      '$_rHDay',
                                      textScaleFactor: 1.2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'شهر',
                                      textScaleFactor: 1.2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      '$_rHMonth',
                                      textScaleFactor: 1.2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'سنة',
                                      textScaleFactor: 1.1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      '$_rHYear',
                                      textScaleFactor: 1.1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            // input fields
                            FormBuilder(
                              key: _formKey2,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 50.0,
                                      child: FormBuilderTextField(
                                        name: 'hday',

                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          labelText: 'يوم',
                                        ),
                                        // onChanged: _onChanged,
                                        valueTransformer: (val) {
                                          return int.parse(val);
                                        },
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                        ]),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Container(
                                      height: 50.0,
                                      child: FormBuilderTextField(
                                        name: 'hmonth',

                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          labelText: 'شهر',
                                        ),
                                        // onChanged: _onChanged,
                                        valueTransformer: (val) {
                                          return int.parse(val);
                                        },
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                        ]),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Container(
                                      height: 50.0,
                                      child: FormBuilderTextField(
                                        name: 'hyear',

                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          labelText: 'سنة',
                                        ),
                                        // onChanged: _onChanged,
                                        valueTransformer: (val) {
                                          return int.parse(val);
                                        },
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                              context),
                                        ]),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 50),

                            // submit button
                            Center(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xff4B5BF9)),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.symmetric(
                                                vertical: 15,
                                                horizontal: 20.0)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side: BorderSide(
                                                color: Color(0xff4B5BF9)))),
                                  ), // 4B5BF9
                                  child: Text(
                                    'تحويل الأن',
                                    textScaleFactor: 1.3,
                                  ),
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();

                                    final validationStatus2 =
                                        _formKey2.currentState.validate();

                                    print('dfdf');

                                    if (validationStatus2) {
                                      _formKey2.currentState.save();

                                      final _hd = int.tryParse(_formKey2
                                          .currentState.fields['hday'].value);
                                      final _hm = int.tryParse(_formKey2
                                          .currentState.fields['hmonth'].value);
                                      final _hy = int.tryParse(_formKey2
                                          .currentState.fields['hyear'].value);

                                      var gDate = new HijriCalendar();

                                      var mDate =
                                          gDate.hijriToGregorian(_hy, _hm, _hd);

                                      // print(mDate);

                                      final fDate2 =
                                          mDate.toString().split(' ');

                                      final resDate = fDate2[0].split('-');

                                      // print(resDate);

                                      setState(() {
                                        _rMDay = resDate[2];
                                        _rMMonth = resDate[1];
                                        _rMYear = resDate[0];
                                      });
                                    }
                                    //
                                  }),
                            ),
                            //
                            SizedBox(
                              height: 50.0,
                            ),
                            // // result text
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'يوم',
                                      textScaleFactor: 1.2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      '$_rMDay',
                                      textScaleFactor: 1.2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'شهر',
                                      textScaleFactor: 1.2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      '$_rMMonth',
                                      textScaleFactor: 1.2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'سنة',
                                      textScaleFactor: 1.1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      '$_rMYear',
                                      textScaleFactor: 1.1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
