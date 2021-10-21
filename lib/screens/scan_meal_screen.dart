import 'dart:math';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/segment_label.dart';
import '../utils/helpers/segment_identify.dart';

class ScanMealScrenn extends StatefulWidget {
  static const routeName = '/scan';

  @override
  _ScanMealScrennState createState() => _ScanMealScrennState();
}

class _ScanMealScrennState extends State<ScanMealScrenn> {
  bool _isInit = true;
  bool _isLoading = false;
  bool _toggleImage = false;
  File _imagePath;
  Map<dynamic, dynamic> _results = {};
  Map<dynamic, dynamic> _surfaceResults = {};
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
    setState(() {
      _isLoading = true;
    });
    var rawResult = await Tflite.runSegmentationOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      labelColors: pascalVOCLabelColors,
      outputType: 'png',
    );

    var cleanOutput = calculateClasses(rawResult);
    setState(() {
      _results = findValidSegment(cleanOutput)[0];
      _surfaceResults = findValidSegment(cleanOutput)[1];
      _isInit = false;
      _isLoading = false;
      _rawImageData = rawResult;
    });

    print(_results);
    print(_surfaceResults);
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

  Widget _selectImageButton(
    String descip,
    String type,
    bool isGallery,
  ) =>
      GestureDetector(
        onTap: () {
          _selectImages(type);
        },
        child: Container(
          width: isGallery ? 200 : 150,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 11),
          decoration: BoxDecoration(
              color: Colors.blueGrey[700],
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            descip,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      );

  Map<String, dynamic> judgeMealQuality() {
    // Case 0: No results yet.
    var advice = {
      'isGood': false,
      'comment': 'please analysis the food first',
    };
    if (_isInit) {
      return advice;
    }

    Map<String, int> nutrients = {'protein': 0, 'starches': 0, 'vegetables': 0};
    _results.forEach((key, value) {
      // Case 1: check essential nutrients
      if (key.contains('Vegetables')) {
        nutrients['vegetables']++;
      } else if (key.contains('Protein')) {
        nutrients['protein']++;
      } else if (key.contains('Starches/grains')) {
        nutrients['starches']++;
      }
    });

    if (nutrients.containsValue(0)) {
      var lackOf = nutrients.keys
          .firstWhere((k) => nutrients[k] == 0, orElse: () => null);
      advice['comment'] =
          'Your meal is not healthy, because it lacks of $lackOf';
    } else {
      advice['isGood'] = true;
      advice['comment'] = 'Your meal is healthy! Good job!';
    }

    return advice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-75%.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:
                  EdgeInsets.only(left: 40, right: 40, top: 100, bottom: 20),
              width: 500,
              child: Text(
                'Scan your meal',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(100, 110, 91, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 450,
                      width: 400,
                      child: Card(
                        color: Colors.white,
                        shadowColor: Colors.grey,
                        child: Column(
                          children: [
                            !_isInit
                                ? Container(
                                    child: Column(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                _toggleImage = !_toggleImage;
                                              });
                                            },
                                            child: Text(
                                              'Check original image',
                                              style: TextStyle(
                                                  color: Colors.blueGrey[400]),
                                            )),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 20),
                                          height: 300,
                                          width: 300,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: _toggleImage
                                                ? Image.file(
                                                    _imagePath,
                                                    fit: BoxFit.fill,
                                                  )
                                                : Image.memory(
                                                    Uint8List.fromList(
                                                        _rawImageData),
                                                    fit: BoxFit.fill,
                                                  ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : (_isLoading
                                    ? progressBar()
                                    : SizedBox(
                                        height: 200,
                                      )),
                            _isLoading
                                ? Text('')
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _selectImageButton(
                                          'Take A Photo', 'camera', false),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      _selectImageButton('Choose from Gallery',
                                          'gallery', true)
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 250,
                      width: 400,
                      child: Card(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: _isInit
                              ? outputNotify('No image Selected')
                              : _isLoading
                                  ? outputNotify('Please wait, running model')
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _segmentTitle('Main Component: '),
                                        for (var i in _results.keys.toList())
                                          _segmentItem(i, _results),
                                        _segmentTitle('Other (Surface): '),
                                        for (var j
                                            in _surfaceResults.keys.toList())
                                          _segmentItem(j, _surfaceResults),
                                      ],
                                    ),
                        ),
                      ),
                    ),
                  ],
                ),
                Transform.rotate(
                  angle: pi / 32,
                  child: Container(
                    margin: EdgeInsets.only(left: 155, top: 390),
                    child: Image(
                      width: 119,
                      height: 119,
                      image: AssetImage('assets/icons/scratch.png'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 20, right: 10),
        child: FloatingActionButton(
          onPressed: () {
            _mealAdvice(context, judgeMealQuality()['isGood'],
                judgeMealQuality()['comment']);
          },
          child: Icon(Icons.help_outline),
          backgroundColor: Colors.blueGrey[400],
        ),
      ),
    );
  }
}

Widget _segmentItem(String label, Map results) => Container(
      margin: EdgeInsets.only(left: 10, bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(pascalVOCLabelColors[foodClasses.indexOf(label)]),
      ),
      child: Text(
        '$label: ${results[label]}',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );

Widget _segmentTitle(String title) => Container(
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 5),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );

Future<void> _mealAdvice(context, bool isGood, String comment) => showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: isGood
            ? Icon(Icons.sentiment_very_satisfied)
            : Icon(Icons.sentiment_very_dissatisfied),
        content: Text(comment),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('Confirm')),
        ],
      );
    });

Widget progressBar() => Container(
      margin: const EdgeInsets.only(top: 100, bottom: 100),
      child: CircularProgressIndicator(
        value: null,
        color: Colors.blueGrey[400],
      ),
    );

Widget outputNotify(String messgae) => Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 50),
                                    child: Text(
                                      messgae,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey[600],
                                      ),
                                    ),
                                  ),
                                );
