import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../utils/helpers/convert_image.dart';
import '../utils/helpers/get_pngData.dart';
import '../widgets/health_report_module/report_chart.dart';
import '../widgets/health_report_module/report_table.dart';

class HealthReportPage extends StatefulWidget {
  static const routeName = '/report';
  @override
  _HealthReportPageState createState() => _HealthReportPageState();
}

class _HealthReportPageState extends State<HealthReportPage> {
  GlobalKey imageKey;
  var today = DateTime.now();

  Widget _sucessdialogue() {
    return AlertDialog(
      title: Container(
        alignment: Alignment.center,
        child: Icon(
          Icons.done,
          color: Color.fromRGBO(100, 110, 91, 1),
          size: 20,
        ),
      ),
      content: Container(
        width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'The email has been sent successfully.',
              style: TextStyle(
                color: Color.fromRGBO(103, 110, 94, 1),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Color.fromRGBO(100, 109, 93, 1),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background-75%.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Health Report',
                              style: TextStyle(
                                fontSize: 30,
                                color: Color.fromRGBO(100, 110, 91, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // padding: EdgeInsets.only(left: 15),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    DateFormat.MMMd().format(DateTime(today.year, today.month, today.day - today.weekday)) + ' - ' + DateFormat.yMMMd().format(today),
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(103, 110, 94, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ConvertImage(builder: (key) {
                  this.imageKey = key;
                  return ReportTable();
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () async {
                        final imageBytes = await saveImage(imageKey);
                        if (!(await Permission.storage.status.isGranted)) {
                          await Permission.storage.request();
                        }
                        final reportImage = await ImageGallerySaver.saveImage(
                            Uint8List.fromList(imageBytes),
                            quality: 60,
                            name: "my_health_report");
                        if (reportImage['isSuccess']) {
                          showDialog(
                            context: context,
                            builder: (context) => _sucessdialogue(),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Color.fromRGBO(100, 110, 91, 1),
                            size: 20,
                          ),
                          Text(
                            'Send report to E-mail',
                            style: TextStyle(
                              color: Color.fromRGBO(100, 109, 93, 1),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
                // LineChartSample1()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
