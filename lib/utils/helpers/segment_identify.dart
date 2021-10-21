import 'package:quiver/iterables.dart';
import 'package:image/image.dart';

import '../../constants/segment_label.dart';

Map<dynamic, dynamic> calculateClasses(dynamic output) {
  var rawOutput;
  // decode the Unitlist8 pixel by pixel
  rawOutput = decodePng(output);
  if (rawOutput != null) {
    // transfer to bytes
    rawOutput = rawOutput.getBytes(format: Format.rgba);
  }

  // noble way to iteration 512*512 image
  Iterable<List<int>> pixels = partition(rawOutput, 4);

  Map outputClasses = {};
  int count = 0;
  String colorCodeEle;
  var colorCodePos, eleClass;

  pixels.forEach(
    (element) {
      colorCodeEle = element.toString();
      colorCodePos = rgbaCodes.indexOf(colorCodeEle);
      eleClass = foodClasses[colorCodePos];

      // Calculate the frequency of pixel
      if (!outputClasses.containsKey(eleClass)) {
        outputClasses[eleClass] = 1;
      } else {
        outputClasses[eleClass] += 1;
      }
      count++;
    },
  );

  // format the results withe percentage:
  outputClasses.forEach((key, value) {
    double percentage = value / (512 * 512);
    outputClasses[key] = double.parse((percentage * 100).toStringAsFixed(2));
  });

  return outputClasses;
}

List<Map<dynamic, dynamic>> findValidSegment(Map rawResult) {
  var validSegment = {};
  var irreleventSegment = {};

  rawResult.forEach((key, percent) {
    // add food irrelevent item
    if ((key == 'Background' ||
        key == 'Food Containers' ||
        key == 'Dining Tools' && percent >= 1)) {
      irreleventSegment[key] = percent;
    } else {
      // excludes minimal segment
      if (percent >= 1) {
        validSegment[key] = percent;
      }
    }
  });

  // 0: valid, 1:surface
  return [validSegment, irreleventSegment];
}
