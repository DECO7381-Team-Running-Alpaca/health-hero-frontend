import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/segment_label.dart';
import '../utils/helpers/segment_identify.dart';

class ScanPage extends StatefulWidget {
  static const routeName = '/scan';

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool _loading = true;
  File _imagePath = File('../assets/banana.jpg');
  Map<dynamic, dynamic> _results = {};
  var _rawImageData;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  void _loadModel() async {
    await Tflite.loadModel(
        model: 'assets/models/model.tflite',
        labels: 'assets/models/labels.txt');
  }

  void _findFoodSegment(File image) async {
    var rawResult = await Tflite.runSegmentationOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      labelColors: pascalVOCLabelColors,
      outputType: 'png',
    );
    setState(() {
      _rawImageData = rawResult;
      _results = calculateClasses(rawResult);
      _loading = false;
    });
    print(_results);
    print(findValidSegment(_results)[0]);
    print(findValidSegment(_results)[1]);
  }

  void _selectImages(String mode) async {
    var mealImage;
    if (mode == 'camera') {
      mealImage = await picker.getImage(source: ImageSource.camera);
    } else if (mode == 'gallery') {
      mealImage = await picker.getImage(source: ImageSource.gallery);
    }

    setState(() {
      _imagePath = File(mealImage.path);
    });
    _findFoodSegment(_imagePath);
  }

  Widget displayResults() => Container(
        height: 200,
        width: 200,
        child: new ListView.builder(
          itemCount: _results.length,
          itemBuilder: (BuildContext context, int index) {
            String key = _results.keys.elementAt(index);
            return new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text("$key"),
                  subtitle: new Text("${_results[key]}%"),
                ),
                new Divider(
                  height: 2.0,
                ),
              ],
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: Text(
          'Health-Hero Food Scanning Demo',
        ),
      ),
      body: Container(
        // color: Colors.black.withOpacity(0.9),
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 50),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: _loading == true
                      ? null //show nothing if no picture selected
                      : Container(
                          child: Column(
                            children: [
                              Container(
                                height: 250,
                                width: 250,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.memory(
                                    Uint8List.fromList(_rawImageData),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Divider(
                                height: 25,
                                thickness: 1,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _selectImages("camera");
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 200,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[600],
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          'Take A Photo',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        _selectImages("gallery");
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 200,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[600],
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          'Pick From Gallery',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 25,
                      thickness: 1,
                    ),
                    _results.isEmpty ? Text('') : displayResults()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
