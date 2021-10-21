import 'package:quiver/iterables.dart';
import 'package:image/image.dart';

import '../../constants/segment_label.dart';

Map<dynamic, dynamic> calculateClasses(dynamic output) {
  var outputraw;
  // decode the Unitlist8 pixel by pixel
  outputraw = decodePng(output);
  if (outputraw != null) {
    // transfer to bytes
    outputraw = outputraw.getBytes(format: Format.rgba);
  }

  // noble way to iteration 512*512 image
  Iterable<List<int>> pixels = partition(outputraw, 4);

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
